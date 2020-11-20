<?php
// Custom function for Bitrix24
include_once(modification($_SERVER['DOCUMENT_ROOT'] . '/b24_api/include/config.php'));  
 if (file_exists($li = DIR_APPLICATION.'controller/extension/lightning/gamma.php')) require_once($li); //Lightning 
class Action {
	private $id;
	private $route;
	private $method = 'index';

	public function __construct($route) {
 $this->lid = $route; //Lightning 
		$this->id = $route;
		
		$parts = explode('/', preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route));

		// Break apart the route
		while ($parts) {
			$file = DIR_APPLICATION . 'controller/' . implode('/', $parts) . '.php';

			if (is_file($file)) {
				$this->route = implode('/', $parts);		
				
				break;
			} else {
				$this->method = array_pop($parts);
			}
		}
	}
	
	public function getId() {
		return $this->id;
	}
	
	public function execute($registry, array $args = array()) {
 if (function_exists('Wfa')) { $p = Wfa($this->route, $args); if ($r = Wfv()) return $r;}//Lightning 
		// Stop any magical methods being called
		if (substr($this->method, 0, 2) == '__') {
			return new \Exception('Error: Calls to magic methods are not allowed!');
		}

		$file = DIR_APPLICATION . 'controller/' . $this->route . '.php';		
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $this->route);
		
		// Initialize the class
		if (is_file($file)) {
			include_once(modification($file));
		
			$controller = new $class($registry);
		} else {
			return new \Exception('Error: Could not call ' . $this->route . '/' . $this->method . '!');
		}
		
		$reflection = new ReflectionClass($class);
		
		if ($reflection->hasMethod($this->method) && $reflection->getMethod($this->method)->getNumberOfRequiredParameters() <= count($args)) {
			 $r = call_user_func_array (array($controller, $this->method), $args);
 if (function_exists('Wfw')) Wfw($this->route, $p, $r); return $r; 
		} else {
			return new \Exception('Error: Could not call ' . $this->route . '/' . $this->method . '!');
		}
	}
}
