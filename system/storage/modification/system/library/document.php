<?php
class Document {
	private $title;
	private $description;
	private $keywords;
	private $links = array();

            private $seo_meta = array();   

            public function addSeoMeta($content = '', $parameter = '', $type = 'name') {
                $this->seo_meta[] = array(
                    'parameter' => $parameter,
                    'content' => $content,
                    'type'  => $type
                );
            }
            
            public function getSeoMeta() {
		        return $this->seo_meta;
	        } 
	        
	        private $seo_hreflang = array();     
	        
	        public function addSeoHreflang($href = '', $hreflang = 'x-default') {
                $this->seo_hreflang[] = array(
                    'href' => $href,
                    'hreflang'  => $hreflang
                );
            }
            
            public function getSeoHreflang() {
		        return $this->seo_hreflang;
	        }
			
	private $styles = array();
	private $scripts = array();

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {

                require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                require_once NITRO_CORE_FOLDER . 'core.php';
                require_once NITRO_INCLUDE_FOLDER . 'minify_css.php';

                return nitro_minify_css($this->styles);
            
		return $this->styles;
	}

	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {

                require_once DIR_SYSTEM . 'nitro' . DIRECTORY_SEPARATOR . 'config.php';
                require_once NITRO_CORE_FOLDER . 'core.php';
                require_once NITRO_INCLUDE_FOLDER . 'minify_js.php';

                return nitro_minify_js($this->scripts[$postion]);
            
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}
}