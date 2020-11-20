<?php
class Response {
	private $headers = array();
	private $level = 0;
	private $output;

	public function addHeader($header) {
		$this->headers[] = $header;
	}

	public function redirect($url, $status = 302) {
		header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $url), true, $status);
		exit();
	}

	public function setCompression($level) {
 global $light_ob; if (!$light_ob) //Lightning
		$this->level = $level;

                if (isNitroEnabled()) {
                    if (getNitroPersistence('Compress.Enabled') && getNitroPersistence('Compress.HTML')) {
                        $this->level = (int)getNitroPersistence('Compress.HTMLLevel');
                    } else {
                        $this->level = 0;
                    }
                }
            
	}

	public function getOutput() {
		return $this->output;
	}
	
	public function setOutput($output) {
		$this->output = $output;
	}

	private function compress($data, $level = 0) {
		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false)) {
			$encoding = 'gzip';
		}

		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip') !== false)) {
			$encoding = 'x-gzip';
		}

		if (!isset($encoding) || ($level < -1 || $level > 9)) {
			return $data;
		}

		if (!extension_loaded('zlib') || ini_get('zlib.output_compression')) {
			return $data;
		}

		if (headers_sent()) {
			return $data;
		}

		if (connection_status()) {
			return $data;
		}

		$this->addHeader('Content-Encoding: ' . $encoding);

		return gzencode($data, (int)$level);
	}

	public function output() {
		if ($this->output) {

                require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                require_once NITRO_CORE_FOLDER . 'core.php';

                if (isNitroEnabled()) {
                    if (isset($_COOKIE["save_image_dimensions"])) {
                        $isAutoDetectionEnabled = getNitroPersistence('ImageCache.DimensionAutoDetect');

                        if ($isAutoDetectionEnabled && isset($GLOBALS['nitro_image_routes_log'])) {
                            require_once NITRO_LIB_FOLDER . 'HtmlDom.php';
                            $nitro_controller_attribute = 'data-nitro-controller-route';
                            $nitro_position_attribute = 'data-nitro-position-route';

                            $dom = HtmlDom::fromString($this->output);
                            $found = $dom->find('img');
                            $images = ($found instanceof HtmlDomNode) ? array($found) : $found;
                            $image_keys = array_keys($GLOBALS['nitro_image_routes_log']);
                            $key_indices = array();

                            foreach ($images as $img) {
                                $src = $img->getAttribute('src');
                                if (!$src) continue;

                                if (preg_match('/.*?[-_]{1}(\d+)x(\d+)(-?_?[0-9]*)\.[^\.]+$/', $src->value, $image_data)) {
                                    $link = $image_data[0];
                                    foreach ($image_keys as $key) {
                                        if (preg_match('/(.*?)-(\d+)x(\d+)/', $key, $key_parts)) {
                                            if (strpos($link, $key_parts[1]) !== false && $key_parts[2] == $image_data[1] && $key_parts[3] == $image_data[2]) {
                                                $key_index = !isset($key_indices[$key]) ? 0 : $key_indices[$key] + 1;
                                                $key_indices[$key] = $key_index;

                                                list($controller_route, $position_route) = $GLOBALS['nitro_image_routes_log'][$key][$key_index];

                                                if (!$img->getAttribute($nitro_controller_attribute)) {
                                                    $img->setAttribute($nitro_controller_attribute, $controller_route);
                                                    $img->setAttribute($nitro_position_attribute, $position_route);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            $this->output = str_replace("\xEF\xBB\xBF", '', $dom->getHtml(true));
                        }
                    } else if (NITRO_DECOUPLE_MINIFICATION && !isset($_COOKIE['nitro_css_extract'])) {
                        $GLOBALS["nitro_headers_list"] = array_merge(headers_list(), $this->headers);

                        if (nitroIsHtmlResponse() && !isAJAXRequest()) {
                            require_once NITRO_FOLDER . 'core' . DS . 'resources_fix_tool.php';
                            $this->output = str_replace("\xEF\xBB\xBF", '', extractHardcodedResources($this->output));
                        }
                    }

                    if (!empty($GLOBALS['nitro.start.time'])) {
                        ob_clean();
                    }
                }
            

                if (defined('JOURNAL3_ACTIVE')) {
                    if (\Journal3::getInstance()->settings->get('performanceHTMLMinify')) {
                        $this->output = \Journal3\Minifier::minifyHTML($this->output);
                    }

                    if (\Journal3::getInstance()->settings->get('performanceJSDefer')) {
                        $this->output = str_replace('<script type="text/javascript">', '<script type="text/javascript/defer">', $this->output);
                    }
                }
            
			$output = $this->level ? $this->compress($this->output, $this->level) : $this->output;
			if (!headers_sent()) {
				foreach ($this->headers as $header) {
					header($header, true);
				}
			}
 if (function_exists('Wt')) if (Wt()) return; //Lightning
			echo $output;

                require_once NITRO_INCLUDE_FOLDER . 'pagecache_bottom.php';
            


		
            if (Registry::getInstance()->get('config')->get((version_compare(VERSION, '3', '>=') ? 'module_' : '').'dbcache_status') && (stripos($_SERVER['REQUEST_URI'], '/admin') === false)) { 
                if (DbCache::isCreated() && DbCache::getInstance()->isChanged()) DbCache::getInstance()->saveCacheToFile();
            }
            		
			
                if (defined('JOURNAL3_ACTIVE')) {
                    \Journal3::getInstance()->loadController('journal3/admin_bar');
                }
            
		}
	}
}
