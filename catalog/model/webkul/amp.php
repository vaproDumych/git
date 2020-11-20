<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class ModelWebkulAmp extends Model {

  public function getAmpCdnUrlProduct($product_id = 0) {
    return $this->db->query("SELECT * FROM `" . DB_PREFIX . "amp_product_url` WHERE product_id = '" . (int)$product_id . "' AND store_id='" . (int)$this->config->get('config_store_id') . "'")->row;
  }

  public function getAmpCdnUrlCategory($path = '') {
    return $this->db->query("SELECT * FROM `" . DB_PREFIX . "amp_category_url` WHERE path = '" . $path . "' AND store_id='" . (int)$this->config->get('config_store_id') . "'")->row;
  }

}
