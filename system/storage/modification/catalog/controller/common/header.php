<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();

            $data['seo_meta'] = $this->document->getSeoMeta(); 
            $data['seo_hreflang'] = $this->document->getSeoHreflang();   
            
            // iSense SEO Module Loader
            $this->config->load('isenselabs/isenselabs_seo');
            $isense_module_path = $this->config->get('isenselabs_seo_path');
            $isense_call_model  = $this->config->get('isenselabs_seo_model');
            $this->load->model($isense_module_path);

            $data['richsnippets_company_info']        = $this->{$isense_call_model}->getSetting('richsnippets_company_info');
            
            if ($data['richsnippets_company_info']) {
                $data['richsnippet_phone'] = $this->config->get('config_telephone');
                
                if ($this->request->server['HTTPS']) {
                    $data['seo_url_site'] = $this->config->get('config_ssl');
                } else {
                    $data['seo_url_site'] = $this->config->get('config_url');
                }
                if (is_file(DIR_IMAGE . $this->config->get('config_logo')) && !empty($data['seo_url_site'])) {
                    $data['seo_logo'] = $data['seo_url_site'] . 'image/' . $this->config->get('config_logo');
                } else {
                    $data['seo_logo'] = '';
                }
                
                $data['seo_search'] = html_entity_decode($this->url->link('product/search', 'search={search_term_string}', 'SSL'), ENT_QUOTES, 'UTF-8');
            }
            
            $data['search_engine_analytics_enable'] = $this->{$isense_call_model}->getSetting('search_engine_analytics_enable');
            
            if (!empty($data['search_engine_analytics_enable']) && $data['search_engine_analytics_enable'] == '1') {
                $crawlers = array(
                    'Googlebot',
                    'Googlebot-Image',
                    'Bingbot',
                    'YandexBot',
                    'YandexImages'
                );
                $crawlers_agents = implode('|', $crawlers);
                $user_agent = (isset($_SERVER['HTTP_USER_AGENT']) && !empty($_SERVER['HTTP_USER_AGENT'])) ? $_SERVER['HTTP_USER_AGENT'] : '';
                $current_protocol = 'http://';
                if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
                    $current_protocol = 'https://';
                }
                $current_url = $current_protocol . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];

                if (preg_match('/('.$crawlers_agents.')/i', $user_agent, $matches)) {
                    $bot_name = current($matches);
                    $this->db->query("INSERT INTO `" . DB_PREFIX . "seo_analysis` SET crawler='" . $this->db->escape($bot_name) . "', url='" . $this->db->escape($current_url) . "', date_added=NOW()");
                }
            }
			
		$data['styles'] = $this->document->getStyles();

                require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                require_once NITRO_CORE_FOLDER . 'core.php';
                require_once NITRO_CORE_FOLDER . 'cdn.php';

                $data['styles'] = nitroCDNResolve($data['styles']);
            
		$data['scripts'] = $this->document->getScripts();

                require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                require_once NITRO_CORE_FOLDER . 'core.php';
                require_once NITRO_CORE_FOLDER . 'cdn.php';

                $data['scripts'] = nitroCDNResolve($data['scripts']);
            
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = defined('JOURNAL3_ACTIVE') ? array() : $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
