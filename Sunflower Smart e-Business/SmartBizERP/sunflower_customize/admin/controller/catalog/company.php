<?php  
class ControllerCatalogCompany extends Controller {  
	private $error = array();
	
  	public function index() {
		$this->load->language('catalog/company');

    	$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('catalog/company');
		
    	$this->getList();
  	}
  	        
  	public function insert() {
		$this->load->language('catalog/company');
    
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/company');
		$data['small_image'] = '';
		$data['big_image'] = '';
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$data = array();
			
			$this->model_catalog_company->addCompany(array_merge($this->request->post, $data));
   	  		
			$this->session->data['success'] = $this->language->get('text_success');
	  
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
    	$this->getForm();
  	}

  	public function update() {
		$this->load->language('catalog/company');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/company');
			
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$data = array();
			
			$this->model_catalog_company->editCompany($this->request->get['company_id'], array_merge($this->request->post, $data));
	  		
			$this->session->data['success'] = $this->language->get('text_success');
	      
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
    	$this->getForm();
  	}

  	public function delete() {
		$this->load->language('catalog/company');
 
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/company');
			
    	if (isset($this->request->post['selected']) && $this->validateDelete()) {	  
			foreach ($this->request->post['selected'] as $company_id) {
			
				$results = $this->model_catalog_company->getCompany($company_id);
                if(sizeof($results) > 0) {
					$filename = $results['filename'];
	
					if (file_exists(DIR_DOWNLOAD . $filename)) {
						@unlink(DIR_DOWNLOAD . $filename);
					}
				
					$this->model_catalog_company->deleteCompany($company_id);
                }
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}

    	$this->getList();
  	}
    
  	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'cd.name';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
				
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),       		
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['insert'] = $this->url->link('catalog/company/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/company/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$this->data['companys'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$company_total = $this->model_catalog_company->getTotalCompanies();
	
		$results = $this->model_catalog_company->getCompanies($data);
 
    	foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/company/update', 'token=' . $this->session->data['token'] . '&company_id=' . $result['company_id'] . $url, 'SSL')
			);
						
			$this->data['companies'][] = array(
				'company_id' => $result['company_id'],
				'name'       => $result['name'],
				'position'   => $result['position'],
				'sort_order' => $result['sort_order'],
				'selected'   => isset($this->request->post['selected']) && in_array($result['company_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_position'] = $this->language->get('column_position');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');
		
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['token'] = $this->session->data['token'];
		// Tabs
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_links'] = $this->language->get('tab_links');
		$this->data['tab_image'] = $this->language->get('tab_image');
 
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
		
		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_name'] = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . '&sort=cd.name' . $url, 'SSL');
		$this->data['sort_position'] = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . '&sort=cd.position' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . '&sort=c.sort_order' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $company_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/company_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
  	}
  
  	private function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');
   
    	$this->data['entry_name'] = $this->language->get('entry_name');
    	$this->data['entry_small_image'] = $this->language->get('entry_small_image');
		$this->data['entry_big_image'] = $this->language->get('entry_big_image');
    	$this->data['entry_position'] = $this->language->get('entry_position');
    	$this->data['entry_update'] = $this->language->get('entry_update');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_image_title'] = $this->language->get('entry_image_title');
		
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');		
		
		$this->data['token'] = $this->session->data['token'];
		
		// Tabs
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_links'] = $this->language->get('tab_links');
		$this->data['tab_image'] = $this->language->get('tab_image');
  
    	$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['button_add_attribute'] = $this->language->get('button_add_attribute');
		$this->data['button_add_option'] = $this->language->get('button_add_option');
		$this->data['button_add_option_value'] = $this->language->get('button_add_option_value');
		$this->data['button_add_discount'] = $this->language->get('button_add_discount');
		$this->data['button_add_special'] = $this->language->get('button_add_special');
		$this->data['button_add_image'] = $this->language->get('button_add_image');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['text_default'] = $this->language->get('text_default');
  
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
		
  		if (isset($this->error['company'])) {
			$this->data['error_company'] = $this->error['company'];
		} else {
			$this->data['error_company'] = '';
		}
		
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'),      		
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['company_id'])) {
			$this->data['action'] = $this->url->link('catalog/company/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/company/update', 'token=' . $this->session->data['token'] . '&company_id=' . $this->request->get['company_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL');
 		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

    	if (isset($this->request->get['company_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$company_info = $this->model_catalog_company->getCompany($this->request->get['company_id']);
    	}
		
    	if (isset($this->request->get['company_id'])) {
    		$this->data['show_update'] = true;
		} else {
			$this->data['show_update'] = false;
 		}

		if (isset($this->request->post['company_description'])) {
			$this->data['company_description'] = $this->request->post['company_description'];
		} elseif (isset($this->request->get['company_id'])) {
			$this->data['company_description'] = $this->model_catalog_company->getCompanyDescriptions($this->request->get['company_id']);
		} else {
			$this->data['company_description'] = array();
		}   	
				
		$this->load->model('tool/image');
		
		if (isset($this->request->post['company_image'])) {
			$company_images = $this->request->post['company_image'];
		} elseif (isset($company_info)) {
			$company_images = $this->model_catalog_company->getCompanyImages($this->request->get['company_id']);
		} else {
			$company_images = array();
		}
		
		$this->data['company_images'] = array();
		
		foreach ($company_images as $company_image) {
			if ($company_image['image'] && file_exists(DIR_IMAGE . $company_image['image'])) {
				$image = $company_image['image'];
			} else {
				$image = 'no_image.jpg';
			}
			$image_title = $company_image['image_title'];
			
			$this->data['company_images'][] = array(
				'image'   => $image,
				'image_title'   => $image_title,
				'preview' => $this->model_tool_image->resize($image, 100, 100)
			);
			
		}
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		if (isset($this->request->post['small_image'])) {
			$this->data['small_image'] = $this->request->post['small_image'];
		} elseif (isset($company_info)) {
			$this->data['small_image'] = $company_info['small_image'];
		} else {
			$this->data['small_image'] = '';
		}
		
		if (isset($this->request->post['big_image'])) {
			$this->data['big_image'] = $this->request->post['big_image'];
		} elseif (isset($company_info)) {
			$this->data['big_image'] = $company_info['big_image'];
		} else {
			$this->data['big_image'] = '';
		}
		
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($company_info)) {
			$this->data['sort_order'] = $company_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($company_info) && $company_info['small_image'] && file_exists(DIR_IMAGE . $company_info['small_image'])) {
			$this->data['preview_small_image'] = $this->model_tool_image->resize($company_info['small_image'], 100, 100);
		} else {
			$this->data['preview_small_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		if (isset($company_info) && $company_info['big_image'] && file_exists(DIR_IMAGE . $company_info['big_image'])) {
			$this->data['preview_big_image'] = $this->model_tool_image->resize($company_info['big_image'], 100, 100);
		} else {
			$this->data['preview_big_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
    	
    	if (isset($this->request->post['update'])) {
      		$this->data['update'] = $this->request->post['update'];
    	} else {
      		$this->data['update'] = false;
    	}

		$this->template = 'catalog/company_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());	
  	}

  	private function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'catalog/company')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
		
		foreach ($this->request->post['company_description'] as $language_id => $value) {
      		if ((strlen(utf8_decode($value['name'])) < 1) || (strlen(utf8_decode($value['name'])) > 255)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		} else if ((strlen(utf8_decode($value['position'])) < 1) || (strlen(utf8_decode($value['position'])) > 255)) {
        		$this->error['position'][$language_id] = $this->language->get('error_position');
      		}
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}

  	private function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'catalog/company')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}	
		
		$this->load->model('catalog/company');

		/*foreach ($this->request->post['selected'] as $company_id) {
  			$company_total = $this->model_catalog_company->getTotalcompanysByCompanyId($company_id);
    
			if ($company_total) {
	  			$this->error['warning'] = sprintf($this->language->get('error_company'), $company_total);	
			}	
		}*/
			  	  	 
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		} 
  	}
}
?>