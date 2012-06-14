<?php  
class ControllerModuleFollowme extends Controller {
	protected function index() {
		$this->language->load('module/followme');
		
    $this->data['heading_title'] = $this->language->get('heading_title');
	
 		$this->data['followme_orkut_username'] = $this->config->get('followme_orkut_username');
		$this->data['followme_youtube_username'] = $this->config->get('followme_youtube_username');
		$this->data['followme_twitter_username'] = $this->config->get('followme_twitter_username');
		$this->data['followme_facebook_username'] = $this->config->get('followme_facebook_username');

		/*if(HTTPS_SERVER != '') {
		$this->data['addthis_http'] = 'https';
		} else {
		$this->data['addthis_http'] = 'http';	
		}
			*/	
		$this->id       = 'followme';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/followme.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/followme.tpl';
		} else {
			$this->template = 'default/template/module/followme.tpl';
		}
				
		$this->render();
	}
}
?>