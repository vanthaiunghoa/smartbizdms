<?php

class ControllerModulesharethis extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/sharethis');
		$this->load->model('setting/setting');
		
		$this->data['social_btnorder']	=	"facebook,twitter,email,sharethis";
		$this->data['pub_id']	=	"";
		$this->data['widget_option'] = "true";
		
		$this->document->setTitle($this->language->get('heading_title'));
						
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('sharethis', $this->request->post);		
				
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['text_ordertips'] = $this->language->get('text_ordertips');
		$this->data['text_pubid'] = $this->language->get('text_pubid');		
				
		
		$this->data['entry_code'] = $this->language->get('entry_code');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['display_style'] = $this->language->get('display_style');
		$this->data['widget_version'] = $this->language->get('widget_version');
		$this->data['social_button_order'] = $this->language->get('social_button_order');
		$this->data['plublisher_id'] = $this->language->get('plublisher_id');

		$this->data['display_style_option'] = $this->language->get('display_style_option');
		$this->data['widget_version_option'] = $this->language->get('widget_version_option');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_position'] = $this->language->get('entry_position');
		
		$this->data['entry_version_status'] = $this->language->get('entry_version_status');
		$this->data['entry_author'] = $this->language->get('entry_author');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
        	$this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/sharethis', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=module/sharethis&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'];
		
			
		if (isset($this->request->post['sharethis_status'])) {
			$this->data['sharethis_status'] = $this->request->post['sharethis_status'];
		} else {
			$this->data['sharethis_status'] = $this->config->get('sharethis_status');
		}
		
		if (isset($this->request->post['widget_option'])) {
			$this->data['widget_option'] = $this->request->post['widget_option'];
		}  elseif ($this->config->get('widget_option')) { 
			$this->data['widget_option'] = $this->config->get('widget_option');
		} 
		
		if (isset($this->request->post['display_soption'])) {
			$this->data['display_soption'] = $this->request->post['display_soption'];
		} else {
			$this->data['display_soption'] = $this->config->get('display_soption');
		}
		
		if (isset($this->request->post['sharethis_position'])) {
			$this->data['sharethis_position'] = $this->request->post['sharethis_position'];
		} else {
			$this->data['sharethis_position'] = $this->config->get('sharethis_position');
		}	
		
		if (isset($this->request->post['pub_id'])) {
			$this->data['pub_id'] = $this->request->post['pub_id'];
		} elseif ($this->config->get('pub_id')) { 
			$this->data['pub_id'] = $this->config->get('pub_id');
		}
		
		if (isset($this->request->post['social_btnorder'])) {
			$this->data['social_btnorder'] = $this->request->post['social_btnorder'];
		} elseif ($this->config->get('social_btnorder')) { 
			$this->data['social_btnorder'] = $this->config->get('social_btnorder');
		}		
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['sharethis_module'])) {
			$this->data['modules'] = $this->request->post['sharethis_module'];
		} elseif ($this->config->get('sharethis_module')) { 
			$this->data['modules'] = $this->config->get('sharethis_module');
		}	
		
		$this->load->model('design/layout');		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();


		$this->template = 'module/sharethis.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/sharethis')) {
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
