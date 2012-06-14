<?php  
class ControllerModuleSocialNetwork extends Controller {
	protected function index() {
		$this->language->load('module/socialnetwork');

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['facebook_url']  = html_entity_decode($this->config->get('socialnetwork_facebook'));
        $this->data['twitter_url'] = html_entity_decode($this->config->get('socialnetwork_twitter'));
		
		$this->id = 'socialnetwork';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/socialnetwork.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/socialnetwork.tpl';
		} else {
			$this->template = 'default/template/module/socialnetwork.tpl';
		}
		
		$this->render();
	}
}
?>
