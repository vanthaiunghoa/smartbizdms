<?php
class ControllerModuleFollowme extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/followme');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('followme', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token']);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_left'] = $this->language->get('text_left');
		$this->data['text_right'] = $this->language->get('text_right');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['entry_orkut_username'] = $this->language->get('entry_orkut_username');	
		$this->data['entry_youtube_username'] = $this->language->get('entry_youtube_username');
		$this->data['entry_twitter_username'] = $this->language->get('entry_twitter_username');
		$this->data['entry_facebook_username'] = $this->language->get('entry_facebook_username');							
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	
 		if (isset($this->error['code'])) {
			$this->data['error_code'] = $this->error['code'];
		} else {
			$this->data['error_code'] = '';
		}		

  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);
		
   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=module/followme&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=module/followme&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'];
		
		if (isset($this->request->post['followme_orkut_username'])) {
			$this->data['followme_orkut_username'] = $this->request->post['followme_orkut_username'];
		} else {
			$this->data['followme_orkut_username'] = $this->config->get('followme_orkut_username');
		}	
		if (isset($this->request->post['followme_youtube_username'])) {
			$this->data['followme_youtube_username'] = $this->request->post['followme_youtube_username'];
		} else {
			$this->data['followme_youtube_username'] = $this->config->get('followme_youtube_username');
		}	
		if (isset($this->request->post['followme_twitter_username'])) {
			$this->data['followme_twitter_username'] = $this->request->post['followme_twitter_username'];
		} else {
			$this->data['followme_twitter_username'] = $this->config->get('followme_twitter_username');
		}	
		if (isset($this->request->post['followme_facebook_username'])) {
			$this->data['followme_facebook_username'] = $this->request->post['followme_facebook_username'];
		} else {
			$this->data['followme_facebook_username'] = $this->config->get('followme_facebook_username');
		}			
		if (isset($this->request->post['followme_position'])) {
			$this->data['followme_position'] = $this->request->post['followme_position'];
		} else {
			$this->data['followme_position'] = $this->config->get('followme_position');
		}
		
		if (isset($this->request->post['followme_status'])) {
			$this->data['followme_status'] = $this->request->post['followme_status'];
		} else {
			$this->data['followme_status'] = $this->config->get('followme_status');
		}
		
		if (isset($this->request->post['followme_sort_order'])) {
			$this->data['followme_sort_order'] = $this->request->post['followme_sort_order'];
		} else {
			$this->data['followme_sort_order'] = $this->config->get('followme_sort_order');
		}				
		
		$this->template = 'module/followme.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/followme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>