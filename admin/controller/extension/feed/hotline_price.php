<?php
class ControllerExtensionFeedHotlinePrice extends Controller {
    private $error = array ();

    public function index() {
        $this->load->language('extension/feed/hotline_price');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->document->addScript('https://cdnjs.cloudflare.com/ajax/libs/jsviews/0.9.83/jsviews.min.js');
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('hotline_price',$this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension','token='.$this->session->data['token'].'&type=feed',true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');

        $data['text_type'] = $this->language->get('text_type');
        $data['text_time'] = $this->language->get('text_time');
        $data['text_carrier'] = $this->language->get('text_carrier');
        $data['text_region'] = $this->language->get('text_region');
        $data['text_cost'] = $this->language->get('text_cost');
        $data['text_free_from'] = $this->language->get('text_free_from');
        $data['text_in_checkout'] = $this->language->get('text_in_checkout');
        $data['text_express'] = $this->language->get('text_express');

        $data['link_hotline_xml_deliver'] = $this->language->get('link_hotline_xml_deliver');

        $data['text_month'] = $this->language->get('text_month');
        $data['text_day'] = $this->language->get('text_day');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_shop'] = $this->language->get('text_shop');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_data_feed'] = $this->language->get('entry_data_feed');
        $data['entry_language'] = $this->language->get('entry_language');
        $data['entry_hotline_store'] = $this->language->get('entry_hotline_store');
        $data['entry_image_width'] = $this->language->get('entry_image_width');
        $data['entry_image_height'] = $this->language->get('entry_image_height');
        $data['entry_image_count'] = $this->language->get('entry_image_count');

        $data['entry_guarantee_days'] = $this->language->get('entry_guarantee_days');
        $data['entry_guarantee_type'] = $this->language->get('entry_guarantee_type');
        $data['entry_guarantee_status'] = $this->language->get('entry_guarantee_status');
        $data['entry_guarantee_type_unit'] = $this->language->get('entry_guarantee_type_unit');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_option'] = $this->language->get('tab_option');
        $data['tab_shipping'] = $this->language->get('tab_shipping');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array ();

        $data['breadcrumbs'][] = array (
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard','token='.$this->session->data['token'],true)
        );

        $data['breadcrumbs'][] = array (
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension','token='.$this->session->data['token'].'&type=feed',true)
        );

        $data['breadcrumbs'][] = array (
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/feed/hotline_price','token='.$this->session->data['token'],true)
        );

        $data['action'] = $this->url->link('extension/feed/hotline_price','token='.$this->session->data['token'],true);

        $data['cancel'] = $this->url->link('extension/extension','token='.$this->session->data['token'].'&type=feed',true);

        if (isset($this->request->post['hotline_price_status'])) {
            $data['hotline_price_status'] = $this->request->post['hotline_price_status'];
        } else {
            $data['hotline_price_status'] = $this->config->get('hotline_price_status');
        }

        if (isset($this->request->post['hotline_price_language'])) {
            $data['hotline_price_language'] = $this->request->post['hotline_price_language'];
        } else {
            $data['hotline_price_language'] = $this->config->get('hotline_price_language');
        }

        if (isset($this->request->post['hotline_price_image_width'])) {
            $data['hotline_price_image_width'] = $this->request->post['hotline_price_image_width'];
        } else {
            $data['hotline_price_image_width'] = $this->config->get('hotline_price_image_width');
        }

        if (isset($this->request->post['hotline_price_image_height'])) {
            $data['hotline_price_image_height'] = $this->request->post['hotline_price_image_height'];
        } else {
            $data['hotline_price_image_height'] = $this->config->get('hotline_price_image_height');
        }

        if (isset($this->request->post['hotline_price_image_count'])) {
            $data['hotline_price_image_count'] = $this->request->post['hotline_price_image_count'];
        } else {
            $data['hotline_price_image_count'] = $this->config->get('hotline_price_image_count');
        }

        if (isset($this->request->post['hotline_price_store_id'])) {
            $data['hotline_price_store_id'] = $this->request->post['hotline_price_store_id'];
        } else {
            $data['hotline_price_store_id'] = $this->config->get('hotline_price_store_id');
        }

        if (isset($this->request->post['hotline_price_store'])) {
            $data['hotline_price_store'] = $this->request->post['hotline_price_store'];
        } elseif ($this->config->get('hotline_price_store')) {
            $data['hotline_price_store'] = $this->config->get('hotline_price_store');
        } else {
            $data['hotline_price_store'] = [];
        }

        if (isset($this->request->post['hotline_price_delivery_setting'])) {
            $data['hotline_price_delivery_setting'] = $this->request->post['hotline_price_delivery_setting'];
        } elseif ($this->config->get('hotline_price_delivery_setting')) {
            $data['hotline_price_delivery_setting'] = $this->config->get('hotline_price_delivery_setting');
        } else {
            $data['hotline_price_delivery_setting'] = [];
        }

        $data['delivery']['type'] = array (
            'pickup'=>array (),
            'warehouse'=>array (
                'carrier'
            ),
            'address'=>array (
                'carrier'
            )
        );
        $data['delivery']['time']=array(
            1=>'1-3 дня',
            2=>'4-9 дней',
            3=>'10-14 дней'
        );
        $data['delivery']['carrier']=array(
            "SLF" => "Собственными силами",
            "CAT" => "CAT",
            "DF"  => "Delfast",
            "IP"  => "InPost 24/7",
            "ND"  => "nextDay",
            "PP"  => "PickPoint",
            "TMM" => "TMM Express",
            "AL"  => "Автолюкс",
            "VC"  => "Ваш Час",
            "VP " => "Ваша Почта",
            "GU"  => "Гюнсел",
            "DA"  => "Деливери",
            "ЕЕ"  => "ЕвроЭкспресс",
            "ZD"  => "Зручна доставка",
            "IT"  => "Ин-Тайм",
            "CE"  => "Карго Экспресс",
            "KSD" => "КСД",
            "ME"  => "Мист Экспресс",
            "NP"  => "Новая почта",
            "NE"  => "Ночной Экспресс",
            "PE"  => "Пони Экспресс",
            "PB"  => "ПриватБанк",
            "MET" => "СЦ ТОЧКА",
            "UPG" => "Украинская почтовая группа",
            "UP"  => "Укрпочта",
            "EM"  => "Экспресс Мейл",
            "YT"  => "ЯрТранс Лоджистик"
        );
        if (isset($this->request->post['hotline_price_guarantee_status'])) {
            $data['hotline_price_guarantee_status'] = $this->request->post['hotline_price_guarantee_status'];
        } elseif ($this->config->get('hotline_price_guarantee_status')) {
            $data['hotline_price_guarantee_status'] = $this->config->get('hotline_price_guarantee_status');
        } else {
            $data['hotline_price_guarantee_status'] = false;
        }

        if (isset($this->request->post['hotline_price_guarantee_type'])) {
            $data['hotline_price_guarantee_type'] = $this->request->post['hotline_price_guarantee_type'];
        } elseif ($this->config->get('hotline_price_guarantee_type')) {
            $data['hotline_price_guarantee_type'] = $this->config->get('hotline_price_guarantee_type');
        } else {
            $data['hotline_price_guarantee_type'] = false;
        }

        if (isset($this->request->post['hotline_price_guarantee_days'])) {
            $data['hotline_price_guarantee_days'] = $this->request->post['hotline_price_guarantee_days'];
        } elseif ($this->config->get('hotline_price_guarantee_days')) {
            $data['hotline_price_guarantee_days'] = $this->config->get('hotline_price_guarantee_days');
        } else {
            $data['hotline_price_guarantee_days'] = 0;
        }

        if (isset($this->request->post['hotline_price_type_unit'])) {
            $data['hotline_price_type_unit'] = $this->request->post['hotline_price_type_unit'];
        } elseif ($this->config->get('hotline_price_type_unit')) {
            $data['hotline_price_type_unit'] = $this->config->get('hotline_price_type_unit');
        } else {
            $data['hotline_price_type_unit'] = 0;
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        $data['data_feed'] = HTTP_CATALOG.'index.php?route=extension/feed/hotline_price&lang='.$data['hotline_price_language'];

        $this->load->model('extension/module/export_product');

        $data['category'] = $this->model_extension_module_export_product->categories();

        $data['stores'] = [];

        $data['stores'][] = array (
            'store_id' => 0,
            'name'     => $this->language->get('text_default')
        );

        $this->load->model('setting/store');

        $results = $this->model_setting_store->getStores();

        foreach ($results as $result) {
            $data['stores'][] = array (
                'store_id' => $result['store_id'],
                'name'     => $result['name']
            );
        }


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $data['data'] = $data;

        $this->response->setOutput($this->load->view('extension/feed/hotline_price',$data));
    }



    protected function validate() {
        if (!$this->user->hasPermission('modify','extension/feed/hotline_price')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!isset($this->request->post['hotline_price_store']) OR empty($this->request->post['hotline_price_store'])) {
            $this->error['warning'] = $this->language->get('error_empty_category');
        }

        return !$this->error;
    }
}