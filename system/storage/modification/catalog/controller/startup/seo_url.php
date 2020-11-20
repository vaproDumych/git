<?php
class ControllerStartupSeoUrl extends Controller {
	public function index() {

			$table_check_subfolders = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX ."seo_module_settings'")->num_rows;
			
			if ($table_check_subfolders) {
                $subfolder_check = $this->db->query("SELECT `id` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = 'subfolder_prefixes' AND `value` = '1' LIMIT 1")->num_rows;
            
			    if ($subfolder_check) {
                    $subfolder_check = true;
                } else {
                    $subfolder_check = false;
                }
			} else {
			    $subfolder_check = false;
			}

			if ($table_check_subfolders) {
                $default_lang_prefix = $this->db->query("SELECT `id` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = 'default_lang_prefix' AND `value` = '1' LIMIT 1")->num_rows;
            
                if ($default_lang_prefix) {
                    $default_lang_prefix = true;
                } else {
                    $default_lang_prefix = false;
                }
            } else {
                $default_lang_prefix = false;
            }
			
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}

		// Decode URL

                if ($subfolder_check) {
                    $lquery = $this->db->query("SELECT * FROM " . DB_PREFIX . "language;");
                    $lparts = isset($this->request->get['_route_']) ? explode('/', $this->request->get['_route_']) : array();
                    $lcode  = isset($lparts[0]) ? $lparts[0] : '';

                    $default_lang_code  = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'")->row['value'];
                    $active_lang_prefix = $active_lang_code = isset($this->session->data['language']) ? $this->session->data['language'] : $default_lang_code;
                    $subfolder_prefixes_alias = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = '" . $this->db->escape('subfolder_prefixes_alias'). "' LIMIT 1");
                    $subfolder_prefixes_alias = json_decode($subfolder_prefixes_alias->row['value'], true);
                    
                    if (in_array($lcode, $subfolder_prefixes_alias)) {
                        $active_lang_prefix = $active_lang_code = array_search($lcode, $subfolder_prefixes_alias);
                    }
                    if (isset($subfolder_prefixes_alias[$active_lang_prefix])) {
                        $active_lang_prefix = $subfolder_prefixes_alias[$active_lang_prefix];
                    }

                    if ($default_lang_prefix) {
                        $table_check = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX ."seo_module_settings'")->num_rows;

                        if ($table_check) {
                            $redirect_active_lang_prefix_query = $this->db->query("SELECT `id` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = 'redirect_active_lang_prefix' AND `value` = '1' LIMIT 1")->num_rows;

                            if ($redirect_active_lang_prefix_query) {
                                if (isset($this->request->get['_route_']) || empty($this->request->get)) {
                                    $missing_lang_code = true;
                                    if ($lcode == $active_lang_prefix) {
                                        $missing_lang_code = false;
                                    }

                                    if ($missing_lang_code) {
                                        $base = HTTP_SERVER;
                                        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
                                            $base = HTTPS_SERVER;
                                        }
                                        
                                        if (isset($this->request->get['_route_'])) {
                                            $this->response->redirect($base . $active_lang_prefix . '/' . $this->request->get['_route_']);
                                        } else {
                                            $this->response->redirect($base . $active_lang_prefix . '/');
                                        }
                                    }
                                }
                            }
                        }
                    }

                    if (isset($this->request->get['_route_'])) {
                        foreach ($lquery->rows as $language) {
                            if ($language['code'] == $active_lang_code) {
                                $this->session->data['language'] = $language['code']; 
                                
                                $this->language = new Language((VERSION >= '2.2.0.0') ? $language['code'] : $language['directory']);
                                $this->language->load((VERSION >= '2.2.0.0') ? $language['code'] : $language['directory']); 

                                $this->registry->set('language', $this->language); 
                                $this->config->set('config_language_id', $language['language_id']); 	

                                if ($default_lang_prefix || $default_lang_code != $active_lang_code) {
                                    $this->request->get['_route_'] = substr($this->request->get['_route_'], strlen($active_lang_prefix . '/'));
                                }
                            }
                        }
                    }
                }
            
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);

			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}

			foreach ($parts as $part) {
			
			
            //iSense SEO Module
            //Custom URLs
            $custom_seo_urls = $this->db->query("SELECT * FROM `" . DB_PREFIX . "seo_custom_urls` WHERE `keyword` = '" . $this->db->escape($part) . "' AND `language_id` = '" . $this->config->get('config_language_id') . "' LIMIT 1");
                
            if ($custom_seo_urls->num_rows > 0) {
                $this->request->get['route'] = $custom_seo_urls->row['query'];
				break;
            } else {
                    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_custom_urls WHERE keyword = '" . $this->db->escape($part) . "' LIMIT 1");

                    if ($query->num_rows > 0) {

                        $base = '';
                
                        $lang_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE `language_id` = '" . $this->db->escape($query->row['language_id']) . "' LIMIT 1");
                        if ($lang_query->num_rows > 0) {
                            $this->session->data['language'] = $lang_query->row['code'];
                            $this->config->set('config_language', $lang_query->row['code']);
                            $this->config->set('config_language_id', $lang_query->row['language_id']);

                            if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
                                $base = HTTPS_SERVER;
                            } else {
                                $base = HTTP_SERVER;
                            } 
                        }
                        
                       
                        
                        $custom_query = $query->row['query'];
                        $custom_lang = $this->config->get('config_language_id');
                        $custom_url_query = $this->db->query("SELECT `keyword` FROM " . DB_PREFIX . "seo_custom_urls WHERE query = '" . $this->db->escape($custom_query) . "' AND language_id = '". (int)$custom_lang ."' LIMIT 1");
                        
                        $lang_prefix  = '';
                        if ($subfolder_check) {
                            $language_string = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'")->row['value'];
                            if ($this->config->get('config_language') != $language_string || $default_lang_prefix) {
                                $lang_prefix = $this->config->get('config_language') . '/';

                                if (!empty($active_lang_prefix)) {
                                    $lang_prefix = $active_lang_prefix . '/';
                                }
                            }
                        }

                        
                        $custom_url = $base . $lang_prefix . $custom_url_query->row['keyword'];
                        if (!empty($custom_url)){
                            $this->response->redirect($custom_url);
                        }

                    }
                }
			
				
			if ($subfolder_check) {
			    $query = $this->db->query("SELECT u.query, u.keyword, u.language_id as lang_id, l.code" . ((VERSION >= '2.2.0.0') ? '' : ', l.directory') . " FROM `" . DB_PREFIX . "seo_url_alias` u LEFT JOIN `" . DB_PREFIX . "language` l on (u.language_id = l.language_id) WHERE u.keyword = '" . $this->db->escape($part) . "'");
			} else {
			    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
			}
			


                // Journal Theme Modification
                if ($part && !$query->num_rows) {
                    $sql = "
                        SELECT CONCAT('journal_blog_category_id=', category_id) as query FROM " . DB_PREFIX . "journal3_blog_category_description
                        WHERE keyword = '" . $this->db->escape($part) . "'
                        UNION
                        SELECT CONCAT('journal_blog_post_id=', post_id) as query FROM " . DB_PREFIX . "journal3_blog_post_description
                        WHERE keyword = '" . $this->db->escape($part) . "'
                    ";
                    $query = $this->db->query($sql);
                }

                if (!$query->num_rows) {
                    $this->load->model('journal3/blog');
                    $journal_blog_keywords = $this->model_journal3_blog->getBlogKeywords();

                    if($part && is_array($journal_blog_keywords) && (in_array($part, $journal_blog_keywords))) {
                        $this->request->get['route'] = 'journal3/blog';
                        continue;
                    }
                }
                // End Journal Theme Modification
            
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);


                // Journal Theme Modification
                if ($url[0] == 'journal_blog_post_id') {
                    $this->request->get['journal_blog_post_id'] = $url[1];
                }

                if ($url[0] == 'journal_blog_category_id') {
                    $this->request->get['journal_blog_category_id'] = $url[1];
                }
                // End Journal Theme Modification
            
					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}

					if ($query->row['query'] && $url[0] != 'information_id' && $url[0] != 'manufacturer_id' && $url[0] != 'category_id' && $url[0] != 'product_id') {
						$this->request->get['route'] = $query->row['query'];
					}
				} else {
					$this->request->get['route'] = 'error/not_found';

					break;
				}
			}


                // Journal Theme Modification
                if (isset($this->request->get['journal_blog_post_id'])) {
                    $this->request->get['route'] = 'journal3/blog/post';
                } else if (isset($this->request->get['journal_blog_category_id'])) {
                    $this->request->get['route'] = 'journal3/blog';
                }
                // End Journal Theme Modification
            
			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
				}
			}
		}

			else {

            $table_check = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX ."seo_module_settings'")->num_rows;
            
                if ($table_check) {
                    $redirect_to_seo_links_check = $this->db->query("SELECT `id` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = 'redirect_to_seo_links' AND `value` = '1' LIMIT 1")->num_rows;
                
                    if ($redirect_to_seo_links_check) {
                        $redirect_to_seo_links_check = true;
                    } else {
                        $redirect_to_seo_links_check = false;
                    }
                } else {
                    $redirect_to_seo_links_check = false;
                }

            if (isset($this->request->get['route']) && !empty($this->request->get['route']) && $redirect_to_seo_links_check) {
                $request_uri = isset($_SERVER['REQUEST_URI']) && !empty($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : '';
                $request_uri_segment = '';
                $request_uri_segment_pos = strpos($request_uri, '&');

                if ($request_uri_segment_pos) {
                    $request_uri_segment = substr($request_uri, $request_uri_segment_pos + 1);
                }
                
                $SEO_link = $this->url->link($this->request->get['route'], $request_uri_segment, 'SSL');
                $isSEOFriendy = strpos($SEO_link, 'route=') ? false : true;
                
                if ($isSEOFriendy){
                    $this->response->redirect($SEO_link);
                }
            }
        }
			
	}

	public function rewrite($link) {

			// SEO Backpack Unify Script
			$table_check = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX ."seo_module_settings'")->num_rows;
			
			if ($table_check) {
                $unify_check = $this->db->query("SELECT `id` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = 'unify_urls' AND `value` = '1' LIMIT 1")->num_rows;
            
			    if ($unify_check) {
                    $unify_check = true;
                } else {
                    $unify_check = false;
                }
			} else {
			    $unify_check = false;
			}
			

			$table_check_subfolders = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX ."seo_module_settings'")->num_rows;

            if ($table_check_subfolders) {
                $subfolder_check = $this->db->query("SELECT `id` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = 'subfolder_prefixes' AND `value` = '1' LIMIT 1")->num_rows;
            
                if ($subfolder_check) {
                    $subfolder_check = true;
                } else {
                    $subfolder_check = false;
                }
            } else {
                $subfolder_check = false;
            }
			
			if ($table_check_subfolders) {
                $default_lang_prefix = $this->db->query("SELECT `id` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = 'default_lang_prefix' AND `value` = '1' LIMIT 1")->num_rows;
            
			    if ($default_lang_prefix) {
                    $default_lang_prefix = true;
                } else {
                    $default_lang_prefix = false;
                }
			} else {
			    $default_lang_prefix = false;
			}

            if ($subfolder_check) {
                $active_lang_code = isset($this->session->data['language']) ? $this->session->data['language'] : $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'")->row['value'];
                $subfolder_prefixes_alias = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = '" . $this->db->escape('subfolder_prefixes_alias'). "' LIMIT 1");
                $subfolder_prefixes_alias = json_decode($subfolder_prefixes_alias->row['value'], true);
            }
			

                // Journal Theme Modification
                if (defined('JOURNAL3_ACTIVE')) {
                    $this->load->model('journal3/blog');
                    $is_journal3_blog = false;
                }
                // End Journal Theme Modification
            
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);
			
			
            //iSense SEO Module
            
            //Common Home Fix
            if (isset($data['route']) && $data['route'] == 'common/home') {
            	$is_common_home = true;
			} else {
				$is_common_home = false;
			}

			if ($is_common_home) {
				unset($data['route']);

				$query = '';

				if ($data) {
					foreach ($data as $key => $value) {
						$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((is_array($value) ? http_build_query($value) : (string)$value));
					}

					if ($query) {
						$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
					}
				}

				if ($subfolder_check) {
                    $language_string = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'")->row['value'];

                    if (isset($this->session->data['language'])) {
                        if($this->session->data['language'] <> $language_string || $default_lang_prefix) {
                            $url_prefix = '/' . $this->session->data['language']. '/';

                            if (!empty($subfolder_prefixes_alias) && isset($subfolder_prefixes_alias[$active_lang_code])) {
                                $url_prefix = '/' . $subfolder_prefixes_alias[$active_lang_code] . '/';
                            }
                        }
                        else {
                        	$url_prefix = '';
                        }
                    } else {
                        $url_prefix = '';
                    }

                   return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url_prefix . $url . $query;
               } else {
                   $new_link = $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
                   return $new_link;
               }
			}
            
            //Custom URLs
            $custom_seo_urls = $this->db->query("SELECT * FROM `" . DB_PREFIX . "seo_custom_urls` WHERE `query` = '" . $this->db->escape($data['route']) . "' AND `language_id` = '" . $this->config->get('config_language_id') . "' LIMIT 1");
                
            if ($custom_seo_urls->num_rows > 0) {
                $url .= '/' . $custom_seo_urls->row['keyword'];    
                unset($data['key']);
            }
			

		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url_alias WHERE language_id = '" . $this->config->get('config_language_id') . "' AND `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");

					if ($query->num_rows && $query->row['keyword']) {
						
			// SEO Backpack Unify Script
			// $url .= '/' . $query->row['keyword']; // OLD URL GENERATION
			
			if ($unify_check) {
                $url = '/' . $query->row['keyword'];
            } else {
                $url .= '/' . $query->row['keyword'];
            }
			

						unset($data[$key]);
					}

                // Journal Theme Modification
                } elseif ($key == 'journal_blog_post_id') {
                    $is_journal3_blog = true;
                    if ($journal_blog_keyword = $this->model_journal3_blog->rewritePost($value)) {
                        $url .= '/' . $journal_blog_keyword;
                        unset($data[$key]);
                    }
                } elseif ($key == 'journal_blog_category_id') {
                    $is_journal3_blog = true;
                    if ($journal_blog_keyword = $this->model_journal3_blog->rewriteCategory($value)) {
                        $url .= '/' . $journal_blog_keyword;
                        unset($data[$key]);
                    }
                } elseif (isset($data['route']) && $data['route'] == 'journal3/blog') {
                    if (!isset($data['journal_blog_post_id']) && !isset($data['journal_blog_category_id'])) {
                        $is_journal3_blog = true;
                    }
                // End Journal Theme Modification
            
				} elseif ($key == 'path') {
					$categories = explode('_', $value);

					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url_alias WHERE language_id = '" . $this->config->get('config_language_id') . "' AND `query` = 'category_id=" . (int)$category . "'");

						if ($query->num_rows && $query->row['keyword']) {
							
			// SEO Backpack Unify Script
			// $url .= '/' . $query->row['keyword']; // OLD URL GENERATION
			
			if ($unify_check) {
                $url = '/' . $query->row['keyword'];
            } else {
                $url .= '/' . $query->row['keyword'];
            }
			
						} else {
							$url = '';

							break;
						}
					}

					unset($data[$key]);
				}
			}
		}


                // Journal Theme Modification
                if (defined('JOURNAL3_ACTIVE')) {
                    if ($is_journal3_blog && $this->model_journal3_blog->getBlogKeyword()) {
                        $url = '/' . $this->model_journal3_blog->getBlogKeyword() . $url;
                    }
                }
                // End Journal Theme Modification
            
		if (($url) && ($url <> '/'.$this->session->data['language'])){
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((is_array($value) ? http_build_query($value) : (string)$value));
				}

				if ($query) {
					$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
				}
			}

			
				if ($subfolder_check) {
                    $language_string = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'")->row['value'];

                    if (isset($this->session->data['language'])) {
                        if($this->session->data['language'] <> $language_string || $default_lang_prefix) {
                            $url_prefix = '/' . $this->session->data['language'];

                            if (!empty($subfolder_prefixes_alias) && isset($subfolder_prefixes_alias[$active_lang_code])) {
                                $url_prefix = '/' . $subfolder_prefixes_alias[$active_lang_code];
                            }
                        } else {
                        	$url_prefix = '';
                        }
                    } else {
                        $url_prefix = '';
                    }

                   return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url_prefix . $url . $query;
               } else {
                   return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
               }
            
		} else {
			return $link;
		}
	}
}
