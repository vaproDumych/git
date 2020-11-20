<?php
class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {
 if (function_exists('Wga')) Wga(); //Lightning 

            if (defined('JOURNAL3_ACTIVE')) {
                $this->journal3->document->addStyle('catalog/view/theme/journal3/lib/imagezoom/imagezoom.min.css');
			    $this->journal3->document->addScript('catalog/view/theme/journal3/lib/imagezoom/jquery.imagezoom.min.js', 'footer');

                $this->journal3->document->addStyle('catalog/view/theme/journal3/lib/lightgallery/css/lightgallery.min.css');
                $this->journal3->document->addStyle('catalog/view/theme/journal3/lib/lightgallery/css/lg-transitions.min.css');
                $this->journal3->document->addScript('catalog/view/theme/journal3/lib/lightgallery/js/lightgallery-all.js', 'footer');

                $this->journal3->document->addStyle('catalog/view/theme/journal3/lib/swiper/swiper.min.css');
			    $this->journal3->document->addScript('catalog/view/theme/journal3/lib/swiper/swiper.min.js', 'footer');
            }
            
		$this->load->language('product/product');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			
			// SEO Backpack Unify Script
			// iSense SEO Module Loader
            $this->config->load('isenselabs/isenselabs_seo');
            $isense_module_path = $this->config->get('isenselabs_seo_path');
            $isense_call_model  = $this->config->get('isenselabs_seo_model');
            $this->load->model($isense_module_path);
            
            $breadcrumb_check = $this->{$isense_call_model}->getSetting('breadcrumb_products');
            
            if(!isset($category_info) && $breadcrumb_check) {
                $categories = $this->{$isense_call_model}->getCategoriesByProductId($this->request->get['product_id']);
                if ($categories) {
                    foreach($categories as $category) {
                        $path = $this->{$isense_call_model}->getPathCategoryPage($category['category_id']);
                        $category_info = $this->model_catalog_category->getCategory($category['category_id']);
                        if ($path) {
                            $cat_path = $path;
                        } else {
                            $cat_path = $category_info['category_id'];
                        }

                        if ($category_info) {
                            $path = '';

                            foreach (explode('_', $cat_path) as $path_id) {
                                $path = $path_id;

                                $category_info = $this->model_catalog_category->getCategory($path_id);

                                if ($category_info) {
                                    $data['breadcrumbs'][] = array(
                                      'text'      => $category_info['name'],
                                      'href'      => $this->url->link('product/category', '&path=' . $path, 'SSL'),
                                      'separator' => $this->language->get('text_separator')
                                    );
                                }
                            }
                            break;
                        }

                    }
                }
            }
			

            if (defined('JOURNAL3_ACTIVE')) {
                $this->load->language('product/compare');

                $data['text_weight'] = $this->language->get('text_weight');
                $data['text_dimension'] = $this->language->get('text_dimension');
                $data['product_quantity'] = $product_info['quantity'];
                $data['product_price_value'] = $product_info['special'] ? $product_info['special'] > 0 : $product_info['price'] > 0;
                $data['product_sku'] = $product_info['sku'];
                $data['product_upc'] = $product_info['upc'];
                $data['product_ean'] = $product_info['ean'];
                $data['product_jan'] = $product_info['jan'];
                $data['product_isbn'] = $product_info['isbn'];
                $data['product_mpn'] = $product_info['mpn'];
                $data['product_location'] = $product_info['location'];
                $data['product_dimension'] = (float)$product_info['length'] || (float)$product_info['width'] || (float)$product_info['height'];
                $data['product_length'] = $this->length->format($product_info['length'], $product_info['length_class_id']);
                $data['product_width'] = $this->length->format($product_info['width'], $product_info['length_class_id']);
                $data['product_height'] = $this->length->format($product_info['height'], $product_info['length_class_id']);
                $data['product_weight'] = (float)$product_info['weight'] ? $this->weight->format($product_info['weight'], $product_info['weight_class_id']) : false;

                $data['product_labels'] = $this->journal3->productLabels($product_info, $product_info['price'], $product_info['special']);
                $data['product_exclude_classes'] = $this->journal3->productExcludeButton($product_info, $product_info['price'], $product_info['special']);
                $data['product_extra_buttons'] = $this->journal3->productExtraButton($product_info, $product_info['price'], $product_info['special']);
                $data['product_blocks'] = array();

                foreach($this->journal3->productBlocks($product_info, $product_info['price'], $product_info['special']) as $module_id => $module_data) {
                    if ($module_data['position'] === 'quickview' && $this->journal3->document->isPopup()) {
                    	if ($block = $this->load->controller('journal3/product_blocks', array('module_id' => $module_id, 'module_type' => 'product_blocks', 'product_info' => $product_info))) {
							$data['product_blocks']['default'][] = $block;
						}
                    } else if ($module_data['position'] === 'quickview_details' && $this->journal3->document->isPopup()) {
                    	if ($block = $this->load->controller('journal3/product_blocks', array('module_id' => $module_id, 'module_type' => 'product_blocks', 'product_info' => $product_info))) {
							$data['product_blocks']['bottom'][] = $block;
						}
                    } else if ($module_data['position'] === 'quickview_image' && $this->journal3->document->isPopup()) {
                    	if ($block = $this->load->controller('journal3/product_blocks', array('module_id' => $module_id, 'module_type' => 'product_blocks', 'product_info' => $product_info))) {
							$data['product_blocks']['image'][] = $block;
						}
                    } else if (!$this->journal3->document->isPopup()) {
                    	if ($block = $this->load->controller('journal3/product_blocks', array('module_id' => $module_id, 'module_type' => 'product_blocks', 'product_info' => $product_info))) {
							$data['product_blocks'][$module_data['position']][] = $block;
						}
                    }
                }

                $product_tabs = array();

                foreach($this->journal3->productTabs($product_info, $product_info['price'], $product_info['special']) as $module_id => $module_data) {
                    if ($module_data['position'] === 'quickview' && $this->journal3->document->isPopup()) {
                    	if ($tab = $this->load->controller('journal3/product_tabs', array('module_id' => $module_id, 'module_type' => 'product_tabs', 'product_info' => $product_info))) {
							$product_tabs['default'][] = $tab;
						}
                    } else if ($module_data['position'] === 'quickview_details' && $this->journal3->document->isPopup()) {
                    	if ($tab = $this->load->controller('journal3/product_tabs', array('module_id' => $module_id, 'module_type' => 'product_tabs', 'product_info' => $product_info))) {
							$product_tabs['bottom'][] = $tab;
						}
                    } else if ($module_data['position'] === 'quickview_image' && $this->journal3->document->isPopup()) {
                    	if ($tab = $this->load->controller('journal3/product_tabs', array('module_id' => $module_id, 'module_type' => 'product_tabs', 'product_info' => $product_info))) {
							$product_tabs['image'][] = $tab;
						}
                    } else if (!$this->journal3->document->isPopup()) {
                    	if ($tab = $this->load->controller('journal3/product_tabs', array('module_id' => $module_id, 'module_type' => 'product_tabs', 'product_info' => $product_info))) {
							$product_tabs[$module_data['position']][] = $tab;
						}
                    }
                }

                foreach ($product_tabs as $position => &$items) {
                    $_items = array();

                    foreach ($items as $item) {
                        $_items[$item['display']][] = $item;
                    }

                    foreach ($_items as $items) {
                        $data['product_blocks'][$position][] = $this->load->controller('journal3/product_tabs/tabs', array('items' => $items, 'position' => $position));
                    }
                }

                $this->load->model('catalog/manufacturer');

                $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);

                if ($manufacturer_info && $manufacturer_info['image']) {
                    $data['manufacturer_image'] = $this->model_journal3_image->resize($manufacturer_info['image'], $this->journal3->settings->get('image_dimensions_manufacturer_logo.width'), $this->journal3->settings->get('image_dimensions_manufacturer_logo.height'), $this->journal3->settings->get('image_dimensions_manufacturer_logo.resize'));
                    $data['manufacturer_image2x'] = $this->model_journal3_image->resize($manufacturer_info['image'], $this->journal3->settings->get('image_dimensions_manufacturer_logo.width') * 2, $this->journal3->settings->get('image_dimensions_manufacturer_logo.height') * 2, $this->journal3->settings->get('image_dimensions_manufacturer_logo.resize'));
                } else {
                    $data['manufacturer_image'] = false;
                }

                if ($product_info['special']) {
                    $data['date_end'] = $this->journal3->productCountdown($product_info);
                } else {
                    $data['date_end'] = false;
                }

                if ($this->journal3->document->isPopup()) {
                    $data['view_more_url'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);
                }
            }
            
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			$this->document->setTitle($product_info['meta_title']);

            if (isset($this->request->get['page']) || isset($this->request->get['limit']) || isset($this->request->get['order']) || isset($this->request->get['sort']) || isset($this->request->get['filter_name']) || isset($this->request->get['filter_description'])) {
                $this->document->addSeoMeta('noindex,follow', 'robots', 'name');
            }
            
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			
                //SEO Backpack
                $this->config->load('isenselabs/isenselabs_seo');
                $isense_module_path = $this->config->get('isenselabs_seo_path');
                $isense_call_model  = $this->config->get('isenselabs_seo_model');
                $this->load->model($isense_module_path);

                $canonical_check = $this->{$isense_call_model}->getSetting('canonical_products');

                if ($canonical_check) {
                    $this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id'], true), 'canonical');
                }
			
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			$data['heading_title'] = $product_info['name'];

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			
			//iSense SEO Module Loader
            $this->config->load('isenselabs/isenselabs_seo');
            $isense_module_path = $this->config->get('isenselabs_seo_path');
            $isense_call_model  = $this->config->get('isenselabs_seo_model');
            $this->load->model($isense_module_path);
            
            $autolinks = $this->{$isense_call_model}->getAutoLinks();
            
            if ($autolinks) {
                $data['description'] = $this->{$isense_call_model}->getDescriptionWithAutolinks($data['description']);
            }
            
            $h1 = $this->{$isense_call_model}->getProductH1Tag($product_id);
            $h2 = $this->{$isense_call_model}->getProductH2Tag($product_id);
            
            $data['description'] = (!empty($h2)) ? '<h2>' . $h2 . '</h2>' . $data['description'] : $data['description'];
            
            $data['heading_title'] = (!empty($h1)) ? $h1 : $product_info['name'];
			

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				
            if (defined('JOURNAL3_ACTIVE')) {
                $stylePrefix = $this->journal3->document->isPopup('quickview') ? 'quickviewPageStyle' : 'productPageStyle';
                $data['stock'] = $this->journal3->settings->get($stylePrefix . 'ProductInStockText');

                // some third party addons for in stock status
                if (isset($product_info['in_stock_status']) && $product_info['in_stock_status']) {
                    $data['stock'] = $product_info['in_stock_status'];
                }
            } else {
                $data['stock'] = $this->language->get('text_instock');
            }
            
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

            if (defined('JOURNAL3_ACTIVE')) {
                array_unshift($results, array('image' => $product_info['image']));

                foreach ($results as $result) {
				    $data['images'][] = array(
                        'galleryThumb'  => $this->model_journal3_image->resize($result['image'], $this->journal3->settings->get('image_dimensions_popup_thumb.width'), $this->journal3->settings->get('image_dimensions_popup_thumb.height'), $this->journal3->settings->get('image_dimensions_popup_thumb.resize')),
                        'image'         => $this->model_journal3_image->resize($result['image'], $this->journal3->settings->get('image_dimensions_thumb.width'), $this->journal3->settings->get('image_dimensions_thumb.height'), $this->journal3->settings->get('image_dimensions_thumb.resize')),
                        'image2x'       => $this->model_journal3_image->resize($result['image'], $this->journal3->settings->get('image_dimensions_thumb.width') * 2, $this->journal3->settings->get('image_dimensions_thumb.height') * 2, $this->journal3->settings->get('image_dimensions_thumb.resize')),
                        'popup'         => $this->model_journal3_image->resize($result['image'], $this->journal3->settings->get('image_dimensions_popup.width'), $this->journal3->settings->get('image_dimensions_popup.height'), $this->journal3->settings->get('image_dimensions_popup.resize')),
                        'thumb'         => $this->model_journal3_image->resize($result['image'], $this->journal3->settings->get('image_dimensions_additional.width'), $this->journal3->settings->get('image_dimensions_additional.height'), $this->journal3->settings->get('image_dimensions_additional.resize')),
                        'thumb2x'       => $this->model_journal3_image->resize($result['image'], $this->journal3->settings->get('image_dimensions_additional.width') * 2, $this->journal3->settings->get('image_dimensions_additional.height') * 2, $this->journal3->settings->get('image_dimensions_additional.resize'))
				    );
			    }

			    $results = array();
            }
            

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}

			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							
            'image'                   => defined('JOURNAL3_ACTIVE') ? ($option_value['image'] ? $this->model_journal3_image->resize($option_value['image'], $this->journal3->settings->get('image_dimensions_options.width'), $this->journal3->settings->get('image_dimensions_options.height'), $this->journal3->settings->get('image_dimensions_options.resize')) : false) : $this->model_tool_image->resize($option_value['image'], 50, 50),
            
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

                if (defined('JOURNAL3_ACTIVE')) {
                    if ($min_qty = (int)\Journal3\Utils\Arr::get($this->request->get, 'product_quantity', 0)) {
                        $data['minimum'] = $min_qty;
                    }
                }
            

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = defined('JOURNAL3_ACTIVE') ? array() : $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

                // iSense SEO Module Loader
                $this->config->load('isenselabs/isenselabs_seo');
                $isense_module_path = $this->config->get('isenselabs_seo_path');
                $isense_call_model  = $this->config->get('isenselabs_seo_model');
                $this->load->model($isense_module_path);
               
                $data['richsnippets_product_data']        = $this->{$isense_call_model}->getSetting('richsnippets_product_data');
                $data['richsnippets_product_breadcrumbs'] = $this->{$isense_call_model}->getSetting('richsnippets_product_breadcrumbs');
                
                $seo_data                      = array();
                $seo_data['name']              = $product_info['name']; 
                $seo_data['quantity']          = $product_info['quantity'];
                $seo_data['sku']               = $product_info['sku'];
                $seo_data['ean']               = $product_info['ean'];
                $seo_data['mpn']               = $product_info['mpn'];
                $seo_data['currency_code']     = $this->session->data['currency'];
                $seo_data['review_count']      = $product_info['reviews'];
                $seo_data['rating']            = (int)$product_info['rating'];
                $seo_data['model']             = $product_info['model'];
                $seo_data['url']               = $this->url->link('product/product', 'product_id=' . $product_info['product_id'], 'SSL');
                $seo_data['description']       = substr(trim(strip_tags(str_replace('"', '',html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')))), 0, 150);
                
                if ($product_info['image']) {
                    $seo_data['image']         = $this->model_tool_image->resize($product_info['image'], 500, 500);
                } else {
                    $seo_data['image']         = '';
                }
                if ((float)$product_info['special']) {
                    $seo_data['price'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));

                    $price_valid_until_query = $this->db->query("SELECT date_end FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = '" . (int)$product_info['product_id'] . "' AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1");
                        if ($price_valid_until_query->num_rows > 0){
                            $price_valid_until = $price_valid_until_query->row['date_end'];
                        }
                } else {
                   // LoginToSeePrice Compatibility Fix
                   if (!empty($product_info['actual_special'])) {
                       $seo_data['price'] = $this->tax->calculate($product_info['actual_special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
                   } else if (!empty($product_info['actual_price'])) {
                       $seo_data['price'] = $this->tax->calculate($product_info['actual_price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
                   } else {                   
                       $seo_data['price'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
                   }
                }
                
				$seo_data['price'] = number_format($seo_data['price'], 2, '.', '');
               	$seo_data['price_valid_until'] = isset($price_valid_until) && $price_valid_until != "0000-00-00" ? $price_valid_until : '';

                if ($product_info['reviews'] > 0) {
                       $review_data = $this->db->query("SELECT * FROM " . DB_PREFIX . "review r WHERE r.product_id = '" . (int)$product_info['product_id'] . "' LIMIT 1")->row;

                       if ($review_data){
                            $seo_data['review_rating'] = $review_data['rating'];
                            $seo_data['review_author'] = $review_data['author'];    
                       }
                    }
                if ($data['richsnippets_product_data']) {
                    $data['seo_data'] = $seo_data;
                }
                
                $data['seo_data']['breadcrumbs'] = array();
				
                if ($data['richsnippets_product_breadcrumbs']) {   
                    $categories         = $this->model_catalog_product->getCategories($product_info['product_id']);
                    $first_category     = end($categories);

                    $seo_categories = $this->{$isense_call_model}->getCategoryPathByCategoryId($first_category['category_id']);

                    if (!empty($seo_categories)) {
                        $data['seo_data']['breadcrumbs'][] = array(
                            'name' => $this->config->get('config_name'),
                            'href' => $this->url->link('common/home', '', 'SSL')
                        );

                        $seo_categories_parts = explode('_', (string) $seo_categories);
                        foreach ($seo_categories_parts as $seo_cat) {
                            $cat_info = $this->model_catalog_category->getCategory($seo_cat);
                            if ($cat_info) {
                                $cat_info['href'] = html_entity_decode($this->url->link('product/category', 'path='.$cat_info['category_id'], 'SSL'), ENT_QUOTES, 'UTF-8');
                                $data['seo_data']['breadcrumbs'][] = $cat_info;
                            }
                        }
                    }
                }
                
                $twitter_card                     = $this->{$isense_call_model}->getSetting('twitter_card');
                $twitter_card_username            = $this->{$isense_call_model}->getSetting('twitter_card_username');
                $twitter_card_product_data        = $this->{$isense_call_model}->getSetting('twitter_card_product_data');
                $facebook_open_graph              = $this->{$isense_call_model}->getSetting('facebook_open_graph');
                $facebook_open_graph_product_data = $this->{$isense_call_model}->getSetting('facebook_open_graph_product_data');
                
                if ($twitter_card && $twitter_card_product_data) {
                    $this->document->addSeoMeta('product', 'twitter:card', 'name');
                    if ($twitter_card_username) {
                        $this->document->addSeoMeta($twitter_card_username, 'twitter:creator', 'name');
                        $this->document->addSeoMeta($twitter_card_username, 'twitter:site', 'name');
                    }
                    
                    if (!empty($product_info['meta_description'])) {
                        $this->document->addSeoMeta($product_info['meta_description'].'...', 'twitter:description', 'name');
                    }
                    
                    $this->document->addSeoMeta($seo_data['name'], 'twitter:title', 'name');
                    $this->document->addSeoMeta($seo_data['url'], 'twitter:domain', 'name');
                    
                    if (!empty($seo_data['image'])) {
                        $this->document->addSeoMeta($seo_data['image'], 'twitter:image', 'name');
                    }                
                }
                
                if ($facebook_open_graph && $facebook_open_graph_product_data) {
                    $fb_app_id = $this->{$isense_call_model}->getSetting('facebook_open_graph_app_id');                     
                    if ($fb_app_id) {
                         $this->document->addSeoMeta($fb_app_id, 'fb:app_id', 'property');
                    }
                   
                    $this->document->addSeoMeta('product', 'og:type', 'property');
                    $this->document->addSeoMeta($seo_data['name'], 'og:title', 'property');
                    
                    if (!empty($product_info['meta_description'])) {
                        $this->document->addSeoMeta($product_info['meta_description'], 'og:description', 'property');
                    }
                    
                    $this->document->addSeoMeta($seo_data['url'], 'og:url', 'property');
                    
                    if (!empty($seo_data['image'])) {
                        $this->document->addSeoMeta($seo_data['image'], 'og:image', 'property');
                    }
                    
                    $this->document->addSeoMeta($seo_data['price'], 'product:price:amount', 'property');
                    $this->document->addSeoMeta($seo_data['currency_code'], 'product:price:currency', 'property');
                }
                
                //Hreflang
                $this->load->model('localisation/language');
				$languages                        = $this->model_localisation_language->getLanguages();
                if ($this->request->server['HTTPS']) {
                    $seo_main_url = $this->config->get('config_ssl');
                } else {
                    $seo_main_url = $this->config->get('config_url');
                }
                $hreflang_product                 = $this->{$isense_call_model}->getSetting('hreflang_products');
                $subfolder_prefix_check           = $this->{$isense_call_model}->getSetting('subfolder_prefixes');
                $default_lang_prefix              = $this->{$isense_call_model}->getSetting('default_lang_prefix');

                if ($hreflang_product) {
                    $language_string = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'")->row['value'];

                    foreach($languages as $language) {                 
                        $query = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url_alias` WHERE `query` = 'product_id=" . (int)$product_info['product_id'] . "' AND `language_id` = '".  $language['language_id']."' LIMIT 1");

                        $lang_prefix  = '';
                        if ($subfolder_prefix_check) {
                            if ($language['code'] != $language_string || $default_lang_prefix) {
                                $lang_prefix =  $language['code'] . '/';

                                $subfolder_prefixes_alias = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "seo_module_settings` WHERE `key` = '" . $this->db->escape('subfolder_prefixes_alias'). "' LIMIT 1");
                                $subfolder_prefixes_alias = json_decode($subfolder_prefixes_alias->row['value'], true);
                                if (isset($subfolder_prefixes_alias[$language['code']])) {
                                    $lang_prefix = $subfolder_prefixes_alias[$language['code']] . '/';
                                }
                            }
                        }

                        if ($query->num_rows) {
                            $this->document->addSeoHreflang($seo_main_url . $lang_prefix . $query->row['keyword'], $language['code']);
                        }
                    }
                }
			

            if (defined('JOURNAL3_ACTIVE')) {
                $this->load->model('journal3/product');
                $this->model_journal3_product->addRecentlyViewedProduct($this->request->get['product_id']);

                $data['products_sold'] = $this->model_journal3_product->getProductsSold($this->request->get['product_id']);
                $data['product_views'] = $product_info['viewed'];
            }
            

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

$this->load->controller('extension/module/isenselabs_seo/notFoundPageHandler');
 if (function_exists('Whz')) Whz("product/not_found"); //Lightning 
			$this->document->setTitle($this->language->get('text_error'));

            if (isset($this->request->get['page']) || isset($this->request->get['limit']) || isset($this->request->get['order']) || isset($this->request->get['sort']) || isset($this->request->get['filter_name']) || isset($this->request->get['filter_description'])) {
                $this->document->addSeoMeta('noindex,follow', 'robots', 'name');
            }
            

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

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
