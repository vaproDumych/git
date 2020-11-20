<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class Controllercommonampheader extends Controller {

	use AmpControllerTrait;

	public function index() {

		if (!$this->config->get('wk_amp_status')) {
			$this->response->redirect($this->urlChange('common/home','',true));
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
			$data['website_url'] = HTTPS_SERVER;
		} else {
			$server = $this->config->get('config_url');
			$data['website_url'] = HTTP_SERVER;
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		/**
		 * to get route of page so that only required js are added
		 * @var [type]
		 */
		$data['wk_route'] = $this->request->get['route'];

		$this->load->model('tool/image');
		$this->load->model('webkul/amp');

		$data['title'] = $this->document->getTitle();
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['name'] = $this->config->get('config_name');

		$data['wk_amp_sub_menu'] = $this->config->get('wk_amp_sub_menu');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
			$data['logo'] = $this->model_tool_image->resize($this->config->get('config_logo'), 500, 46);
		} else {
			$data['logo'] = '';
		}

		if (is_file(DIR_IMAGE . 'amp_images/close-icon-black.png')) {
			$data['nav_close'] = $server . 'image/amp_images/close-icon-black.png';
		} else {
			$data['nav_close'] = '';
		}

		if (is_file(DIR_IMAGE . 'amp_images/Menu-Main.png')) {
			$data['nav_icon_normal'] = $server . 'image/amp_images/Menu-Main.png';
			$data['nav_icon_hover'] = $server . 'image/amp_images/menu-hover.png';
		} else {
			$data['nav_icon'] = '';
		}

		if (is_file(DIR_IMAGE . 'amp_images/whatsapp.png')) {
			$data['whatsapp'] = $server . 'image/amp_images/whatsapp.png';
			$data['whatsapp'] = $server . 'image/amp_images/whatsapp.png';
		} else {
			$data['whatsapp'] = '';
		}

		if (is_file(DIR_IMAGE . 'amp_images/search-icon.png')) {
			$data['search_image_normal'] = $server . 'image/amp_images/search-blue.png';
			$data['search_image_hover'] = $server . 'image/amp_images/search-hover.png';
		} else {
			$data['search_image'] = '';
		}

		if (is_file(DIR_IMAGE . 'amp_images/drop-down-acc.png')) {
			$data['drop_down_acc'] = $server . 'image/amp_images/drop-down-acc.png';
		} else {
			$data['drop_down_acc'] = '';
		}
		if (is_file(DIR_IMAGE . 'amp_images/drop-up-acc.png')) {
			$data['drop_up_acc'] = $server . 'image/amp_images/drop-up-acc.png';
		} else {
			$data['drop_up_acc'] = '';
		}
		if (is_file(DIR_IMAGE . 'amp_images/drop-down.png')) {
			$data['drop_down_menu'] = $server . 'image/amp_images/drop-down.png';
		} else {
			$data['drop_down_menu'] = '';
		}
		if (is_file(DIR_IMAGE . 'amp_images/drop-up.png')) {
			$data['drop_up_menu'] = $server . 'image/amp_images/drop-up.png';
		} else {
			$data['drop_up_menu'] = '';
		}
		if (is_file(DIR_IMAGE . 'amp_images/Wishlist.png')) {
			$data['wishlist'] = $server . 'image/amp_images/Wishlist.png';
		} else {
			$data['wishlist'] = '';
		}

		if (is_file(DIR_IMAGE . 'amp_images/compare.png')) {
			$data['compare'] = $server . 'image/amp_images/compare.png';
		} else {
			$data['compare'] = '';
		}

		if(isset($this->request->get['route'])) {
			if($this->request->get['route'] == 'product/amp_product' && isset($this->request->get['product_id']) && $this->request->get['product_id']) {
				$data['product_id'] = (int)$this->request->get['product_id'];
				$data['main_url'] = $this->urlChange('product/product', 'product_id=' . (int)$this->request->get['product_id'], true);
				$this->load->model('catalog/product');
				$product = $this->model_catalog_product->getProduct($this->request->get['product_id']);
				$data['iframe'] = false;

				if (strpos(html_entity_decode($product['description']), "<iframe"))
					$data['iframe'] = true;
			} else if($this->request->get['route'] == 'product/amp_category' && isset($this->request->get['path']) && $this->request->get['path']) {
				$data['path'] = $this->request->get['path'];
				$data['main_url'] = $this->urlChange('product/category', 'path=' .$this->request->get['path'], true);
			} else if($this->request->get['route'] == "common/amp_home") {
				$data['main_url'] = $this->urlChange('common/home', '', true);
			} else if($this->request->get['route'] == "product/amp_search") {
				$data['main_url'] = $this->urlChange('product/search', $this->searchUrl(), true);
			}
		} else {
			$data['main_url'] = $this->urlChange('common/home', '', true);
		}

		$this->load->language('common/header');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));
			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;
					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($this->config->get('wk_amp_display_only_parent_category')) {
				if ($category['top']) {
					$data['categories'][] = $this->getCategoryData($category);
				}
			} else {
				$data['categories'][] = $this->getCategoryData($category);
			}
		}

		$data['amp_page'] 		= '';
	  $data['wkstore_logo'] = HTTP_SERVER.'image/' . $this->config->get('config_logo');
	  $data['wkconfig_name'] = $this->config->get('config_name');

		if ($this->request->get['route'] == 'common/amp_home') {
			$data['amp_page'] 	= 'home';
		} else if ($this->request->get['route'] == 'product/amp_product') {
			$data['amp_page']	= 'product';

			$product_id = $this->request->get['product_id'];
			$this->load->model('catalog/product');
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if (!empty($product_info) && is_array($product_info)) {
          $data['currency_code'] = $this->session->data['currency'];
          $data['wk_richsnippetproduct_info'] = $product_info;
          $data['price'] = $product_info['price'];
          $category_id = $this->model_catalog_product->getCategories($product_info['product_id']);
          foreach ($category_id as $key => $id) {
            $category_info_data[$key] = $this->model_catalog_category->getCategory($id['category_id']);
          }
          $data['wkweight_class'] = $this->weight->getUnit($data['wk_richsnippetproduct_info']['weight_class_id']);
          $data['wklenght_class'] = $this->length->getUnit($data['wk_richsnippetproduct_info']['length_class_id']);
          $data['wk_richsnippetproduct_info']['width'] = $this->length->convert($data['wk_richsnippetproduct_info']['width'],$data['wk_richsnippetproduct_info']['length_class_id'],1);
          $data['wk_richsnippetproduct_info']['height'] = $this->length->convert($data['wk_richsnippetproduct_info']['height'],$data['wk_richsnippetproduct_info']['length_class_id'],1);

        if(isset($category_info_data))
            $data['wk_richsnippetproduct_info']['category_info'] = $category_info_data;
        else {
        	$data['wk_richsnippetproduct_info']['category_info'] = array();
        }
        $data['wkproductimagewidth'] = $this->config->get($this->config->get('config_theme') . '_image_additional_width');
        $data['wkproductimageheight'] = $this->config->get($this->config->get('config_theme') . '_image_additional_height');
	      $data['wkproducturl'] = $this->urlChange('product/product', '&product_id=' . $this->request->get['product_id']);
	      if ((float)$product_info['special'] && $this->config->get('wk_amp_show_special')) {
					$data['special'] = Membership::currencyFormat($this->registry,$this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$data['special'] = false;
				}
				$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
				$data['rating'] = (int)$product_info['rating'];
				$this->load->model('tool/image');
				if ($product_info['image'] && file_exists(DIR_IMAGE.$product_info['image'])) {
					$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 100, 100);
				} else {
					$data['thumb'] = $this->model_tool_image->resize('placeholder.png', 100, 100);
				}
	        } else {
				$data['amp_page'] 		= '';
	        }
		}

		$store_id = $this->config->get('config_store_id');

		$configs = array(
			'wk_amp_image',
			'wk_amp_social_share',
			'wk_amp_page_bg_color',
			'wk_amp_a_txt_color',
			'wk_amp_a_txt_hover_color',
			'wk_amp_header_bg_color',
			'wk_amp_footer_bg_color',
			'wk_amp_footer_txt_color',
			'wk_amp_btn_bg_color',
			'wk_amp_btn_txt_color',
			'wk_amp_btn_border_color',
			'wk_amp_side_bar_backgroundcolor',
			'wk_amp_display_footer_links',
			'wk_amp_section_color',
			'wk_amp_section_expanded_color',
			'wk_amp_related_products',
			'wk_amp_custom_css',
		);

		foreach ($configs as $config) {
			$data[$config] = $this->config->get($config);
		}

		$data['display_footer_links'] = $this->config->get('wk_amp_display_footer_links');
		$data['display_slide_image']	= $this->config->get('wk_amp_image');

		$data['search'] = $this->urlChange('product/search' , '', true);
		$data['home'] = $this->urlChange('common/amp_home', '', true);

		if (version_compare(VERSION, '2.2', '>=')) {
			return ($this->load->view('common/amp_header', $data));
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/amp_header.tpl')) {
				return ($this->load->view($this->config->get('config_template') . '/template/common/amp_header.tpl', $data));
			} else {
				return ($this->load->view('default/template/common/amp_header.tpl', $data));
			}
		}
	}

	private function getCategoryData($category) {
		// Level 2
		$children_data = array();

		$children = $this->model_catalog_category->getCategories($category['category_id']);

		foreach ($children as $child) {
			$filter_data = array(
				'filter_category_id'  => $child['category_id'],
				'filter_sub_category' => true
			);

			$cdn_url = $this->model_webkul_amp->getAmpCdnUrlCategory($category['category_id'] . '_' . $child['category_id']);

			$children_data[] = array(
				'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'href'  => isset($cdn_url['url']) && $cdn_url['url'] ? $cdn_url['url'] : $this->urlChange('product/amp_category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
			);
		}

		if(isset($category['image']) && $category['image'] && file_exists(DIR_IMAGE.$category['image'])) {
			$image = $this->model_tool_image->resize($category['image'], 50, 50);
		} else {
			$image = $this->model_tool_image->resize('placeholder.png', 50, 50);
		}

		$cdn_url = $this->model_webkul_amp->getAmpCdnUrlCategory($category['category_id']);

		// Level 1
		return array(
			'name'     => $category['name'],
			'image'	   => $image,
			'children' => $children_data,
			'column'   => $category['column'] ? $category['column'] : 1,
			'href'     => isset($cdn_url['url']) && $cdn_url['url'] ? $cdn_url['url'] : $this->urlChange('product/amp_category', 'path=' . $category['category_id'])
		);
	}

	private function searchUrl() {
		$url = '';
		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['tag'])) {
			$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
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
		return $url;
	}

}
