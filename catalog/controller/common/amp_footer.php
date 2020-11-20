<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class Controllercommonampfooter extends Controller {

	use AmpControllerTrait;

	public function index() {
		$data = $this->load->language('common/footer');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->urlChange('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->urlChange('information/contact');
		$data['return'] = $this->urlChange('account/return/add', '', true);
		$data['sitemap'] = $this->urlChange('information/sitemap');
		$data['manufacturer'] = $this->urlChange('product/manufacturer');
		$data['voucher'] = $this->urlChange('account/voucher', '', true);
		$data['affiliate'] = $this->urlChange('affiliate/account', '', true);
		$data['special'] = $this->urlChange('product/special');
		$data['account'] = $this->urlChange('account/account', '', true);
		$data['order'] = $this->urlChange('account/order', '', true);
		$data['wishlist'] = $this->urlChange('account/wishlist', '', true);
		$data['newsletter'] = $this->urlChange('account/newsletter', '', true);
		$data['display_footer_links'] = $this->config->get('wk_amp_display_footer_links');

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		if (version_compare(VERSION, '2.2', '>=')) {
			return ($this->load->view('common/amp_footer', $data));
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/amp_footer.tpl')) {
				return ($this->load->view($this->config->get('config_template') . '/template/common/amp_footer.tpl', $data));
			} else {
				return ($this->load->view('default/template/common/amp_footer.tpl', $data));
			}
		}

	}
}
