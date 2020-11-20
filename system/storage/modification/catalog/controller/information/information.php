<?php
class ControllerInformationInformation extends Controller {
	public function index() {
		$this->load->language('information/information');

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$this->document->setTitle($information_info['meta_title']);

                // iSense SEO Module Loader
                $this->config->load('isenselabs/isenselabs_seo');
                $isense_module_path = $this->config->get('isenselabs_seo_path');
                $isense_call_model  = $this->config->get('isenselabs_seo_model');
                $this->load->model($isense_module_path);
               
                //Hreflang
                $this->load->model('localisation/language');
				$languages                        = $this->model_localisation_language->getLanguages();
                if ($this->request->server['HTTPS']) {
                    $seo_main_url = $this->config->get('config_ssl');
                } else {
                    $seo_main_url = $this->config->get('config_url');
                }
                $hreflang_informations            = $this->{$isense_call_model}->getSetting('hreflang_informations');
                $subfolder_prefix_check           = $this->{$isense_call_model}->getSetting('subfolder_prefixes');

                if ($hreflang_informations) {
                    foreach($languages as $language) {
                        $query = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url_alias` WHERE `query` = 'information_id=" . (int)$information_info['information_id'] . "' AND `language_id` = '".  $language['language_id']."' LIMIT 1");

                        $lang_prefix  = '';
                        if ($subfolder_prefix_check && $language['language_id'] != '1'){
                            $lang_prefix =  $language['code'] . '/';

                            $subfolder_prefixes_alias = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = '" . $this->db->escape('subfolder_prefixes_alias'). "' LIMIT 1");
                            $subfolder_prefixes_alias = json_decode($subfolder_prefixes_alias->row['value'], true);
                            if (isset($subfolder_prefixes_alias[$language['code']])) {
                                $lang_prefix = $subfolder_prefixes_alias[$language['code']] . '/';
                            }
                        }

                        if ($query->num_rows) {
                            $this->document->addSeoHreflang($seo_main_url . $lang_prefix . $query->row['keyword'], $language['code']);
                        }
                    }
                }
			

                //SEO Backpack
                $this->config->load('isenselabs/isenselabs_seo');
                $isense_module_path = $this->config->get('isenselabs_seo_path');
                $isense_call_model  = $this->config->get('isenselabs_seo_model');
                $this->load->model($isense_module_path);

                $canonical_check = $this->{$isense_call_model}->getSetting('canonical_information_pages');

                if ($canonical_check) {
                    $this->document->addLink($this->url->link('information/information', 'information_id=' .  $information_id, true), 'canonical');
                }
			
			$this->document->setDescription($information_info['meta_description']);
			$this->document->setKeywords($information_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $information_info['title'],
				'href' => $this->url->link('information/information', 'information_id=' .  $information_id)
			);

			$data['heading_title'] = $information_info['title'];

			$data['button_continue'] = $this->language->get('button_continue');

			$data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/information', $data));
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/information', 'information_id=' . $information_id)
			);

$this->load->controller('extension/module/isenselabs_seo/notFoundPageHandler');
			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function agree() {
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$output = '';

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
}