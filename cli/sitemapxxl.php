<?php
// Version
define('VERSION', '1.5.5.1');

// Config
require_once(dirname(__FILE__).'/../config.php');
   
// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Application Classes
require_once(DIR_SYSTEM . 'library/currency.php');
require_once(DIR_SYSTEM . 'library/customer.php');
require_once(DIR_SYSTEM . 'library/tax.php');
require_once(DIR_SYSTEM . 'library/weight.php');
require_once(DIR_SYSTEM . 'library/length.php');
require_once(DIR_SYSTEM . 'library/cart.php');

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Config
$config = new Config();
$registry->set('config', $config);

// Database 
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);

$config->set('config_store_id', 0);
		
// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0' OR store_id = '" . (int)$config->get('config_store_id') . "' ORDER BY store_id ASC");

foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value']);
	} else {
		$config->set($setting['key'], $setting['value'] ? unserialize($setting['value']) : '');
	}
}

$config->set('config_url', HTTP_SERVER);
$config->set('config_ssl', HTTPS_SERVER);	

// Url
$url = new Url($config->get('config_url'), $config->get('config_ssl'));	
$registry->set('url', $url);

// Log 
$log = new Log('sitemap.log');
$registry->set('log', $log);

$log->write('sitemap generator start');

// Request
$request = new Request();
$request->server = array('HTTP_HOST' => $_SERVER['HTTP_HOST'], 'REQUEST_URI' => '');

$registry->set('request', $request);

// Session
$registry->set('session', new Session());

// Cache
$registry->set('cache', new Cache());


// Language Detection
$languages = array();

$query = $db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE status = '1'");

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
}

$code = $config->get('config_language');

if (!isset($session->data['language']) || $session->data['language'] != $code) {
	$session->data['language'] = $code;
}

if (!isset($request->cookie['language']) || $request->cookie['language'] != $code) {
	setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', $request->server['HTTP_HOST']);
}

$config->set('config_language_id', $languages[$code]['language_id']);
$config->set('config_language', $languages[$code]['code']);


// Front Controller 
$controller = new Front($registry);


// SEO URL's
if (!$seo_type = $config->get('config_seo_url_type')) {
	$seo_type = 'seo_url';
}

$controller->addPreAction(new Action('common/' . $seo_type));	

$action = new Action('feed/sitemapxxl', '');

$controller->dispatch($action, '');

$log->write('sitemap generator end');

exit();

?>
