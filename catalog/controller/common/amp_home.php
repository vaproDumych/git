<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class Controllercommonamphome extends Controller {

	use AmpControllerTrait;

	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('webkul/amp');

		$data['slides'] = array();

		if($this->config->get('wk_amp_image')) {
			foreach ($this->config->get('wk_amp_image') as $key => $slide) {
				if(isset($slide['image_status']) && !$slide['image_status']) {
					continue;
				}
				if(isset($slide['image']) && $slide['image'] && file_exists(DIR_IMAGE.$slide['image'])) {
					$image = $this->model_tool_image->resize($slide['image'], 800, 600);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 800, 600);
				}
				$data['slides'][] = array(
					'title' => isset($slide['wk_amp_image_description'][$this->config->get('config_language_id')]['title']) ? $slide['wk_amp_image_description'][$this->config->get('config_language_id')]['title'] : 'title',
					'link' => $slide['link'],
					'image' => $image,
					'status' => $slide['image_status'],
				);
			}
		}
		$bestSellers = $this->model_catalog_product->getBestSellerProducts(6);
		$data['bestSellers'] = array();

		if($bestSellers) {
			foreach ($bestSellers as $result) {
				if ($result['image'] && file_exists(DIR_IMAGE.$result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], 75, 75);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 75, 75);
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
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				// if(strlen($result['name']) > 15) {
				// 	$product_name = utf8_substr($result['name'], 0, 15) . '..';
				// } else {
					$product_name = $result['name'];
				// }

				$cdn_url = $this->model_webkul_amp->getAmpCdnUrlProduct($result['product_id']);

				$data['bestSellers'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $product_name,
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'reviews'	  => $result['reviews'],
					'href'        => isset($cdn_url['url']) && $cdn_url['url'] ? $cdn_url['url'] : $this->urlChange('product/amp_product', 'product_id=' . $result['product_id'])
				);
			}
		}

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => 6,
		);

		$latests = $this->model_catalog_product->getProducts($filter_data);

		if ($latests) {
			foreach ($latests as $result) {
				if ($result['image'] && file_exists(DIR_IMAGE.$result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], 75, 75);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 75, 75);
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
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				if(strlen($result['name']) > 15) {
					$product_name = utf8_substr($result['name'], 0, 15) . '..';
				} else {
					$product_name = $result['name'];
				}

				$cdn_url = $this->model_webkul_amp->getAmpCdnUrlProduct($result['product_id']);

				$data['latests'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $product_name,
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'reviews'     => $result['reviews'],
					'href'        => isset($cdn_url['url']) && $cdn_url['url'] ? $cdn_url['url'] : $this->urlChange('product/amp_product', 'product_id=' . $result['product_id'])
				);
			}
		}

		$data['amp_footer'] = $this->load->controller('common/amp_footer');
		$data['amp_header'] = $this->load->controller('common/amp_header');

		if (version_compare(VERSION, '2.2', '>=')) {
			$this->response->setOutput($this->load->view('common/amp_home', $data));
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/amp_home.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/amp_home.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/common/amp_home.tpl', $data));
			}
		}
	}
}
