<?php 
class ControllerCatalogDemo extends Controller {
	private $error = array(); 
     
  	public function index() {
		$this->load->language('catalog/demo');
    	
		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('catalog/demo');
		
		$this->getList();
  	}
  
  	public function insert() {
    	$this->load->language('catalog/demo');

    	$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('catalog/demo');
		
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_demo->addDemo($this->request->post);
	  		
			$this->session->data['success'] = $this->language->get('text_success');
	  
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}
	
    	$this->getForm();
  	}

  	public function update() {
    	$this->load->language('catalog/demo');
		
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/demo');
		
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_demo->editDemo($this->request->get['demo_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
		
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getForm();
  	}

  	public function delete() {
    	$this->load->language('catalog/demo');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/demo');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $demo_id) {
				$this->model_catalog_demo->deleteDemo($demo_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}

  	public function copy() {
    	$this->load->language('catalog/demo');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/demo');
		
		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $demo_id) {
				$this->model_catalog_demo->copyDemo($demo_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
		
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}
	
  	private function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'sd.name';
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
		
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
		
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
			'href'      => $this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url, 'SSL'),       		
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('catalog/demo/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['copy'] = $this->url->link('catalog/demo/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');	
		$this->data['delete'] = $this->url->link('catalog/demo/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
    	
		$this->data['demos'] = array();

		$data = array(
			'filter_name'  => $filter_name,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'           => $this->config->get('config_admin_limit')
		);
		
		$this->load->model('tool/image');
		
		$demo_total = $this->model_catalog_demo->getTotalDemos($data);
		
		$results = $this->model_catalog_demo->getDemos($data);
	   	
		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/demo/update', 'token=' . $this->session->data['token'] . '&demo_id=' . $result['demo_id'] . $url, 'SSL')
			);
			
			if ($result['image_icon'] && file_exists(DIR_IMAGE . $result['image_icon'])) {
				$image_icon = $this->model_tool_image->resize($result['image_icon'], 40, 40);
			} else {
				$image_icon = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}
			
			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}
			
			if ($result['image_preview'] && file_exists(DIR_IMAGE . $result['image_preview'])) {
				$image_preview = $this->model_tool_image->resize($result['image_preview'], 40, 40);
			} else {
				$image_preview = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}
	
      		$this->data['demos'][] = array(
				'demo_id' => $result['demo_id'],
				'name'       => $result['name'],
				'image_icon'    => $image_icon,
				'image'      	=> $image,
				'image_preview' => $image_preview,
				'selected'   => isset($this->request->post['selected']) && in_array($result['demo_id'], $this->request->post['selected']),
				'action'     => $action
			);
    	}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
				
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
			
		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_image_icon'] = $this->language->get('column_image_icon');
		$this->data['column_image_preview'] = $this->language->get('column_image_preview');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_action'] = $this->language->get('column_action');
				
		$this->data['button_copy'] = $this->language->get('button_copy');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_filter'] = $this->language->get('button_filter');
		 
 		$this->data['token'] = $this->session->data['token'];
		
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

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
		
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
					
		$this->data['sort_name'] = $this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . '&sort=sd.name' . $url, 'SSL');
		$this->data['sort_order'] = $this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . '&sort=s.sort_order' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $demo_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();
	
		$this->data['filter_name'] = $filter_name;
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->layout = 'common/layout';
		$this->template = 'catalog/demo_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		$this->response->setOutput($this->render());
  	}

  	private function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');
 
    	$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
    	$this->data['text_none'] = $this->language->get('text_none');
    	$this->data['text_yes'] = $this->language->get('text_yes');
    	$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_plus'] = $this->language->get('text_plus');
		$this->data['text_minus'] = $this->language->get('text_minus');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_option'] = $this->language->get('text_option');
		$this->data['text_option_value'] = $this->language->get('text_option_value');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_percent'] = $this->language->get('text_percent');
		$this->data['text_amount'] = $this->language->get('text_amount');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_description'] = $this->language->get('entry_description');
    	$this->data['entry_price'] = $this->language->get('entry_price');
    	$this->data['entry_image'] = $this->language->get('entry_image');
    	$this->data['entry_image_icon'] = $this->language->get('entry_image_icon');
    	$this->data['entry_image_preview'] = $this->language->get('entry_image_preview');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
		$this->data['entry_priority'] = $this->language->get('entry_priority');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_service'] = $this->language->get('entry_service');
		$this->data['entry_link'] = $this->language->get('entry_link');
		$this->data['entry_title'] = $this->language->get('entry_title');
    	$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_attribute'] = $this->language->get('button_add_attribute');
		$this->data['button_add_option'] = $this->language->get('button_add_option');
		$this->data['button_add_option_value'] = $this->language->get('button_add_option_value');
		$this->data['button_add_discount'] = $this->language->get('button_add_discount');
		$this->data['button_add_special'] = $this->language->get('button_add_special');
		$this->data['button_add_image'] = $this->language->get('button_add_image');
		$this->data['button_add_link'] = $this->language->get('button_add_link');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
    	$this->data['tab_general'] = $this->language->get('tab_general');
    	$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_link'] = $this->language->get('tab_link');
		 
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

 		if (isset($this->error['meta_description'])) {
			$this->data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$this->data['error_meta_description'] = array();
		}
   
   		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}
		
		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
		
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}
		
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
			'href'      => $this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['demo_id'])) {
			$this->data['action'] = $this->url->link('catalog/demo/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/demo/update', 'token=' . $this->session->data['token'] . '&demo_id=' . $this->request->get['demo_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/demo', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['token'] = $this->session->data['token'];
		
		if (isset($this->request->get['demo_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$demo_info = $this->model_catalog_demo->getDemo($this->request->get['demo_id']);
    	}

		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['demo_description'])) {
			$this->data['demo_description'] = $this->request->post['demo_description'];
		} elseif (isset($demo_info)) {
			$this->data['demo_description'] = $this->model_catalog_demo->getDemoDescriptions($this->request->get['demo_id']);
		} else {
			$this->data['demo_description'] = array();
		}
		
		if (isset($this->request->post['demo_link'])) {
			$this->data['demo_link'] = $this->request->post['demo_link'];
		} elseif (isset($demo_info)) {
			$this->data['demo_link'] = $this->model_catalog_demo->getDemoLinks($this->request->get['demo_id']);
		} else {
			$this->data['demo_link'] = array();
		}
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($demo_info)) {
			$this->data['keyword'] = $demo_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}
		
		if (isset($this->request->post['sort_order'])) {
      		$this->data['sort_order'] = $this->request->post['sort_order'];
    	} elseif (isset($demo_info)) {
      		$this->data['sort_order'] = $demo_info['sort_order'];
    	} else {
			$this->data['sort_order'] = 1;
		}
		
		if (isset($this->request->post['image_icon'])) {
      		$this->data['image_icon'] = $this->request->post['image_icon'];
    	} elseif (isset($demo_info)) {
      		$this->data['image_icon'] = $demo_info['image_icon'];
    	} else {
			$this->data['image_icon'] = '';
		}
		
		if (isset($this->request->post['image'])) {
      		$this->data['image'] = $this->request->post['image'];
    	} elseif (isset($demo_info)) {
      		$this->data['image'] = $demo_info['image'];
    	} else {
			$this->data['image'] = '';
		}
		
		if (isset($this->request->post['image_preview'])) {
      		$this->data['image_preview'] = $this->request->post['image_preview'];
    	} elseif (isset($demo_info)) {
      		$this->data['image_preview'] = $demo_info['image_preview'];
    	} else {
			$this->data['image_preview'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($demo_info) && $demo_info['image_icon'] && file_exists(DIR_IMAGE . $demo_info['image_icon'])) {
			$this->data['preview_icon'] = $this->model_tool_image->resize($demo_info['image_icon'], 100, 100);
		} else {
			$this->data['preview_icon'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		if (isset($demo_info) && $demo_info['image'] && file_exists(DIR_IMAGE . $demo_info['image'])) {
			$this->data['preview'] = $this->model_tool_image->resize($demo_info['image'], 100, 100);
		} else {
			$this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		if (isset($demo_info) && $demo_info['image_preview'] && file_exists(DIR_IMAGE . $demo_info['image_preview'])) {
			$this->data['preview_preview'] = $this->model_tool_image->resize($demo_info['image_preview'], 100, 100);
		} else {
			$this->data['preview_preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$this->load->model('sale/customer_group');
		
		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
		
		$this->template = 'catalog/demo_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		$this->response->setOutput($this->render());
  	} 
	
  	private function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'catalog/demo')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	foreach ($this->request->post['demo_description'] as $language_id => $value) {
      		if ((strlen(utf8_decode($value['name'])) < 1) || (strlen(utf8_decode($value['name'])) > 255)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		}
      		if ((strlen(utf8_decode($value['description'])) < 3) || (strlen(utf8_decode($value['description'])) > 999999999)) {
        		$this->error['description'][$language_id] = $this->language->get('error_description');
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
    	if (!$this->user->hasPermission('modify', 'catalog/demo')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
  	
  	private function validateCopy() {
    	if (!$this->user->hasPermission('modify', 'catalog/demo')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
	
	public function autocomplete() {
		$json = array();
		
		if (isset($this->request->post['filter_name'])) {
			$this->load->model('catalog/demo');
			
			$data = array(
				'filter_name' => $this->request->post['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);
			
			$results = $this->model_catalog_demo->getDemos($data);
			
			foreach ($results as $result) {
				$json[] = array(
					'demo_id' => $result['demo_id'],
					'name'       => html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'),	
					'model'      => $result['model'],
					'price'      => $result['price']
				);	
			}
		}
		
		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}
}
?>