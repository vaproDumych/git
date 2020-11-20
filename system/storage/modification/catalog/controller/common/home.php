<?php
class ControllerCommonHome extends Controller {
	public function index() {

                // iSense SEO Module Loader
                $this->config->load('isenselabs/isenselabs_seo');
                $isense_module_path = $this->config->get('isenselabs_seo_path');
                $isense_call_model  = $this->config->get('isenselabs_seo_model');
                $this->load->model($isense_module_path);
               
                $seo_google_publisher         = $this->{$isense_call_model}->getSetting('google_publisher');
                $seo_google_publisher_id      = $this->{$isense_call_model}->getSetting('google_publisher_id');
                
                if ($seo_google_publisher && !empty($seo_google_publisher_id)) {
                    $this->document->addLink('https://plus.google.com/' . $seo_google_publisher_id, 'publisher');
                } 
                
                $twitter_card                 =  $this->{$isense_call_model}->getSetting('twitter_card');
                $twitter_card_username        =  $this->{$isense_call_model}->getSetting('twitter_card_username');
                
                $titles = $this->config->get('config_meta_title');
                $meta_descriptions = $this->config->get('config_meta_description');
                if ($this->request->server['HTTPS']) {
                    $seo_url_site = $this->config->get('config_ssl');
                } else {
                    $seo_url_site = $this->config->get('config_url');
                }
                if (is_file(DIR_IMAGE . $this->config->get('config_logo')) && !empty($seo_url_site)) {
                    $seo_logo = $seo_url_site . 'image/' . $this->config->get('config_logo');
                } else {
                    $seo_logo = '';
                }
                
                $facebook_open_graph         = $this->{$isense_call_model}->getSetting('facebook_open_graph');
                
                if ($twitter_card) {
                    $this->document->addSeoMeta('summary', 'twitter:card', 'name');
                    if ($twitter_card_username) {
                        $this->document->addSeoMeta($twitter_card_username, 'twitter:creator', 'name');
                        $this->document->addSeoMeta($twitter_card_username, 'twitter:site', 'name');
                    }

                    if (!empty($meta_descriptions[$this->config->get('config_language_id')])) {
                        $this->document->addSeoMeta($meta_descriptions[$this->config->get('config_language_id')], 'twitter:description', 'name');
                    }
                    
                    if (!empty($titles[$this->config->get('config_language_id')])) {
                        $this->document->addSeoMeta($titles[$this->config->get('config_language_id')], 'twitter:title', 'name');
                    }  
                    
                    if (!empty($seo_url_site)) {
                        $this->document->addSeoMeta($seo_url_site, 'twitter:domain', 'name');
                    }  
                    
                    if (!empty($seo_logo)) {
                        $this->document->addSeoMeta($seo_logo, 'twitter:image', 'name');
                    }                
                }  
                
                if ($facebook_open_graph) {
                    $fb_app_id = $this->{$isense_call_model}->getSetting('facebook_open_graph_app_id');                     
                    if ($fb_app_id) {
                         $this->document->addSeoMeta($fb_app_id, 'fb:app_id', 'property');
                    }
                   
                    $this->document->addSeoMeta('website', 'og:type', 'property');
                    if (!empty($titles[$this->config->get('config_language_id')])) {
                        $this->document->addSeoMeta($titles[$this->config->get('config_language_id')], 'og:site_name', 'property');
                        $this->document->addSeoMeta($titles[$this->config->get('config_language_id')], 'og:title', 'property');
                    }
                    
                    if (!empty($meta_descriptions[$this->config->get('config_language_id')])) {
                        $this->document->addSeoMeta($meta_descriptions[$this->config->get('config_language_id')], 'og:description', 'property');
                    }
                    
                    if (!empty($seo_url_site)) {
                        $this->document->addSeoMeta($seo_url_site, 'og:url', 'property');
                    }
                    
                    if (!empty($seo_logo)) {
                        $this->document->addSeoMeta($seo_logo, 'og:image', 'property');
                    }
                }
			
			
			$titles = $this->config->get('config_meta_title');
			$meta_descriptions = $this->config->get('config_meta_description');
			$meta_keywords = $this->config->get('config_meta_keyword');
			
		$this->document->setTitle(
			(is_array($titles) && isset($titles[$this->config->get('config_language_id')])) ? $titles[$this->config->get('config_language_id')] : $titles
			);
		$this->document->setDescription(
			(is_array($meta_descriptions) && isset($meta_descriptions[$this->config->get('config_language_id')])) ? $meta_descriptions[$this->config->get('config_language_id')] : $meta_descriptions
			);
		$this->document->setKeywords(
            (is_array($meta_keywords) && isset($meta_keywords[$this->config->get('config_language_id')])) ? $meta_keywords[$this->config->get('config_language_id')] : $meta_keywords
			);

		if (isset($this->request->get['route'])) {
			
               //$this->document->addLink($this->config->get('config_url'), 'canonical');
			
		}


                //SEO Backpack
                $this->config->load('isenselabs/isenselabs_seo');
                $isense_module_path = $this->config->get('isenselabs_seo_path');
                $isense_call_model  = $this->config->get('isenselabs_seo_model');
                $this->load->model($isense_module_path);

                $canonical_check = $this->{$isense_call_model}->getSetting('canonical_home_page');

                if ($canonical_check) {
                    $this->document->addLink($this->url->link('common/home', '', true), 'canonical');
                }
			
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
