<?php 
class ControllerPaymentPaymenexDirect extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/paymenex_direct');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');			
			$this->model_setting_setting->editSetting('paymenex_direct', $this->request->post);			
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token']);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		
		$this->data['entry_merchant'] = $this->language->get('entry_merchant');
		$this->data['entry_secret_key'] = $this->language->get('entry_secret_key');
		$this->data['entry_iv_key'] = $this->language->get('entry_iv_key');
		$this->data['entry_izen_id'] = $this->language->get('entry_izen_id');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');		
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
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
      
	    if (isset($this->error['merchant'])) {
			$this->data['error_merchant'] = $this->error['merchant'];
		} else {
			$this->data['error_merchant'] = '';
		}

 		if (isset($this->error['secret_key'])) {
			$this->data['error_secret_key'] = $this->error['secret_key'];
		} else {
			$this->data['error_secret_key'] = '';
		}
		
		if (isset($this->error['iv_key'])) {
			$this->data['error_iv_key'] = $this->error['iv_key'];
		} else {
			$this->data['error_iv_key'] = '';
		}

 		if (isset($this->error['izen_id'])) {
			$this->data['error_izen_id'] = $this->error['izen_id'];
		} else {
			$this->data['error_izen_id'] = '';
		}
		
  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_payment'),
      		'separator' => ' :: '
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=payment/paymenex_direct&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
				
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=payment/paymenex_direct&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'];
		
		if (isset($this->request->post['paymenex_direct_merchant'])) {
			$this->data['paymenex_direct_merchant'] = $this->request->post['paymenex_direct_merchant'];
		} else {
			$this->data['paymenex_direct_merchant'] = $this->config->get('paymenex_direct_merchant');
		}
	
		if (isset($this->request->post['paymenex_direct_secret_key'])) {
			$this->data['paymenex_direct_secret_key'] = $this->request->post['paymenex_direct_secret_key'];
		} else {
			$this->data['paymenex_direct_secret_key'] = $this->config->get('paymenex_direct_secret_key');
		}
		
		if (isset($this->request->post['paymenex_direct_iv_key'])) {
			$this->data['paymenex_direct_iv_key'] = $this->request->post['paymenex_direct_iv_key'];
		} else {
			$this->data['paymenex_direct_iv_key'] = $this->config->get('paymenex_direct_iv_key');
		}
		
		if (isset($this->request->post['paymenex_direct_izen_id'])) {
			$this->data['paymenex_direct_izen_id'] = $this->request->post['paymenex_direct_izen_id'];
		} else {
			$this->data['paymenex_direct_izen_id'] = $this->config->get('paymenex_direct_izen_id');
		}
		
		if (isset($this->request->post['paymenex_direct_order_status_id'])) {
			$this->data['paymenex_direct_order_status_id'] = $this->request->post['paymenex_direct_order_status_id'];
		} else {
			$this->data['paymenex_direct_order_status_id'] = $this->config->get('paymenex_direct_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['paymenex_direct_geo_zone_id'])) {
			$this->data['paymenex_direct_geo_zone_id'] = $this->request->post['paymenex_direct_geo_zone_id'];
		} else {
			$this->data['paymenex_direct_geo_zone_id'] = $this->config->get('paymenex_direct_geo_zone_id'); 
		} 
		
		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['paymenex_direct_status'])) {
			$this->data['paymenex_direct_status'] = $this->request->post['paymenex_direct_status'];
		} else {
			$this->data['paymenex_direct_status'] = $this->config->get('paymenex_direct_status');
		}
		
		if (isset($this->request->post['paymenex_direct_sort_order'])) {
			$this->data['paymenex_direct_sort_order'] = $this->request->post['paymenex_direct_sort_order'];
		} else {
			$this->data['paymenex_direct_sort_order'] = $this->config->get('paymenex_direct_sort_order');
		}

		$this->template = 'payment/paymenex_direct.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/paymenex_direct')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['paymenex_direct_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}
		
		if (!$this->request->post['paymenex_direct_secret_key']) {
			$this->error['secret_key'] = $this->language->get('error_secret_key');
		}
		
		if (!$this->request->post['paymenex_direct_iv_key']) {
			$this->error['iv_key'] = $this->language->get('error_iv_key');
		}
		
		if (!$this->request->post['paymenex_direct_izen_id']) {
			$this->error['izen_id'] = $this->language->get('error_izen_id');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>