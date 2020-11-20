<?php
 if (defined("LIGHT_ENABLED") or (!defined("LIGHT_FRONTEND") and !file_exists(DIR_LOGS.'cv'))) {if (defined('DIR_CATALOG')) $b = DIR_CATALOG; else $b = DIR_APPLICATION; $b .= 'controller/extension/lightning/beta.php'; if (file_exists($b)) require_once $b;} // Lightning 

			
			require_once(DIR_SYSTEM.'library/cache/dbcache.php');
			
			
class DB {
	private $adaptor;

                public static $log = array();
                public static $time = 0;
            

	public function __construct($adaptor, $hostname, $username, $password, $database, $port = NULL) {
 global $db; $db = $this; if (function_exists('Wbu')) { $this->db = Wbu(); $this->adaptor = $this->db; $this->driver = $this->db; return; } // Lightning 
		$class = 'DB\\' . $adaptor;


                if (class_exists('NitroDb') && defined('VERSION')) {
                    if (VERSION >= '2.2.0.0') {
                        $this->adaptor = NitroDb::getInstanceWithParams($adaptor, $hostname, $username, $password, $database, $port);
                        if ($this->adaptor) return;
                    } else {
                        $this->db = NitroDb::getInstanceWithParams($driver, $hostname, $username, $password, $database);
                        if ($this->db) return;
                    }
                }
            
		if (class_exists($class)) {
			$this->adaptor = new $class($hostname, $username, $password, $database, $port);
		} else {
			throw new \Exception('Error: Could not load database adaptor ' . $adaptor . '!');
		}
	}

	public function query($sql, $params = array()) {
		
                $start = microtime(true);

                $backtrace = debug_backtrace();

                $file = (isset($backtrace[1]['file']) ? $backtrace[1]['file'] : $backtrace[0]['file']) . ': ' . (isset($backtrace[1]['line']) ? $backtrace[1]['line'] : $backtrace[0]['line']);

                $file = str_replace(realpath(DIR_SYSTEM . '..') . '/', '', $file);

                $query = $this->adaptor->query($sql, $params);

                $end = microtime(true);

                $time = $end - $start;

                //static::$log[] = sprintf("%3.1f @ %s - %s", $time, $file, $sql);

                static::$log[] = array(
                    'time' => sprintf("%.6f", $time),
                    'file' => $file,
                    'sql' => $sql
                );

                static::$time += $time;

                return $query;
            
	}

	public function escape($value) {
		return $this->adaptor->escape($value);
	}

	public function countAffected() {
		return $this->adaptor->countAffected();
	}

	public function getLastId() {
		return $this->adaptor->getLastId();
	}
	
	public function connected() {
		return $this->adaptor->connected();
	}
}