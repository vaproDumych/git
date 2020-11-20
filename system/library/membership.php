<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
class Membership {

  public static function currencyFormat($registry, $value = 0, $to = '') {
    if (version_compare(VERSION, '2.2', '>=')) {
      $to = isset($registry->get('session')->data['currency']) ? $registry->get('session')->data['currency'] : $registry->get('config')->get('config_currency');
      return $registry->get('currency')->format($value,$to);
    } else {
      return $registry->get('currency')->format($value);
    }
  }

}
