<?php  
class ControllerCatalogQuickLink extends Controller {  
	private $error = array();
	
  	public function index() {
		$this->load->language('catalog/quick_link');

    	$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('catalog/quick_link');
		
    	$this->getList();
  	}
  	        
  	public function insert() {
		$this->load->language('catalog/quick_link');
    
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/quick_link');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$data = array();
			
			$this->model_catalog_quick_link->addQuickLink(array_merge($this->request->post, $data));
   	  		
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
			
			$this->redirect($this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
    	$this->getForm();
  	}

  	public function update() {
		$this->load->language('catalog/quick_link');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/quick_link');
			
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$data = array();
			
			$this->model_catalog_quick_link->editQuickLink($this->request->get['quick_link_id'], array_merge($this->request->post, $data));
	  		
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
			
			$this->redirect($this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
    	$this->getForm();
  	}

  	public function delete() {
		$this->load->language('catalog/quick_link');
 
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/quick_link');
			
    	if (isset($this->request->post['selected'])) {	  
			foreach ($this->request->post['selected'] as $quick_link_id) {
				$this->model_catalog_quick_link->deleteQuickLink($quick_link_id);
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
			
			$this->redirect($this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}

    	$this->getList();
  	}
    
  	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'dd.name';
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
			'href'      => $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['insert'] = $this->url->link('catalog/quick_link/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/quick_link/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$this->data['quick_links'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$quick_link_total = $this->model_catalog_quick_link->getTotalQuickLinks();
	
		$results = $this->model_catalog_quick_link->getQuickLinks($data);
 
    	foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/quick_link/update', 'token=' . $this->session->data['token'] . '&quick_link_id=' . $result['quick_link_id'] . $url, 'SSL')
			);
						
			$this->data['quick_links'][] = array(
				'quick_link_id' => $result['quick_link_id'],
				'name'        => $result['name'],
				'category_name' => $result['category_name'],
				'download_allowed'   => $result['download_allowed'],
				'sort_order' => $result['sort_order'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['quick_link_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_download_allowed'] = $this->language->get('column_download_allowed');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['column_category'] = $this->language->get('column_category');
		
		
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
		
		$this->data['sort_name'] = $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . '&sort=dd.name' . $url, 'SSL');
		$this->data['sort_category_name'] = $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . '&sort=dcd.name' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . '&sort=d.sort_order' . $url, 'SSL');
		//$this->data['sort_download_allowed'] = $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . '&sort=d.download_allowed' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $quick_link_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/quick_link_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
  	}
  
  	private function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');
   
    	$this->data['entry_name'] = $this->language->get('entry_name');
    	$this->data['entry_filename'] = $this->language->get('entry_filename');
		$this->data['entry_movie'] = $this->language->get('entry_movie');
    	$this->data['entry_download_allowed'] = $this->language->get('entry_download_allowed');
    	$this->data['entry_update'] = $this->language->get('entry_update');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_image_title'] = $this->language->get('entry_image_title');
		$this->data['entry_demo_url'] = $this->language->get('entry_demo_url');
		$this->data['entry_username_password'] = $this->language->get('entry_username_password');
		
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
		
  		if (isset($this->error['quick_link'])) {
			$this->data['error_quick_link'] = $this->error['quick_link'];
		} else {
			$this->data['error_quick_link'] = '';
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
			'href'      => $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . $url, 'SSL'),      		
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['quick_link_id'])) {
			$this->data['action'] = $this->url->link('catalog/quick_link/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/quick_link/update', 'token=' . $this->session->data['token'] . '&quick_link_id=' . $this->request->get['quick_link_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/quick_link', 'token=' . $this->session->data['token'] . $url, 'SSL');
 		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

    	if (isset($this->request->get['quick_link_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$quick_link_info = $this->model_catalog_quick_link->getQuickLink($this->request->get['quick_link_id']);
    	}
/*
    	if (isset($quick_link_info['filename'])) {
    		$this->data['filename'] = $quick_link_info['filename'];
		} else {
			$this->data['filename'] = '';
		}
		
		if (isset($quick_link_info['movie'])) {
    		$this->data['movie'] = $quick_link_info['movie'];
		} else {
			$this->data['movie'] = '';
		}
*/
		if (isset($this->request->post['demo_url'])) {
      		$this->data['demo_url'] = $this->request->post['demo_url'];
    	} elseif (isset($quick_link_info['demo_url'])) {
      		$this->data['demo_url'] = $quick_link_info['demo_url'];
    	} else {
      		$this->data['demo_url'] = '';
    	}
		if (isset($this->request->post['username_password'])) {
      		$this->data['username_password'] = $this->request->post['username_password'];
    	} elseif (isset($quick_link_info['username_password'])) {
      		$this->data['username_password'] = $quick_link_info['username_password'];
    	} else {
      		$this->data['username_password'] = '';
    	}
		
		if (isset($this->request->post['sort_order'])) {
      		$this->data['sort_order'] = $this->request->post['sort_order'];
    	} elseif (isset($quick_link_info['sort_order'])) {
      		$this->data['sort_order'] = $quick_link_info['sort_order'];
    	} else {
      		$this->data['sort_order'] = '';
    	}
		
    	if (isset($this->request->get['quick_link_id'])) {
    		$this->data['show_update'] = true;
		} else {
			$this->data['show_update'] = false;
 		}

		if (isset($this->request->post['quick_link_description'])) {
			$this->data['quick_link_description'] = $this->request->post['quick_link_description'];
		} elseif (isset($this->request->get['quick_link_id'])) {
			$this->data['quick_link_description'] = $this->model_catalog_quick_link->getQuickLinkDescriptions($this->request->get['quick_link_id']);
		} else {
			$this->data['quick_link_description'] = array();
		}   	
/*		
		if (isset($this->request->post['download_allowed'])) {
      		$this->data['download_allowed'] = $this->request->post['download_allowed'];
    	} elseif (isset($quick_link_info['download_allowed'])) {
      		$this->data['download_allowed'] = $quick_link_info['download_allowed'];
    	} else {
      		$this->data['download_allowed'] = 1;
    	}
*/		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['quick_link_store'])) {
			$this->data['quick_link_store'] = $this->request->post['quick_link_store'];
		} elseif (isset($quick_link_info)) {
			$this->data['quick_link_store'] = $this->model_catalog_quick_link->getQuickLinkStores($this->request->get['quick_link_id']);
		} else {
			$this->data['quick_link_store'] = array(0);
		}
		
		$this->load->model('catalog/quick_link_category');
		
		$this->data['categories'] = $this->model_catalog_quick_link_category->getQuickLinkCategories(0);
		
		if (isset($this->request->post['quick_link_category'])) {
			$this->data['quick_link_category'] = $this->request->post['quick_link_category'];
		} elseif (isset($quick_link_info)) {
			$this->data['quick_link_category'] = $this->model_catalog_quick_link->getQuickLinkToQuickLinkCategories($this->request->get['quick_link_id']);
		} else {
			$this->data['quick_link_category'] = array();
		}
		$this->load->model('tool/image');
		
		if (isset($this->request->post['quick_link_image'])) {
			$quick_link_images = $this->request->post['quick_link_image'];
		} elseif (isset($quick_link_info)) {
			$quick_link_images = $this->model_catalog_quick_link->getQuickLinkImages($this->request->get['quick_link_id']);
		} else {
			$quick_link_images = array();
		}
		
		$this->data['quick_link_images'] = array();
		
		foreach ($quick_link_images as $quick_link_image) {
			if ($quick_link_image['image'] && file_exists(DIR_IMAGE . $quick_link_image['image'])) {
				$image = $quick_link_image['image'];
			} else {
				$image = 'no_image.jpg';
			}
			$image_title = $quick_link_image['image_title'];
			
			$this->data['quick_link_images'][] = array(
				'image'   => $image,
				'image_title'   => $image_title,
				'preview' => $this->model_tool_image->resize($image, 100, 100)
			);
			
		}
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['quick_link_store'])) {
			$this->data['quick_link_store'] = $this->request->post['quick_link_store'];
		} elseif (isset($quick_link_info)) {
			$this->data['quick_link_store'] = $this->model_catalog_quick_link->getQuickLinkStores($this->request->get['quick_link_id']);
		} else {
			$this->data['quick_link_store'] = array(0);
		}
    	
    	if (isset($this->request->post['update'])) {
      		$this->data['update'] = $this->request->post['update'];
    	} else {
      		$this->data['update'] = false;
    	}

		$this->template = 'catalog/quick_link_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());	
  	}

  	private function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'catalog/quick_link')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
	
    	foreach ($this->request->post['quick_link_description'] as $language_id => $value) {
      		if ((strlen(utf8_decode($value['name'])) < 3) || (strlen(utf8_decode($value['name'])) > 64)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		}
    	}

		/*if ($this->request->files['quick_link']['name']) {
			if ((strlen(utf8_decode($this->request->files['quick_link']['name'])) < 3) || (strlen(utf8_decode($this->request->files['quick_link']['name'])) > 128)) {
        		$this->error['quick_link'] = $this->language->get('error_filename');
	  		}	  	
			
			if (substr(strrchr($this->request->files['quick_link']['name'], '.'), 1) == 'php') {
       	   		$this->error['quick_link'] = $this->language->get('error_filetype');
       		}	
						
			if ($this->request->files['quick_link']['error'] != UPLOAD_ERR_OK) {
				$this->error['warning'] = $this->language->get('error_upload_' . $this->request->files['quick_link']['error']);
			}
		}*/
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}

  	private function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'catalog/quick_link')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}	
		
		$this->load->model('catalog/quick_link');

		foreach ($this->request->post['selected'] as $quick_link_id) {
  			$quick_link_total = $this->model_catalog_quick_link->getTotalByQuickLinkId($quick_link_id);
    
			if ($quick_link_total) {
	  			$this->error['warning'] = sprintf($this->language->get('error_quick_link'), $quick_link_total);	
			}	
		}	
			  	  	 
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		} 
  	}
}
?>