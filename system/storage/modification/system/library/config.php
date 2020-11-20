<?php
class Config {
	private $data = array();

	public function get($key) {
		return (isset($this->data[$key]) ? $this->data[$key] : null);
	}

	public function set($key, $value) {
  if (function_exists('Wds')) Wds($key, $value); //Lightning 
		$this->data[$key] = $value;
	}

	public function has($key) {
 if (function_exists('Wfc')) Wfc($key); //Lightning 
		return isset($this->data[$key]);
	}

	public function load($filename) {
		$file = DIR_CONFIG . $filename . '.php';

		if (file_exists($file)) {
			$_ = array();

			require(modification($file));

			$this->data = array_merge($this->data, $_);
		} else {
			trigger_error('Error: Could not load config ' . $filename . '!');
			exit();
		}
	}
}