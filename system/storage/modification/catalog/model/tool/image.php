<?php
class ModelToolImage extends Model {

                public function cdn_rewrite($host_url, $new_image) {
                    require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                    require_once NITRO_CORE_FOLDER . 'core.php';
                    require_once NITRO_CORE_FOLDER . 'cdn.php';
                    
                    $nitro_result = nitroCDNResolve($new_image, $host_url);

                    return $nitro_result;
                }
            
	public function resize($filename, $width, $height, $type = '') {
              if (function_exists("getMobilePrefix") && function_exists("getCurrentRoute") && isNitroEnabled()) {
                if (!isset($_COOKIE["save_image_dimensions"])) {
                    $route = getCurrentRoute();

                    switch ($route) {
                    case "common/home":
                        $page_type = "home";
                        break;
                    case "product/category":
                        $page_type = "category";
                        break;
                    case "product/product":
                        $page_type = "product";
                        break;
                    default:
                        $page_type = "";
                        break;
                    }

                    if ($page_type) {
                        $device_type = ucfirst(trim(getMobilePrefix(true), "-"));
                        if (!$device_type) {
                            $device_type = "Desktop";
                        }

                        $overrides = getNitroPersistence('DimensionOverride.' . $page_type . '.' . $device_type);
                        if ($overrides) {
                            $isAutoDetectionEnabled = getNitroPersistence('ImageCache.DimensionAutoDetect');
                            $controller_route = $isAutoDetectionEnabled ? getCurrentRoute() : 'undefined';
                            $controller_found = false;
                            $position_route = 'undefined';
                            $position_found = false;

                            if ($isAutoDetectionEnabled) {
                                $stack = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS);
                                foreach ($stack as $func) {
                                    if (!$controller_found && !empty($func['file']) && preg_match('@catalog[_/]controller[_/](.*?).php$@', $func['file'], $matches)) {
                                        $controller_route = $matches[1];
                                        $controller_found = true;
                                    }

                                    if (!$position_found && !empty($func['file']) && preg_match('@catalog[_/]controller[_/]common[_/]((?:content_|column_).*?).php$@', $func['file'], $matches)) {
                                        $position_route = $matches[1];
                                        $position_found = true;
                                    }
                                }
                            }

                            if (!empty($overrides[$controller_route])) {
                                if (!empty($overrides[$controller_route][$position_route])) {
                                    foreach ($overrides[$controller_route][$position_route] as $override) {
                                        if ((int)$override["old"]["width"] == (int)$width && (int)$override["old"]["height"] == (int)$height) {
                                            $width = (int)$override["new"]["width"];
                                            $height = (int)$override["new"]["height"];
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    $isAutoDetectionEnabled = getNitroPersistence('ImageCache.DimensionAutoDetect');
                    $controller_route = $isAutoDetectionEnabled ? getCurrentRoute() : 'undefined';
                    $controller_found = false;
                    $position_route = 'undefined';
                    $position_found = false;

                    if ($isAutoDetectionEnabled) {
                        $stack = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS);
                        foreach ($stack as $func) {
                            if (!$controller_found && !empty($func['file']) && preg_match('@catalog[_/]controller[_/](.*?).php$@', $func['file'], $matches)) {
                                $controller_route = $matches[1];
                                $controller_found = true;
                            }

                            if (!$position_found && !empty($func['file']) && preg_match('@catalog[_/]controller[_/]common[_/]((?:content_|column_).*?).php$@', $func['file'], $matches)) {
                                $position_route = $matches[1];
                                $position_found = true;
                            }
                        }

                        if (empty($GLOBALS['nitro_image_routes_log'])) {
                            $GLOBALS['nitro_image_routes_log'] = array();
                        }

                        if (VERSION < '2.3.0.0') {
                            $image_key = $filename;
                        } else {
                            $image_key = str_replace(' ', '%20', $filename);
                        }

                        $image_key = preg_replace('/(.*?)\.[^\.]+$/', 'cache/', $image_key) . '-' . $width . 'x' . $height;
                        if (empty($GLOBALS['nitro_image_routes_log'][$image_key])) {
                            $GLOBALS['nitro_image_routes_log'][$image_key] = array();
                        }

                        $GLOBALS['nitro_image_routes_log'][$image_key][] = array($controller_route, $position_route);
                    }
                }
              }
 if (function_exists('Wkj') && $r = Wkj($filename, $width, $height)) return $r; //Lightning 
		if (!is_file(DIR_IMAGE . $filename) || substr(str_replace('\\', '/', realpath(DIR_IMAGE . $filename)), 0, strlen(DIR_IMAGE)) != DIR_IMAGE) {
			return;
		}


                if (isset($_COOKIE["save_image_dimensions"])) {
                    if (empty($GLOBALS["reset_session_dimensions"])) {
                        $GLOBALS["reset_session_dimensions"] = true;
                        $this->session->data["nitro_image_dimensions"] = array();
                    }

                    $dimension_string = $width . "x" . $height;
                    if (!in_array($dimension_string, $this->session->data["nitro_image_dimensions"])) {
                        $this->session->data["nitro_image_dimensions"][] = $dimension_string;
                    }
                }
            
		$extension = pathinfo($filename, PATHINFO_EXTENSION);

		$image_old = $filename;
		$image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . $type . '.' . $extension;

		
                $nitro_refresh_file = getQuickImageCacheRefreshFilename();
                $nitro_recache = (getNitroPersistence('Enabled') && getNitroPersistence('ImageCache.OverrideCompression') && is_file(DIR_IMAGE . $image_new) && is_file($nitro_refresh_file)) ? filemtime($nitro_refresh_file) > filectime(DIR_IMAGE . $image_new) : false;
                if (!is_file(DIR_IMAGE . $image_new) || (filectime(DIR_IMAGE . $image_old) > filectime(DIR_IMAGE . $image_new)) || $nitro_recache) {
            
			list($width_orig, $height_orig, $image_type) = getimagesize(DIR_IMAGE . $image_old);
				 
			if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) { 
				return DIR_IMAGE . $image_old;
			}
						
			$path = '';

			$directories = explode('/', dirname($image_new));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}


                $isNitroImageOverrideEnabled = getNitroPersistence('Enabled') && getNitroPersistence('ImageCache.OverrideCompression');
            
			
                if ($width_orig != $width || $height_orig != $height || $isNitroImageOverrideEnabled) {
            
				$image = new Image(DIR_IMAGE . $image_old);
				$image->resize($width, $height, $type);
				$image->save(DIR_IMAGE . $image_new);

                require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                require_once NITRO_CORE_FOLDER . 'core.php';
                include NITRO_INCLUDE_FOLDER . 'smush_on_demand.php';
            

                if (defined('JOURNAL3_ACTIVE')) {
                    if ($this->journal3->settings->get('performanceCompressImagesStatus')) {
                        \Journal3\Utils\Img::optimise(DIR_IMAGE . $image_new);
                    }
                }
            
			} else {
				copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);

                require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                require_once NITRO_CORE_FOLDER . 'core.php';
                include NITRO_INCLUDE_FOLDER . 'smush_on_demand.php';
            

                if (defined('JOURNAL3_ACTIVE')) {
                    if ($this->journal3->settings->get('performanceCompressImagesStatus')) {
                        \Journal3\Utils\Img::optimise(DIR_IMAGE . $image_new);
                    }
                }
            
			}
		}
		

                if (defined('JOURNAL3_ACTIVE')) {
                    if ($this->journal3->settings->get('performanceCompressImagesStatus')) {
                        $image_new = \Journal3\Utils\Img::cwebp($image_new);
                    }
                }
            
		$image_new = str_replace(' ', '%20', $image_new);  // fix bug when attach image on email (gmail.com). it is automatic changing space " " to +
		

                if (defined('JOURNAL3_STATIC_URL')) {
                    return JOURNAL3_STATIC_URL . 'image/' . $image_new;
                }
            
 if (function_exists('Waq')) if (!empty($image_new)) Waq($image_new); elseif (!empty($new_image)) Waq($new_image); //Lightning 
		if ($this->request->server['HTTPS']) {

                $default_link = $this->config->get('config_ssl').'image/'.$image_new;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_ssl'), 'image/'.$image_new);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_ssl') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $image_new);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_ssl') . 'image/' . $image_new;
		} else {

                $default_link = $this->config->get('config_url').'image/'.$image_new;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_url'), 'image/'.$image_new);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_url') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $image_new);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_url') . 'image/' . $image_new;
		}
	}
}
