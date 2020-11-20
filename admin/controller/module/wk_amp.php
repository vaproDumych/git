<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class ControllerModuleWkamp extends Controller {

	use AmpControllerTrait;
	/**
	 * variable for error
	 * @var [type]
	 */
	private $error = array();

	public function index() {

		$data = $this->load->language('module/wk_amp');
		$this->document->setTitle($this->language->get('heading_page_title'));

		if (!defined('VERSION')) {
			die('<h2>Opencart version not defined.</h2><br>Please add following code "define(\'VERSION\', \'<i>your opencart version here</i>\');" in ' . DIR_APPLICATION . 'index.php without quotes');
		}

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			/**
			 * to override default opencart settings for multistore.
			 * @var [type]
			 */
			if (!isset($this->request->post['wk_amp_image'])) {
				$this->request->post['wk_amp_image'] = '';
			}

			$this->request->post['wk_amp_oc_version'] = VERSION;

			if (isset($this->request->post['wk_amp_store'])) {
				$this->model_setting_setting->editSetting('wk_amp', $this->request->post ,$this->request->post['wk_amp_store']);
			} else {
				$this->model_setting_setting->editSetting('wk_amp', $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			if (version_compare(VERSION, '2.3', '<')) {
				$this->response->redirect($this->urlChange('extension/module', 'token=' . $this->session->data['token'] , 'SSL'));
			} else {
				$this->response->redirect($this->urlChange('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', 'SSL'));
			}
		}

		/**
		 * getting all the store code start here
		 * @var [type]
		 */
		$this->load->model('setting/store');

		$data['stores'] = array();

		$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name') . $this->language->get('text_default')
		);

		$results = $this->model_setting_store->getStores();

		foreach ($results as $result) {
			$data['stores'][] = array(
				'store_id' => $result['store_id'],
				'name'     => $result['name']
			);
		}
		/**
		 * getting all store code ends here
		 * @var [type]
		 */

		$this->document->addScript('view/javascript/color-picker/js/bootstrap-colorpicker.min.js');
		$this->document->addStyle('view/javascript/color-picker/css/bootstrap-colorpicker.min.css');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->urlChange('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->urlChange((version_compare(VERSION, '2.3', '<') ? 'extension/module' : 'extension/extension'), 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (isset($this->request->get['store_id']) && $this->request->get['store_id']) {
			$data['wk_amp_store'] = (int)$this->request->get['store_id'];
			$data['action'] = $this->urlChange('module/wk_amp', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'], true);
			$data = array_merge($data,$this->model_setting_setting->getSetting('wk_amp', $data['wk_amp_store']));
		} else {
			$data['action'] = $this->urlChange('module/wk_amp', 'token=' . $this->session->data['token'], true);
			$data = array_merge($data,$this->model_setting_setting->getSetting('wk_amp', 0));
		}

		$data['wk_amp_cron_log'] = $this->config->get('wk_amp_cron_log');
		$data['wk_amp_google_api_key'] = $this->config->get('wk_amp_google_api_key');

		$data['cancel'] = $this->urlChange('extension/module', 'token=' . $this->session->data['token'] . '&type=module', true);

		$config = array(
			'wk_amp_status',
			'wk_amp_sub_menu',
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
			'wk_amp_display_only_parent_category',
			'wk_amp_google_api_key',
			'wk_amp_fb_app_id',
			'wk_amp_show_special',
			'wk_amp_custom_css',
			'wk_amp_cron_log'
		);

		$data['social_share'] = array(
			$this->language->get('text_facebook'),
			$this->language->get('text_linkedin'),
			$this->language->get('text_twitter'),
			$this->language->get('text_pinterest'),
			$this->language->get('text_goolge'),
			$this->language->get('text_whatsapp'),
			$this->language->get('text_email'),
		);

		foreach ($config as $key => $value) {
			if(isset($this->request->post[$value])) {
				$data[$value] = $this->request->post[$value];
			} elseif (!isset($data[$value])) {
				$data[$value] = '';
			}
		}

		if (isset($this->error['wk_amp_image'])) {
			$data['error_wk_amp_image'] = $this->error['wk_amp_image'];
		} else {
			$data['error_wk_amp_image'] = array();
		}

		$this->load->model('tool/image');

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if(isset($data['wk_amp_image']) && $data['wk_amp_image']) {
			foreach ($data['wk_amp_image'] as $banner_image) {
				if (is_file(DIR_IMAGE . $banner_image['image'])) {
					$image = $banner_image['image'];
					$thumb = $banner_image['image'];
				} else {
					$image = '';
					$thumb = 'no_image.png';
				}

				$data['wk_amp_images'][] = array(
					'wk_amp_image_description' => $banner_image['wk_amp_image_description'],
					'link'                     => $banner_image['link'],
					'image'                    => $image,
					'thumb'                    => $this->model_tool_image->resize($thumb, 100, 100),
					'status'               	   => $banner_image['image_status']
				);
			}
		}

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['token'] = $this->session->data['token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/wk_amp.tpl', $data));
	}

	public function install() {
		$this->load->model('webkul/amp');
		$this->model_webkul_amp->install();
	}

	public function uninstall() {
		$this->load->model('webkul/amp');
		$this->model_webkul_amp->uninstall();
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/wk_amp')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (isset($this->request->post['wk_amp_image'])) {
			foreach ($this->request->post['wk_amp_image'] as $wk_amp_image_id => $wk_amp_image) {
				foreach ($wk_amp_image['wk_amp_image_description'] as $language_id => $wk_amp_image_description) {
					if ((utf8_strlen($wk_amp_image_description['title']) < 2) || (utf8_strlen($wk_amp_image_description['title']) > 64)) {
						$this->error['wk_amp_image'][$wk_amp_image_id][$language_id] = $this->language->get('error_title');
					}
				}
			}
		}

		return !$this->error;
	}
}
