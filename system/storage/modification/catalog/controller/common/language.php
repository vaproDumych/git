<?php
class ControllerCommonLanguage extends Controller {
	public function index() {
		$this->load->language('common/language');

		$data['text_language'] = $this->language->get('text_language');

		$data['action'] = $this->url->link('common/language/language', '', $this->request->server['HTTPS']);

		$data['code'] = $this->session->data['language'];

		$this->load->model('localisation/language');

		$data['languages'] = array();

		$results = $this->model_localisation_language->getLanguages();

		foreach ($results as $result) {
			if ($result['status']) {
				$data['languages'][] = array(
					'name' => $result['name'],
					'code' => $result['code']
				);
			}
		}

		if (!isset($this->request->get['route'])) {
			$data['redirect'] = $this->url->link('common/home');
		} else {
			$url_data = $this->request->get;

			$route = $url_data['route'];

			unset($url_data['route']);

			$url = '';

			if ($url_data) {
				$url = '&' . urldecode(http_build_query($url_data, '', '&'));
			}

			$data['redirect'] = $this->url->link($route, $url, $this->request->server['HTTPS']);
		}

		return $this->load->view('common/language', $data);
	}

	public function language() {
		if (isset($this->request->post['code'])) {
			$this->session->data['language'] = $this->request->post['code'];

                $this->session->data['NitroSwitchLanguage'] = true;
            
		}

			
            $search_string = "";
            if (($position = strpos($this->request->post['redirect'], "_route_=")) !== FALSE) { 
                $search_string = substr($this->request->post['redirect'], $position+8); 
            }

            if (!empty($search_string)) {
                $search_string = explode('/', urldecode($search_string));

                // remove any empty arrays from trailing
                if (utf8_strlen(end($search_string)) == 0) {
                    array_pop($search_string);
                }

                foreach ($search_string as $string) {
                	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_custom_urls WHERE keyword = '" . $this->db->escape($string) . "' LIMIT 1");

                	if ($query->num_rows > 0) {
                	
                		if (isset($this->request->post['code'])) {
                            $lang_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE `code` = '" . $this->db->escape($this->request->post['code']) . "' LIMIT 1");
                            if ($lang_query->num_rows > 0) {
                                $this->config->set('config_language', $this->request->post['code']);
                                $this->config->set('config_language_id', $lang_query->row['language_id']);
                            }
                        }
	                    $custom_query = $query->row['query'];
	                    $custom_lang = $this->config->get('config_language_id');
	                    $custom_url_query = $this->db->query("SELECT `keyword` FROM " . DB_PREFIX . "seo_custom_urls WHERE query = '" . $this->db->escape($custom_query) . "'AND language_id = '". $custom_lang ."' LIMIT 1");
	                    $subfolder_prefix_check = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = '" . $this->db->escape('subfolder_prefixes'). "' LIMIT 1");

                        $default_lang_prefix_check = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = '" . $this->db->escape('default_lang_prefix'). "' LIMIT 1");
                        $language_string = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'")->row['value'];

                        $lang_prefix  = '';
                        if ($subfolder_prefix_check->row['value']) {
                            if ($this->config->get('config_language') != $language_string || $default_lang_prefix_check->row['value']) {
                                $lang_prefix = $this->config->get('config_language') . '/';

                                $subfolder_prefixes_alias = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = '" . $this->db->escape('subfolder_prefixes_alias'). "' LIMIT 1");
                                $subfolder_prefixes_alias = json_decode($subfolder_prefixes_alias->row['value'], true);
                                if (isset($subfolder_prefixes_alias[$this->config->get('config_language')])) {
                                    $lang_prefix = $subfolder_prefixes_alias[$this->config->get('config_language')] . '/';
                                }
                            }
                        }

	                    $custom_url = $lang_prefix . $custom_url_query->row['keyword'];
	                    if (!empty($custom_url)){
	                        $this->response->redirect($custom_url);
	                    }

                	} else {

	                    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url_alias WHERE keyword = '" . $this->db->escape($string) . "' LIMIT 1");
	                    $redirect_url = "";
	                    $redirect_path = "";
	                    $redirect_query = "";
	                    
	                    if ($query->num_rows > 0) {
	                        $url = explode('=', $query->row['query']);

	                        if (isset($this->request->post['code'])) {
	                            $lang_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE `code` = '" . $this->db->escape($this->request->post['code']) . "' LIMIT 1");
	                            if ($lang_query->num_rows > 0) {
	                                $this->config->set('config_language', $this->request->post['code']);
	                                $this->config->set('config_language_id', $lang_query->row['language_id']);
	                            }
	                        }

	                        if ($url[0] == 'category_id') {
	                            if (!isset($this->request->get['path'])) {
	                                $this->request->get['path'] = $url[1];
	                            } else {
	                                $this->request->get['path'] .= '_' . $url[1];
	                            }
	                        }
	                        
	                        if ($url[0] == 'product_id') {
	                            $redirect_path = "product/product";
	                            $redirect_query = "product_id=" . $url[1];
	                        }
	                        if ($url[0] == 'manufacturer_id') {
	                            $redirect_path = "product/manufacturer/info";
	                            $redirect_query = "manufacturer_id=" . $url[1];
	                        }
	                        if ($url[0] == 'information_id') {
	                            $redirect_path = "information/information";
	                            $redirect_query = "information_id=" . $url[1];
	                        }
	                    }

                	}
                }

                if (isset($this->request->get['path']) && !empty($redirect_query)) {
                    $redirect_query = "path=" . $this->request->get['path'] . "&" . $redirect_query;
                } else if (isset($this->request->get['path'])) {
                    $redirect_path = "product/category";
                    $redirect_query = "path=" . $this->request->get['path'];
                }
                
                if (!empty($redirect_query) && !empty($redirect_path)) {
                    $redirect_url = $this->url->link($redirect_path, $redirect_query, 'SSL');
                }
                
                if (!empty($redirect_url)) {
                    $this->request->post['redirect'] = $redirect_url;
                } 
            } else {
				if (isset($this->request->post['code'])) {
					$lang_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE `code` = '" . $this->db->escape($this->request->post['code']) . "' LIMIT 1");
					if ($lang_query->num_rows > 0) {
						$this->config->set('config_language', $this->request->post['code']);
						$this->config->set('config_language_id', $lang_query->row['language_id']);

						$this->request->post['redirect'] = $this->url->link('common/home');
					}
				}
			}
			
		if (isset($this->request->post['redirect'])) {
			$this->response->redirect($this->request->post['redirect']);
		} else {
			$this->response->redirect($this->url->link('common/home'));
		}
	}
}