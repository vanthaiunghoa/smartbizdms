<?php
#############################################################################
#  Adpatations for OpenCart 1.5.0 from Hildebrando 28.4.2011
#  Adpatations for OpenCart 1.4.9 from Hildebrando 31.8.2010
#  Original developed by  Somsak2004, web: www.somsak2004.net email: sanma2001@hotmail.com
#  
#############################################################################
class ControllerModuleSyoutube extends Controller {			   
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/s_youtube');

		$this->document->setTitle = $this->language->get('heading_title');
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {

        $this->model_setting_setting->editSetting('s_youtube', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect(HTTPS_SERVER .'index.php?route=extension/module&token=' . $this->session->data['token']);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_left'] = $this->language->get('text_left');
		$this->data['text_right'] = $this->language->get('text_right');
        $this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_code'] = $this->language->get('entry_code');
		$this->data['entry_help'] = $this->language->get('entry_help');
		$this->data['entry_version_status'] = $this->language->get('entry_version_status');
        $this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->error['sort_order'])) {
			$this->data['error_sort_order'] = $this->error['sort_order'];
		} else {
			$this->data['error_sort_order'] = '';
		}
		if (isset($this->error['code'])) {
			$this->data['error_code'] = $this->error['code'];
		} else {
			$this->data['error_code'] = '';
		}
		
        $this->data['breadcrumbs'] = array();
   		
   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER .'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER .'index.php?route=extension/module&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER .'index.php?route=module/s_youtube&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/s_youtube', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		
		if (isset($this->request->post['s_youtube_position'])) {
			$this->data['s_youtube_position'] = $this->request->post['s_youtube_position'];
		} else {
			$this->data['s_youtube_position'] = $this->config->get('s_youtube_position');
		}
		
        
		if (isset($this->request->post['s_youtube_status'])) {
			$this->data['s_youtube_status'] = $this->request->post['s_youtube_status'];
		} else {
			$this->data['s_youtube_status'] = $this->config->get('s_youtube_status');
		}
		
		
		if (isset($this->request->post['s_youtube_sort_order'])) {
			$this->data['s_youtube_sort_order'] = $this->request->post['s_youtube_sort_order'];
		} else {
			$this->data['s_youtube_sort_order'] = $this->config->get('s_youtube_sort_order');
		}				
        
		if (isset($this->request->post['s_youtube_code'])) {
			$this->data['s_youtube_code'] = $this->request->post['s_youtube_code'];
		} else {
			$this->data['s_youtube_code'] = $this->config->get('s_youtube_code');
		}				
		
        if (isset($this->request->post['s_youtube_module'])) {
			$modules = explode(',', $this->request->post['s_youtube_module']);
		} elseif ($this->config->get('s_youtube_module') != '') {
			$modules = explode(',', $this->config->get('s_youtube_module'));
		} else {
			$modules = array();
		}
        
        $this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		foreach ($modules as $module) {
			if (isset($this->request->post['s_youtube_' . $module . '_image_width'])) {
				$this->data['s_youtube_' . $module . '_image_width'] = $this->request->post['s_youtube_' . $module . '_image_width'];
			} else {
				$this->data['s_youtube_' . $module . '_image_width'] = $this->config->get('s_youtube_' . $module . '_image_width');
			}
			
			if (isset($this->request->post['s_youtube_' . $module . '_image_height'])) {
				$this->data['s_youtube_' . $module . '_image_height'] = $this->request->post['s_youtube_' . $module . '_image_height'];
			} else {
				$this->data['s_youtube_' . $module . '_image_height'] = $this->config->get('s_youtube_' . $module . '_image_height');
			}			
			
			if (isset($this->request->post['s_youtube_' . $module . '_layout_id'])) {
				$this->data['s_youtube_' . $module . '_layout_id'] = $this->request->post['s_youtube_' . $module . '_layout_id'];
			} else {
				$this->data['s_youtube_' . $module . '_layout_id'] = $this->config->get('s_youtube_' . $module . '_layout_id');
			}	
			
			if (isset($this->request->post['s_youtube_' . $module . '_position'])) {
				$this->data['s_youtube_' . $module . '_position'] = $this->request->post['s_youtube_' . $module . '_position'];
			} else {
				$this->data['s_youtube_' . $module . '_position'] = $this->config->get('s_youtube_' . $module . '_position');
			}	
			
			if (isset($this->request->post['s_youtube_' . $module . '_status'])) {
				$this->data['s_youtube_' . $module . '_status'] = $this->request->post['s_youtube_' . $module . '_status'];
			} else {
				$this->data['s_youtube_' . $module . '_status'] = $this->config->get('s_youtube_' . $module . '_status');
			}	
						
			if (isset($this->request->post['s_youtube_' . $module . '_sort_order'])) {
				$this->data['s_youtube_' . $module . '_sort_order'] = $this->request->post['s_youtube_' . $module . '_sort_order'];
			} else {
				$this->data['s_youtube_' . $module . '_sort_order'] = $this->config->get('s_youtube_' . $module . '_sort_order');
			}

            if (isset($this->request->post['s_youtube_' . $module . '_code'])) {
				$this->data['s_youtube_' . $module . '_code'] = $this->request->post['s_youtube_' . $module . '_code'];
			} else {
				$this->data['s_youtube_' . $module . '_code'] = $this->config->get('s_youtube_' . $module . '_code');
			}	
            
		}
		
		$this->data['modules'] = $modules;
		
		if (isset($this->request->post['s_youtube_module'])) {
			$this->data['s_youtube_module'] = $this->request->post['s_youtube_module'];
		} else {
			$this->data['s_youtube_module'] = $this->config->get('s_youtube_module');
		}

		$this->template = 'module/s_youtube.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
        $this->response->setOutput($this->render());
	}
	
	private function validate() {

		if (!$this->user->hasPermission('modify', 'module/s_youtube')) {
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