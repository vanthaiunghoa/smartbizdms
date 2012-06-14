<?php
class ControllerModuleVisitorCounter extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/visitor_counter');
		
		$this->load->model('module/visitor_counter');
		$this->model_module_visitor_counter->createVisitorTable();

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('visitor_counter', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token']);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_left'] = $this->language->get('text_left');
		$this->data['text_right'] = $this->language->get('text_right');
		$this->data['text_count_unique'] = $this->language->get('text_count_unique');
		$this->data['text_count_all'] = $this->language->get('text_count_all');
		
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_count_type'] = $this->language->get('entry_count_type');
		$this->data['entry_background_color'] = $this->language->get('entry_background_color');
		$this->data['entry_font_color'] = $this->language->get('entry_font_color');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
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
       		'href'      => HTTPS_SERVER . 'index.php?route=module/visitor_counter&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=module/visitor_counter&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'];

		if (isset($this->request->post['visitor_counter_position'])) {
			$this->data['visitor_counter_position'] = $this->request->post['visitor_counter_position'];
		} else {
			$this->data['visitor_counter_position'] = $this->config->get('visitor_counter_position');
		}
		
		if (isset($this->request->post['visitor_counter_status'])) {
			$this->data['visitor_counter_status'] = $this->request->post['visitor_counter_status'];
		} else {
			$this->data['visitor_counter_status'] = $this->config->get('visitor_counter_status');
		}
		
		if (isset($this->request->post['visitor_counter_bg_color'])) {
			$this->data['visitor_counter_bg_color'] = $this->request->post['visitor_counter_bg_color'];
		} else {
			$this->data['visitor_counter_bg_color'] = $this->config->get('visitor_counter_bg_color');
		}
		
		if (isset($this->request->post['visitor_counter_font_color'])) {
			$this->data['visitor_counter_font_color'] = $this->request->post['visitor_counter_font_color'];
		} else {
			$this->data['visitor_counter_font_color'] = $this->config->get('visitor_counter_font_color');
		}
		
		if (isset($this->request->post['visitor_counter_sort_order'])) {
			$this->data['visitor_counter_sort_order'] = $this->request->post['visitor_counter_sort_order'];
		} else {
			$this->data['visitor_counter_sort_order'] = $this->config->get('visitor_counter_sort_order');
		}
		
		if (isset($this->request->post['visitor_counter_count_type'])) {
			$this->data['visitor_counter_count_type'] = $this->request->post['visitor_counter_count_type'];
		} else {
			$this->data['visitor_counter_count_type'] = $this->config->get('visitor_counter_count_type');
		}
		
		if (isset($this->request->post['visitor_counter_background_color'])) {
			$this->data['visitor_counter_background_color'] = $this->request->post['visitor_counter_background_color'];
		} else {
			$this->data['visitor_counter_background_color'] = $this->config->get('visitor_counter_background_color');
		}
		
		$this->template = 'module/visitor_counter.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/visitor_counter')) {
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