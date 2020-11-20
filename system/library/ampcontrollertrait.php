<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */

trait AmpControllerTrait {

  public function urlChange($route,$get = '',$extra = '') {
    if (version_compare(VERSION, '2.2', '>')) {
      return $this->url->link($route, $get, 'SSL');
    } else {
      return $this->url->link($route, $get, true);
    }
  }
}
