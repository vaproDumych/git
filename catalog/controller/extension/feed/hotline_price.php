<?php
class ControllerExtensionFeedHotlinePrice extends Controller {

    private $category;
    private $curencys;

    private $handle;
    private $out_categorys=[];

    public function __construct($registry) {
        parent::__construct($registry);
        $this->handle = fopen(DIR_LOGS . 'hotline_price.xml', 'w');
    }

    public function write($message) {
        fwrite($this->handle, $message . "\n");
    }

    public function __destruct() {
        fclose($this->handle);
    }


    protected function init() {
        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('catalog/manufacturer');
        $this->load->model('tool/image');
        $this->load->model('localisation/language');
        $this->load->model('localisation/currency');
        $this->curencys=$this->model_localisation_currency->getCurrencies();
        $languages = $this->model_localisation_language->getLanguages();

        if (isset($this->request->get['lang'])) {
            $this->config->set('config_language_id',$languages[$this->request->get['lang']]['language_id']);
        }
        if(!empty($this->config->get('hotline_price_store'))){

            $this->category = array_unique(array_reduce($this->config->get('hotline_price_store'),function($carry,$item) {
                return array_merge($carry,$item);
            },[]));
        }else{
            die;
        }
    }

    public function index() {
        if ($this->config->get('hotline_price_status')) {
            $this->init();

            $output = '<?xml version="1.0" encoding="UTF-8"?>';
            $output .= '<price>';
            $output .= '<date>'.date('Y-m-d H:i').'</date>';
            $output .= '<firmName>'.$this->config->get('config_name').'</firmName>';
            $output .= '<firmId>'.$this->config->get('hotline_price_store_id').'</firmId>';
            if(count($this->curencys)==1 AND isset($this->curencys['USD']))
            {
                $output .= '<rate>'.$this->curencys['USD']['value'].'</rate>';

            }
            if($this->config->get('hotline_price_delivery_setting')){
                $deliverys=$this->config->get('hotline_price_delivery_setting');
                foreach ($deliverys as $key=>$delivery){
                    $time='';
                    $cost='';
                    $carrier='';
                    $inCheckout='';
                    $express='';
                    $freeFrom='';
                    if(!empty($delivery['cost'])){
                        $cost='cost="'.$delivery['cost'].'"';
                    }

                    if(!empty($delivery['time'])){
                        $time='time="'.$delivery['time'].'"';
                    }

                    if(!empty($delivery['region'])){
                        $time='region="'.$delivery['region'].'"';
                    }

                    if(!empty($delivery['freeFrom'])){
                        $freeFrom='freeFrom="'.$delivery['freeFrom'].'"';
                    }

                    if(!empty($delivery['inCheckout'])){
                        $inCheckout='inCheckout="'.$delivery['inCheckout'].'"';
                    }
                    if($delivery['express']){
                        $express='express="'.$delivery['express'].'"';
                    }
                    if(!empty($delivery['freeFrom'])){
                        $freeFrom ='freeFrom ="'.$delivery['freeFrom'].'"';
                    }

                    $output.=' <delivery id="'.$key.'" type="'.$delivery['type'].'" '.$cost.' '.$time.' '.$freeFrom.' '.$carrier.' '.$inCheckout.' '.$express.' />';
                }
            }
            $output .= '<categories>';

            $output .= $this->categories(0);

            $output .= '</categories>';
            $output .= '<items>';
            foreach ($this->config->get('hotline_price_store') as $store => $categories) {
                $this->config->set('config_store_id',$store);
                $this->category = $categories;
                $output .= $this->productsByCategory(0);
            }
            $output .= '</items>';
            $output .= '</price>';

            $this->write($output);

            $this->response->addHeader('Content-Type: application/xml');
            $this->response->setOutput($output);
        }
    }

    protected function categories($parent_id) {
        $output = '';

        $results = $this->model_catalog_category->getCategories($parent_id);

        foreach ($results as $result) {
            if (in_array($result['category_id'],$this->category)) {
                $output .= $this->categoryTag($result);
                $output .= $this->categories($result['category_id']);
            }
        }

        return $output;
    }

    protected function categoryTag($category) {
        $output = '<category>';
        $output .= '<id>'.$category['category_id'].'</id>';
        if ($category['parent_id']) {
            $output .= '<parentId>'.$category['parent_id'].'</parentId>';
        }
        $output .= '<name>'.$category['name'].'</name>';
        $output .= '</category>';

        return $output;
    }

    protected function productsByCategory($parent_id) {
        $output = '';

        $results = $this->model_catalog_category->getCategories($parent_id);

        foreach ($results as $result) {
            if (in_array($result['category_id'],$this->category)) {
                $sql="SELECT
                        p.product_id,category_id,model,pd.name as name, description,p.price as price,p.image,
                        (SELECT name FROM ".DB_PREFIX."manufacturer m WHERE m.manufacturer_id= p.manufacturer_id) as manufacturer,
                        (SELECT price
                        FROM ".DB_PREFIX."product_special ps
                        WHERE 
                            ps.product_id = p.product_id AND
                            ps.customer_group_id = '".(int)$this->config->get('config_customer_group_id')."' AND
                            ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND
                            (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))
                        ORDER BY ps.priority ASC, ps.price ASC
                        LIMIT 1)                AS special,
                        (SELECT s.name FROM ".DB_PREFIX."stock_status s WHERE p.stock_status_id=s.stock_status_id LIMIT 1) as stock_status
                        FROM ".DB_PREFIX."product_to_category p2c
                            LEFT JOIN ".DB_PREFIX."product p ON (p2c.product_id = p.product_id)
                            LEFT JOIN ".DB_PREFIX."product_description pd ON (p.product_id = pd.product_id)
                            LEFT JOIN ".DB_PREFIX."product_to_store p2s ON (p.product_id = p2s.product_id)
                        WHERE 
                            pd.language_id = '".(int)$this->config->get('config_language_id')."' AND 
                            p.status = '1' AND 
                            p.date_available <= NOW() AND 
                            p2s.store_id = ".(int)$this->config->get('config_store_id')." AND
                            p2c.category_id = '".(int)$result['category_id']."'
                        GROUP BY p.product_id
                        ORDER BY p.sort_order ASC, LCASE(pd.name) ASC";

                $products =$this->db->query($sql)->rows;
                $output .= $this->productTags($products);
                $output .= $this->productsByCategory($result['category_id']);
            }
        }

        return $output;
    }

    protected function productTags($products) {
        $output = '';




        foreach ($products as $product) {
            $unit='';
            $guarantee_type_unit=$this->config->get('hotline_price_type_unit');
            if($guarantee_type_unit){
                $unit='unit="days"';
            }


            $description=strip_tags(html_entity_decode($product['description']));
            $description = preg_replace("/&#?[a-z0-9]+;/i", "", $description);
            $output .= '<item>';
            $output .= '<id>'.$product['product_id'].'</id>';
            $output .= '<categoryId>'.$product['category_id'].'</categoryId>';
            $output .= '<code>'.$product['model'].'</code>';
            if(!empty($product['manufacturer'])){
                $output .= '<vendor>'.$product['manufacturer'].'</vendor>';
            }
            $output .= '<name>'.$product['name'].'</name>';
            $output .= '<description>'.$description.'</description>';
            $output .= '<url>'.$this->url->link('product/product',['product_id' => $product['product_id']]).'</url>';
            if($this->config->get('hotline_price_image_width')>0 AND $this->config->get('hotline_price_image_height')>0){

                $output .= '<image>'.$this->model_tool_image->resize($product['image'],$this->config->get('hotline_price_image_width'),$this->config->get('hotline_price_image_height')).'</image>';
            }

            $output.=$this->getPrice($product['price'],$product['special']);
            $output .= '<stock>'.$product['stock_status'].'</stock>';
            if($this->config->get('hotline_price_guarantee_status')){
                $output .= '<guarantee  '.$unit.' type="'.$this->config->get('hotline_price_guarantee_type').'" >'.$this->config->get('hotline_price_guarantee_days').'</guarantee>';
            }
            $output .= '</item>';
        }

        return $output;
    }
    public function getPrice($price,$special=false){

        $output='';

        foreach ($this->curencys as $key=>$curency){
            if ($special) {
                $output .= '<priceR'.$key.'>'.$special.'</priceR'.$key.'>';
                $output .= '<oldprice>'.$this->currency->convert($price,$this->config->get('config_currency'),$key).'</oldprice>';
            } else {
                $output .= '<priceR'.$key.'>'.$this->currency->convert($price,$this->config->get('config_currency'),$key).'</priceR'.$key.'>';
            }
        }

        return $output;
    }
}
