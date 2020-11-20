<?php
final class Registry {

			
			private static $instance;

            public function __construct()
            {
                self::$instance = $this;
            }
            
            public static function getInstance()
            {
                return self::$instance;
            }
            
			
	private $data = array();

	public function get($key) {
		return (isset($this->data[$key]) ? $this->data[$key] : null);
	}

	public function set($key, $value) {
 global $registry; if ($key != 'db') $registry = $this; //Lightning 
		$this->data[$key] = $value;

                require_once DIR_SYSTEM . 'nitro/config.php';

                if ($key == "request" && __FUNCTION__ == "set") {
                    $GLOBALS["registry"] = $this;

                    require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                    require_once NITRO_CORE_FOLDER . 'core.php';
                }

                if ($key == "language" && __FUNCTION__ == "set") {
                    require_once NITRO_INCLUDE_FOLDER . 'pagecache_top.php';
                }
            
	}

	public function has($key) {
		return isset($this->data[$key]);
	}
}