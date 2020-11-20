<?php
/**
 * Webkul Software.
 * @category  Webkul
 * @author    Webkul
 * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
 * @license   https://store.webkul.com/license.html
 */
ini_set('display_startup_errors',1);
ini_set('display_errors',1);
error_reporting(E_ALL);
$time_start = microtime(true);
require 'config.php';
// Startup
require_once DIR_SYSTEM . 'startup.php';
// Registry
$registry = new Registry();
// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);
// Config
$config = new Config();
$registry->set('config', $config);
// Request
$request = new Request();
$registry->set('request', $request);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);

// Store
if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
	$store_query = $db->query("SELECT * FROM " . DB_PREFIX . "store WHERE 1=1");
} else {
	$store_query = $db->query("SELECT * FROM " . DB_PREFIX . "store WHERE 1=1");
}
$store_query->rows[]['store_id'] = 0;
foreach ($store_query->rows as $store_data) {

  if (isset($store_data['store_id']) && $store_data['store_id']) {
  	$config->set('config_store_id', $store_data['store_id']);
  } else {
  	$config->set('config_store_id', 0);
    $config->set('config_url', HTTP_SERVER);
    $config->set('config_ssl', HTTPS_SERVER);
  }

  // Settings
  $query = $db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE store_id = '0' OR store_id = '" . (int)$config->get('config_store_id') . "' ORDER BY store_id ASC");

  foreach ($query->rows as $result) {
  	if (!$result['serialized']) {
  		$config->set($result['key'], $result['value']);
  	} else {
      $config->set($result['key'], json_decode($result['value'], true));
  	}
  }

  // Url
  $url = new Url($config->get('config_url'), $config->get('config_secure') ? $config->get('config_ssl') : $config->get('config_url'));
  $registry->set('url', $url);

  if (!defined('VERSION')) {
  	$result = $db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE `key` ='wk_amp_oc_version'")->row;
  	if ($result) {
  		define('VERSION',$result['value']);
  	} else {
  		die('Please configure membership.');
  	}
  }

  if (version_compare(VERSION, '2.2', '>=')) {
    if (is_file(DIR_MODIFICATION . 'catalog/controller/startup/seo_url.php')) {
    	require_once DIR_MODIFICATION . 'catalog/controller/startup/seo_url.php';
    } else if (is_file(DIR_APPLICATION . 'controller/startup/seo_url.php')) {
    	require_once DIR_APPLICATION . 'controller/startup/seo_url.php';
    }
    $seo_url = new ControllerStartupSeourl($registry);
  } else {
    if (is_file(DIR_MODIFICATION . 'catalog/controller/common/seo_url.php')) {
    	require_once DIR_MODIFICATION . 'catalog/controller/common/seo_url.php';
    } else if (is_file(DIR_APPLICATION . 'controller/common/seo_url.php')) {
    	require_once DIR_APPLICATION . 'controller/common/seo_url.php';
    }
    $seo_url = new ControllerCommonSeourl($registry);
  }

  echo "<pre>STORE URL: ";print_r($config->get('config_secure') ? $config->get('config_ssl') : $config->get('config_url'));echo "</pre>";

  /**
   * code for fetaching product cdn urls
   * @var [type]
   */
  $queries = $db->query("SELECT * FROM `" . DB_PREFIX . "product` p LEFT JOIN `" . DB_PREFIX . "product_to_store` pts ON (p.product_id = pts.product_id) WHERE p.status='1' AND pts.store_id = '" . (int)$config->get('config_store_id') . "'");

  $count_cdn_products = $limit = 0;
  $url_array = array();
  $total_products = $total = $queries->num_rows;
  $clock = floor($total/50);
  $product_pool = array();
  foreach ($queries->rows as $query) {
    $url_array[$query['product_id']] = $seo_url->rewrite($url->link('product/product','product_id=' . $query['product_id'], true));
    if ($limit == 49 || $total == 1) {
      $url_json = array();
      $url_json['urls'] = array_values($url_array);
      $url_json['lookupStrategy'] = 'FETCH_LIVE_DOC';
      $ch = curl_init();

  		curl_setopt($ch, CURLOPT_URL, "https://acceleratedmobilepageurl.googleapis.com/v1/ampUrls:batchGet?key=" . $config->get('wk_amp_google_api_key'));
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($url_json));
      curl_setopt($ch, CURLOPT_POST, 1);
      curl_setopt($ch, CURLOPT_ENCODING, 'gzip, deflate');

      $headers = array();
      $headers[] = "Accept: application/json";
      $headers[] = "Content-Type: application/json";
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

      $result = curl_exec($ch);
      if (curl_errno($ch)) {
          echo 'Error:' . curl_error($ch);
      }
      curl_close ($ch);

      $results = json_decode($result,true);

  		if (isset($results['ampUrls']) && is_array($results['ampUrls']) && $results['ampUrls']) {
  			foreach ($results['ampUrls'] as $value) {
  				foreach ($url_array as $product_id =>$url_) {
  					if ($url_ == $value['originalUrl'] && isset($value['cdnAmpUrl']) && $value['cdnAmpUrl']) {
  						$product_pool[] = '\'' . (int)$product_id . '\'';
  						$count_cdn_products++;
              if ($config->get('wk_amp_cron_log'))
  						      echo "<pre>Product CDN URL: ";print_r($value['cdnAmpUrl']);echo "</pre>";
  						if ($db->query("SELECT * FROM `" . DB_PREFIX . "amp_product_url` WHERE product_id='" . (int)$product_id . "' AND store_id = '" . (int)$config->get('config_store_id') . "'")->num_rows)
  							$db->query("UPDATE `" . DB_PREFIX . "amp_product_url` SET url = '" . $db->escape($value['cdnAmpUrl']) . "' WHERE product_id='" . (int)$product_id . "' AND store_id = '" . (int)$config->get('config_store_id') . "'");
  						else
  							$db->query("INSERT INTO `" . DB_PREFIX . "amp_product_url` SET product_id='" . (int)$product_id . "', url = '" . $db->escape($value['cdnAmpUrl']) . "',store_id = '" . (int)$config->get('config_store_id') . "'");
  						break;
  					}
  				}
  			}
  		}
      $limit = -1;
      $url_array = array();
    }
    $limit++;
  	$total--;
  }

  if ($config->get('wk_amp_cron_log')) {
    echo "<pre>Total number of Product URL: ";print_r($total_products);echo "</pre>";
    echo "<pre>Total number of CDN URL found: ";print_r($count_cdn_products);echo "</pre>";
  }

  /**
   * code for fetching category cdn urls
   * @var [type]
   */
  $queries = getCategories(0,$db,$config);

  $total = $count_cdn_category = $limit = 0;
  $url_array = array();
  $clock = floor($total/50);
  $category_pool = array();

  foreach ($queries as $category) {
  	if ($category['top']) {
  		// Level 2
  		$children_data = array();
  		$children = getCategories($category['category_id'],$db,$config);
  		foreach ($children as $child) {
  			$total++;
  			$categories[$category['category_id'] . '_' . $child['category_id']] = $seo_url->rewrite($url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']));
  		}
  		$total++;
  		$categories[$category['category_id']] = $seo_url->rewrite($url->link('product/category', 'path=' . $category['category_id']));
  	}
  }

  $total_category = $total;

  foreach ($categories as $path => $query) {

    $url_array[$path] = $query;

    if ($limit == 49 || $total == 1) {
      $url_json = array();
      $url_json['urls'] = array_values($url_array);
      $url_json['lookupStrategy'] = 'FETCH_LIVE_DOC';
      $ch = curl_init();

  		curl_setopt($ch, CURLOPT_URL, "https://acceleratedmobilepageurl.googleapis.com/v1/ampUrls:batchGet?key=" . $config->get('wk_amp_google_api_key'));
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($url_json));
      curl_setopt($ch, CURLOPT_POST, 1);
      curl_setopt($ch, CURLOPT_ENCODING, 'gzip, deflate');

      $headers = array();
      $headers[] = "Accept: application/json";
      $headers[] = "Content-Type: application/json";
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

      $result = curl_exec($ch);
      if (curl_errno($ch)) {
          echo 'Error:' . curl_error($ch);
      }
      curl_close ($ch);

      $results = json_decode($result,true);
  		if (isset($results['ampUrls']) && is_array($results['ampUrls']) && $results['ampUrls']) {
  			foreach ($results['ampUrls'] as $value) {
  				foreach ($url_array as $path =>$url_) {
  					if ($url_ == $value['originalUrl'] && isset($value['cdnAmpUrl']) && $value['cdnAmpUrl']) {
  						$category_pool[] = '\'' . $db->escape($path) . '\'';
  						$count_cdn_category++;
              if ($config->get('wk_amp_cron_log'))
  						      echo "<pre>Category CDN URL: ";print_r($value['cdnAmpUrl']);echo "</pre>";
  						if ($db->query("SELECT * FROM `" . DB_PREFIX . "amp_category_url` WHERE path='" . $db->escape($path) . "' AND store_id = '" . (int)$config->get('config_store_id') . "'")->num_rows)
  							$db->query("UPDATE `" . DB_PREFIX . "amp_category_url` SET url = '" . $db->escape($value['cdnAmpUrl']) . "' WHERE path='" . $db->escape($path) . "' AND store_id = '" . (int)$config->get('config_store_id') . "'");
  						else
  							$db->query("INSERT INTO `" . DB_PREFIX . "amp_category_url` SET path='" . $db->escape($path) . "', url = '" . $db->escape($value['cdnAmpUrl']) . "',store_id = '" . (int)$config->get('config_store_id') . "'");
  						break;
  					}
  				}
  			}
  		}
      $limit = -1;
      $url_array = array();
    }
    $limit++;
  	$total--;
  }

  if ($config->get('wk_amp_cron_log'))  {
    echo "<pre>Total number of Category URL: ";print_r($total_category);echo "</pre>";
    echo "<pre>Total number of Category CDN URL found: ";print_r($count_cdn_category);echo "</pre>";
  }

  /**
   * deleting those url which are not fetched or may have expired.
   */
  if ($category_pool) {
  	$db->query("DELETE FROM `" . DB_PREFIX . "amp_category_url` WHERE path NOT IN (" . implode(',',$category_pool) . ") AND store_id = '" . (int)$config->get('config_store_id') . "'");
  }

  if ($product_pool) {
  	$db->query("DELETE FROM `" . DB_PREFIX . "amp_product_url` WHERE product_id NOT IN (" . implode(',',$product_pool) . ") AND store_id = '" . (int)$config->get('config_store_id') . "'");
  }

  $time_end = microtime(true);
  $time = $time_end - $time_start;

  if ($config->get('wk_amp_cron_log'))
    echo "Process Time: {$time}" . PHP_EOL;
}

function getCategories($parent_id = 0,$db,$config) {
  return $db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN `" . DB_PREFIX . "category_to_store` cts ON (c.category_id = cts.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c.status = '1' AND cts.store_id = '" . (int)$config->get('config_store_id') . "'")->rows;
}
