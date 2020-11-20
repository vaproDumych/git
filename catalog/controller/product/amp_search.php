<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class ControllerProductAmpsearch extends Controller {

	use AmpControllerTrait;

	public function jsonSearch() {

		if (isset($this->request->get['query'])) {
			$this->request->get['search'] = $this->request->get['query'];
			$this->response->addHeader('Access-Control-Allow-Credentials: true');
		}

		$origin = '';
		foreach (getallheaders() as $key => $value) {
			if (strtolower($key) === 'origin') {
				$origin = $value;
			} else if (strtolower($key) == 'amp-same-origin') {
				$origin = true;
			}
		}

		if ($origin && isset($this->request->get['__amp_source_origin']) && str_replace('https://','',(html_entity_decode($this->request->get['__amp_source_origin']))) == $_SERVER['SERVER_NAME']) {
			if ($origin === true) {
				$this->response->addHeader('Access-Control-Allow-Origin: *');
				$this->response->addHeader('AMP-Access-Control-Allow-Source-Origin: ' . html_entity_decode($this->request->get['__amp_source_origin']));
				$this->response->addHeader('Access-Control-Expose-Headers: AMP-Access-Control-Allow-Source-Origin');
			} else if (isset($_SERVER['SERVER_NAME']) && str_replace(array('https://','.cdn.ampproject.org','.amp.cloudflare.com'),'',$origin) == str_replace(array('-','.'),array('--','-'),$_SERVER['SERVER_NAME'])) {
				$this->response->addHeader('Access-Control-Allow-Origin: ' . $origin);
				$this->response->addHeader('AMP-Access-Control-Allow-Source-Origin: ' . html_entity_decode($this->request->get['__amp_source_origin']));
				$this->response->addHeader('Access-Control-Expose-Headers: AMP-Access-Control-Allow-Source-Origin');
			}
		}

		$data['products'] = array();
		$data['products']['items'] = array();

		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('webkul/amp');

		if (isset($this->request->get['search']) && $this->request->get['search']) {
			$filter_data = array(
				'filter_name'         => $this->request->get['search'],
				'sort'                => 'ASC',
				'order'               => 'pd.name',
				'start'               => 0,
				'limit'               => 5
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {

				$get_cdn_url = $this->model_webkul_amp->getAmpCdnUrlProduct($result['product_id']);

				$data['products']['items'][] = array(
					'name'        => html_entity_decode($result['name']),
					'href'        => $get_cdn_url ? html_entity_decode($get_cdn_url) : html_entity_decode($this->urlChange('product/amp_product', 'product_id=' . $result['product_id'], true))
				);
			}
		}
		if (!$data['products']['items'] && isset($this->request->get['search']) && $this->request->get['search']) {
			$data['products']['items'][] = array(
				'name'        => 'No match found for search query "' . $this->request->get['search'] . '"',
				'href'        => ''
			);
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data['products']));
	}
}
