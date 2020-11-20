<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class Controllerproductampproduct extends Controller {

	use AmpControllerTrait;

	public function index() {
		$data = array();
		$this->load->language('product/product');
		if(isset($this->request->get['product_id']) && $this->request->get['product_id']) {
			$data['wk_amp_fb_app_id'] = $this->config->get('wk_amp_fb_app_id');
			$data['product_id'] = $this->request->get['product_id'];
			$data['product_url'] = $this->urlChange('product/product', 'product_id=' .$this->request->get['product_id'], true);
			$data['social_share'] = $this->config->get('wk_amp_social_share');
			$data['wk_related_products'] = $this->config->get('wk_amp_related_products');

			$this->load->model('catalog/product');
			$product = $this->model_catalog_product->getProduct($this->request->get['product_id']);
			if(empty($product))
				$this->response->redirect($this->urlChange('product/product','&product_id=' . $this->request->get['product_id'],true));
			$data['title'] = $product['name'];

			$this->load->model('tool/image');
			$this->load->model('webkul/amp');

			if ($product['image'] && file_exists(DIR_IMAGE.$product['image'])) {
				$data['popup'] = $this->model_tool_image->resize($product['image'], 800, 600);
			} else {
				$data['popup'] = $this->model_tool_image->resize('placeholder.png', 800, 600);
			}
			if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
				$data['logo'] = $this->model_tool_image->resize($this->config->get('config_logo'), 200, 200);
			} else {
				$data['logo'] = '';
			}
			$allowed_html_tags = "<article><nav><aside><h1><h2><h3><h4><h5><h6><address><p><hr><pre><blockquote><ol><ul><li><dl><dt><dd><figure><figcaption><div><main><a><em><strong><small><s><site><q><dfn><abbr><data><code><time><var><samp><kbd><sub><sup><i><b><u><mark><ruby><rt><rb><rtc><wbr><br><span><bdo><bdi><rtc><ins><del><source><table><caption><colgroup><col><tbody><thead><tfoot><tr><td><th><svg><g><path><glyph><glyphref><marker><view><circle><line><polygon><polyline><rect><text><textpath><tref><tspan><clippath><filter><lineargradient><radialgradient><mask><pattern><vkern><hkern><defs><use><symbol><desc><title><iframe>";

			$product['description'] = strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8'),$allowed_html_tags);

			if (strpos($product['description'], "<iframe")) {
				$product['description'] = preg_replace("/<iframe/", "<amp-iframe sandbox=\"allow-scripts allow-same-origin\" layout=\"responsive\"", $product['description']);
				$product['description'] = preg_replace('/<\/iframe>/', '</amp-iframe>', $product['description']);
			}

			$product['description'] = preg_replace('#((style=("|\')(.*?)("|\')))#', '', $product['description']);
			$product['short_description'] = utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '...';

			$data['amp_product_url'] = $this->urlChange('product/amp_product', 'product_id=' . $data['product_id'] , true);

			$this->document->setTitle($product['meta_title']);
			$this->document->setDescription($product['meta_description']);
			$this->document->setKeywords($product['meta_keyword']);

			$data['product'] = $product;
			$data['title'] = $product['name'];
			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$data['price'] = Membership::currencyFormat($this->registry,$this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}

			if ((float)$product['special'] && $this->config->get('wk_amp_show_special')) {
				$data['special'] = Membership::currencyFormat($this->registry,$this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = Membership::currencyFormat($this->registry,(float)$product['special'] ? $product['special'] : $product['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => Membership::currencyFormat($this->registry,$this->tax->calculate($discount['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			if ($product['quantity'] <= 0) {
				$data['stock'] = $product['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				if($result['image'] && file_exists(DIR_IMAGE.$result['image'])) {
					$data['images'][] = array(
						'popup' => $this->model_tool_image->resize($result['image'], 800, 600),
						'thumb' => $this->model_tool_image->resize($result['image'], 800, 600)
					);
				}
			}
			if ($this->config->get('wk_amp_related_products')) {

				$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
				$data['related_products'] = array();
				if($results) {
					foreach ($results as $result) {
						if ($result['image'] && file_exists(DIR_IMAGE.$result['image'])) {
							$image = $this->model_tool_image->resize($result['image'], 200, 150);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', 200, 150);
						}

						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = Membership::currencyFormat($this->registry,$this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$price = false;
						}

						if ((float)$result['special'] && $this->config->get('wk_amp_show_special')) {
							$special = Membership::currencyFormat($this->registry,$this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$special = false;
						}

						if ($this->config->get('config_tax')) {
							$tax = Membership::currencyFormat($this->registry,(float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
						} else {
							$tax = false;
						}

						if ($this->config->get('config_review_status')) {
							$rating = (int)$result['rating'];
						} else {
							$rating = false;
						}

						$cdn_url = $this->model_webkul_amp->getAmpCdnUrlProduct($result['product_id']);

						$data['related_products'][] = array(
							'product_id'  => $result['product_id'],
							'thumb'       => $image,
							'name'        => $result['name'],
							'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
							'price'       => $price,
							'special'     => $special,
							'tax'         => $tax,
							'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
							'rating'      => $rating,
							'href'        => isset($cdn_url['url']) && $cdn_url['url'] ? $cdn_url['url'] : $this->urlChange('product/amp_product', 'product_id=' . $result['product_id'])
						);

					}
				}
			}

			$data['buy_now'] = $this->urlChange('product/product', 'product_id=' . $data['product_id'] , true);

		}  else {
			$this->response->redirect($this->urlChange('common/home','',true));
		}

		$this->load->model('catalog/review');

		$data['reviews'] = array();

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], 0, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$data['addToCompare'] = $this->urlChange('product/amp_product/addToCompare', 'product_id=' . $data['product_id'] , true);
		$data['addToWishlist'] = $this->urlChange('product/amp_product/addToWishlist', 'product_id=' . $data['product_id'] , true);

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}
		$data['store_currency'] = $this->config->get('config_currency');
		$data['amp_header'] = $this->load->controller('common/amp_header');
		$data['amp_footer'] = $this->load->controller('common/amp_footer');

		if (version_compare(VERSION, '2.2', '>=')) {
			$this->response->setOutput($this->load->view('product/amp_product', $data));
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/amp_product.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/amp_product.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/amp_product.tpl', $data));
			}
		}

	}

	public function addToCompare() {
		$this->load->language('product/compare');

		$json = array();

		if (!isset($this->session->data['compare'])) {
			$this->session->data['compare'] = array();
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = $this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (!in_array($this->request->get['product_id'], $this->session->data['compare'])) {
				if (count($this->session->data['compare']) >= 4) {
					array_shift($this->session->data['compare']);
				}

				$this->session->data['compare'][] = $this->request->get['product_id'];
			}

			$this->session->data['success'] = sprintf($this->language->get('text_success'), $this->urlChange('product/product', 'product_id=' . $this->request->get['product_id']), $product_info['name'], $this->urlChange('product/compare'));
			$this->response->redirect($this->request->server['HTTP_REFERER']);
		}
	}

	public function addToWishlist() {
		$this->load->language('account/wishlist');

		$json = array();

		if (isset($this->request->get['product_id'])) {
			$product_id = $this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if ($this->customer->isLogged()) {
				// Edit customers cart
				$this->load->model('account/wishlist');

				$this->model_account_wishlist->addWishlist($this->request->get['product_id']);

				$json['success'] = sprintf($this->language->get('text_success'), $this->urlChange('product/product', 'product_id=' . (int)$this->request->get['product_id']), $product_info['name'], $this->urlChange('account/wishlist'));

				$json['total'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
			} else {
				if (!isset($this->session->data['wishlist'])) {
					$this->session->data['wishlist'] = array();
				}

				$this->session->data['wishlist'][] = $this->request->get['product_id'];

				$this->session->data['wishlist'] = array_unique($this->session->data['wishlist']);

				$this->session->data['success'] = sprintf($this->language->get('text_login'), $this->urlChange('account/login', '', true), $this->urlChange('account/register', '', true), $this->urlChange('product/product', 'product_id=' . (int)$this->request->get['product_id']), $product_info['name'], $this->urlChange('account/wishlist'));
				$this->response->redirect($this->request->server['HTTP_REFERER']);
			}
		}
	}
}
