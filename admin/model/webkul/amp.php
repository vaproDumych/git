<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class ModelWebkulAmp extends Model {

  public function install() {
    $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "amp_product_url` (
     `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
     `product_id` INT(11),
     `store_id` INT(11),
     `url` VARCHAR(200),
     PRIMARY KEY (`id`))");
     $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "amp_category_url` (
      `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
      `path` VARCHAR(50),
      `store_id` INT(11),
      `url` VARCHAR(200),
      PRIMARY KEY (`id`))");
  }

  public function uninstall() {
    $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "amp_product_url`");
    $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "amp_category_url`");
  }

}
