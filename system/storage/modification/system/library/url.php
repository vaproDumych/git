<?php
class Url {
	private $url;
	private $ssl;
	private $rewrite = array();

	public function __construct($url, $ssl = '') {
		$this->url = $url;
		$this->ssl = $ssl;
	}
	
	public function addRewrite($rewrite) {
		$this->rewrite[] = $rewrite;
	}

	public function link($route, $args = '', $secure = false) {
 if (function_exists('Wci')) { Wf_($route, $args); $r = Wci($lpr = Wfm(func_get_args())); if ($r!==-1) {if (function_exists('Wah')) Wah($route, $r); return $r;}}  //Lightning 
		if ($this->ssl && $secure) {
			$url = $this->ssl . 'index.php?route=' . $route;
		} else {
			$url = $this->url . 'index.php?route=' . $route;
		}
		
		if ($args) {
			if (is_array($args)) {
				$url .= '&amp;' . http_build_query($args);
			} else {
				$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
			}
		}
		
		foreach ($this->rewrite as $rewrite) {
			$url = $rewrite->rewrite($url);
		}
		
 if (function_exists('Wah') and !empty($lpr)) { Wah($route, $url); Wci($lpr, $url);} //Lightning 
		return $url; 
	}
}