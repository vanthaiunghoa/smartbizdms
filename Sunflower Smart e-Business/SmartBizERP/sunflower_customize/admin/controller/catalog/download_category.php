<?php 
class ControllerCatalogDownloadCategory extends Controller { 
	private $error = array();
 
	public function index() {
		$this->load->language('catalog/download_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/download_category');
		 
		$this->getList();
	}

	public function insert() {
		$this->load->language('catalog/download_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/download_category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_download_category->addDownloadCategory($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('catalog/download_category', 'token=' . $this->session->data['token'], 'SSL')); 
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('catalog/download_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/download_category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_download_category->editDownloadCategory($this->request->get['download_category_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('catalog/download_category', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/download_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/download_category');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $download_category_id) {
				$this->model_catalog_download_category->deleteDownloadCategory($download_category_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('catalog/download_category', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/download_category', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('catalog/download_category/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('catalog/download_category/delete', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['categories'] = array();
		
		$results = $this->model_catalog_download_category->getDownloadCategories(0);

		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/download_category/update', 'token=' . $this->session->data['token'] . '&download_category_id=' . $result['download_category_id'], 'SSL')
			);
			
			$this->data['categories'][] = array(
				'download_category_id' => $result['download_category_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['download_category_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		$this->template = 'catalog/download_category_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
	}

	private function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_percent'] = $this->language->get('text_percent');
		$this->data['text_amount'] = $this->language->get('text_amount');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_parent'] = $this->language->get('entry_parent');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_top'] = $this->language->get('entry_top');
		$this->data['entry_column'] = $this->language->get('entry_column');		
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

    	$this->data['tab_general'] = $this->language->get('tab_general');
    	$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_design'] = $this->language->get('tab_design');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/download_category', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['download_category_id'])) {
			$this->data['action'] = $this->url->link('catalog/download_category/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/download_category/update', 'token=' . $this->session->data['token'] . '&download_category_id=' . $this->request->get['download_category_id'], 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/download_category', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['download_category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$download_category_info = $this->model_catalog_download_category->getDownloadCategory($this->request->get['download_category_id']);
    	}
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['download_category_description'])) {
			$this->data['download_category_description'] = $this->request->post['download_category_description'];
		} elseif (isset($download_category_info)) {
			$this->data['download_category_description'] = $this->model_catalog_download_category->getDownloadCategoryDescriptions($this->request->get['download_category_id']);
		} else {
			$this->data['download_category_description'] = array();
		}

		$categories = $this->model_catalog_download_category->getDownloadCategories(0);

		// Remove own id from list
		if (isset($download_category_info)) {
			foreach ($categories as $key => $download_category) {
				if ($download_category['download_category_id'] == $download_category_info['download_category_id']) {
					unset($categories[$key]);
				}
			}
		}

		$this->data['categories'] = $categories;

		if (isset($this->request->post['parent_id'])) {
			$this->data['parent_id'] = $this->request->post['parent_id'];
		} elseif (isset($download_category_info)) {
			$this->data['parent_id'] = $download_category_info['parent_id'];
		} else {
			$this->data['parent_id'] = 0;
		}
						
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['download_category_store'])) {
			$this->data['download_category_store'] = $this->request->post['download_category_store'];
		} elseif (isset($download_category_info)) {
			$this->data['download_category_store'] = $this->model_catalog_download_category->getDownloadCategoryStores($this->request->get['download_category_id']);
		} else {
			$this->data['download_category_store'] = array(0);
		}			
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($download_category_info)) {
			$this->data['keyword'] = $download_category_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (isset($download_category_info)) {
			$this->data['image'] = $download_category_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');

		if (isset($download_category_info) && $download_category_info['image'] && file_exists(DIR_IMAGE . $download_category_info['image'])) {
			$this->data['preview'] = $this->model_tool_image->resize($download_category_info['image'], 100, 100);
		} else {
			$this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		if (isset($this->request->post['top'])) {
			$this->data['top'] = $this->request->post['top'];
		} elseif (isset($download_category_info)) {
			$this->data['top'] = $download_category_info['top'];
		} else {
			$this->data['top'] = 0;
		}
		
		if (isset($this->request->post['column'])) {
			$this->data['column'] = $this->request->post['column'];
		} elseif (isset($download_category_info)) {
			$this->data['column'] = $download_category_info['column'];
		} else {
			$this->data['column'] = 1;
		}
				
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($download_category_info)) {
			$this->data['sort_order'] = $download_category_info['sort_order'];
		} else {
			$this->data['sort_order'] = 0;
		}
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($download_category_info)) {
			$this->data['status'] = $download_category_info['status'];
		} else {
			$this->data['status'] = 1;
		}
		
		$this->template = 'catalog/download_category_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		$this->response->setOutput($this->render());
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/download_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['download_category_description'] as $language_id => $value) {
			if ((strlen(utf8_decode($value['name'])) < 2) || (strlen(utf8_decode($value['name'])) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/download_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
}
?>