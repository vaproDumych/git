<?php  
class ControllerExtensionModuleiSenseLabsSeo extends Controller
{
    private $modulePath;
    private $callModel;
    private $storeUrl;
    private $storeId;
    private $languageId;

    public function __construct($registry) {
        parent::__construct($registry);

        $this->config->load('isenselabs/isenselabs_seo');
        $this->modulePath = $this->config->get('isenselabs_seo_path');
        $this->callModel  = $this->config->get('isenselabs_seo_model');
        $this->load->model($this->modulePath);

        if ($this->request->server['HTTPS']) {
            $this->storeUrl = $this->config->get('config_ssl');
        } else {
            $this->storeUrl = $this->config->get('config_url');
        }

        $this->languageId = $this->config->get('config_language_id');
        $this->storeId = $this->config->get('config_store_id');
    }

    /**
     * Sitemap for search engine
     * 
     * URL: index.php?route=extension/module/isenselabs_seo/sitemap_feed
     */
    public function sitemap_feed() {
        $output  = '<?xml version="1.0" encoding="UTF-8"?>';
        $output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">';

        // Products
        $this->load->model('tool/image');

        $products = $this->{$this->callModel}->getProducts();

        foreach ($products as $product) {
            if ($product['image'] && file_exists(DIR_IMAGE . $product['image'])) {
                $product_name = $this->escape($product['name']);
                $date = (strtotime($product['date_modified']) == -62169984000) || (strtotime($product['date_modified']) == -62169962400) ? date('Y-m-d\TH:i:sP', strtotime(0)) : date('Y-m-d\TH:i:sP', strtotime($product['date_modified']));
                
                $output .= '<url>';
                $output .= '  <loc>' . $this->escape($this->url->link('product/product', 'product_id=' . $product['product_id'])) . '</loc>';
                $output .= '  <changefreq>weekly</changefreq>';
                $output .= '  <lastmod>' . $date . '</lastmod>';
                $output .= '  <priority>1.0</priority>';
                $output .= '  <image:image>';
                $output .= '  <image:loc>' . $this->model_tool_image->resize($product['image'], 300, 200) . '</image:loc>';
                $output .= '  <image:caption>' . $product_name . '</image:caption>';
                $output .= '  <image:title>' . $product_name . '</image:title>';
                $output .= '  </image:image>';
                $output .= '</url>';
            }
        }

        // Categories
        $this->load->model('catalog/category');

        $output .= $this->getCategories(0);

        // Manufacturer
        $this->load->model('catalog/manufacturer');

        $manufacturers = $this->model_catalog_manufacturer->getManufacturers();

        foreach ($manufacturers as $manufacturer) {
            $output .= '<url>';
            $output .= '  <loc>' . $this->escape($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'])) . '</loc>';
            $output .= '  <changefreq>weekly</changefreq>';
            $output .= '  <priority>0.7</priority>';
            $output .= '</url>';

            if ($this->{$this->callModel}->getSetting('feed_manufacturer_product')) {
                $products = $this->{$this->callModel}->getProducts(array('filter_manufacturer_id' => $manufacturer['manufacturer_id']));

                foreach ($products as $product) {
                    $output .= '<url>';
                    $output .= '  <loc>' . $this->escape($this->url->link('product/product', 'manufacturer_id=' . $manufacturer['manufacturer_id'] . '&product_id=' . $product['product_id'])) . '</loc>';
                    $output .= '  <changefreq>weekly</changefreq>';
                    $output .= '  <priority>1.0</priority>';
                    $output .= '</url>';
                }
            }
        }

        // Information
        $this->load->model('catalog/information');

        $informations = $this->model_catalog_information->getInformations();

        foreach ($informations as $information) {
            $output .= '<url>';
            $output .= '  <loc>' . $this->escape($this->url->link('information/information', 'information_id=' . $information['information_id'])) . '</loc>';
            $output .= '  <changefreq>weekly</changefreq>';
            $output .= '  <priority>0.5</priority>';
            $output .= '</url>';
        }

        // SEO Backpack - custom URL
        $this->load->model('extension/module/isenselabs_seo');
        $urls = $this->model_extension_module_isenselabs_seo->getCustomUrls();

        foreach ($urls as $url) {
            $output .= '<url>';
            $output .= '  <loc>' . $this->escape($this->url->link($url)) . '</loc>';
            $output .= '  <changefreq>weekly</changefreq>';
            $output .= '  <priority>0.5</priority>';
            $output .= '</url>';
        }

        // ===

        $output .= '</urlset>';

        $this->response->addHeader('Content-Type: application/xml');
        $this->response->setOutput($output);
    }

    /**
     * Part of sitemap_feed()
     */
    protected function getCategories($parent_id, $current_path = '') {
        $output = '';

        $results = $this->model_catalog_category->getCategories($parent_id);

        foreach ($results as $result) {
            if (!$current_path) {
                $new_path = $result['category_id'];
            } else {
                $new_path = $current_path . '_' . $result['category_id'];
            }

            $output .= '<url>';
            $output .= '  <loc>' . $this->escape($this->url->link('product/category', 'path=' . $new_path)) . '</loc>';
            $output .= '  <changefreq>weekly</changefreq>';
            $output .= '  <priority>0.7</priority>';
            $output .= '</url>';

            if ($this->{$this->callModel}->getSetting('feed_category_product')) {
                $products = $this->{$this->callModel}->getProducts(array('filter_category_id' => $result['category_id']));

                foreach ($products as $product) {
                    $output .= '<url>';
                    $output .= '  <loc>' . $this->escape($this->url->link('product/product', 'path=' . $new_path . '&product_id=' . $product['product_id'])) . '</loc>';
                    $output .= '  <changefreq>weekly</changefreq>';
                    $output .= '  <priority>1.0</priority>';
                    $output .= '</url>';
                }
            }

            $output .= $this->getCategories($result['category_id'], $new_path);
        }

        return $output;
    }

    protected function escape($string)
    {
        return htmlspecialchars($string, ENT_XML1 | ENT_QUOTES, 'UTF-8');
    }

    /*
    * Used for tracking 404 pages & redirecting
    */    
    public function notFoundPageHandler() {
        $valid = true;
        $url_route = !empty($this->request->get['_route_']) ? $this->request->get['_route_'] : '';

        // Check non alias
        $url_base    = $this->request->server['HTTPS'] ? $this->config->get('config_ssl') : $this->config->get('config_url');
        $url_request = ($this->request->server['HTTPS'] ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        if (!$url_route) {
            $url_route   = urldecode(str_replace($url_base, '', $url_request));
        }


        // Blacklist 404 that start with this word
        $blacklist = array('admin/', 'asset/', 'assets/', 'image/', 'cache/', 'view/');
        foreach ($blacklist as $block) {
            if (strpos($url_route, $block) !== false) {
                $valid = false;
                break;
            }
        }

        if ($valid) {
            $route = $this->{$this->callModel}->MissingPageWorker($url_route, $this->storeId);

            if ($route) {
                // Info: Chrome and Firefox cache a 301 redirect with no expiry date
                $this->response->redirect($url_base . ltrim($route, '/'), 301);
            }
        }
    }
}
