<?php
class Template {
	private $adaptor;

  	public function __construct($adaptor) {
	    $class = 'Template\\' . $adaptor;

		if (class_exists($class)) {
			$this->adaptor = new $class();
		} else {
			throw new \Exception('Error: Could not load template adaptor ' . $adaptor . '!');
		}
	}

	public function set($key, $value) {
		$this->adaptor->set($key, $value);
	}

	public function render($template) {

            // Journal Theme Modification
            if (defined('JOURNAL3_ACTIVE')) {
                $this->adaptor->set('j3', \Journal3::getInstance());
                $this->adaptor->set('j3s', \Journal3::getInstance()->settings);
            }
		    // End Journal Theme Modification
            
		return $this->adaptor->render($template);
	}
}
