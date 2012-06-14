<?php  
class ControllerCatalogDownload extends Controller {  
	private $error = array();
	
  	public function index() {
		$this->load->language('catalog/download');

    	$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('catalog/download');
		
    	$this->getList();
  	}
  	        
  	public function insert() {
		$this->load->language('catalog/download');
    
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/download');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$data = array();
			
			if (is_uploaded_file($this->request->files['download']['tmp_name'])) {
				$filename = $this->request->files['download']['name'];
				
				move_uploaded_file($this->request->files['download']['tmp_name'], DIR_DOWNLOAD . $filename);

				if (file_exists(DIR_DOWNLOAD . $filename)) {
					$data['download'] = $filename;
					$data['mask'] = $this->request->files['download']['name'];
				}
			}
			
			if (is_uploaded_file($this->request->files['movie']['tmp_name'])) {
				$movie_filename = $this->request->files['movie']['name'] ;
				
				move_uploaded_file($this->request->files['movie']['tmp_name'], DIR_DOWNLOAD . $movie_filename);

				if (file_exists(DIR_DOWNLOAD . $movie_filename)) {
					$data['movie'] = $movie_filename;
					$data['mask'] = $this->request->files['movie']['name'];
				}
			}

			$this->model_catalog_download->addDownload(array_merge($this->request->post, $data));
   	  		
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
			
			$this->redirect($this->url->link('catalog/download', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
    	$this->getForm();
  	}

  	public function update() {
		$this->load->language('catalog/download');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/download');
			
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$data = array();
			
			if (is_uploaded_file($this->request->files['download']['tmp_name'])) {
				$filename = $this->request->files['download']['name'];
				
				move_uploaded_file($this->request->files['download']['tmp_name'], DIR_DOWNLOAD . $filename);

				if (file_exists(DIR_DOWNLOAD . $filename)) {
					$data['download'] = $filename;
					$data['mask'] = $this->request->files['download']['name'];
				}
			}
			
			if (is_uploaded_file($this->request->files['movie']['tmp_name'])) {
				$movie_filename = $this->request->files['movie']['name'] ;
				
				move_uploaded_file($this->request->files['movie']['tmp_name'], DIR_DOWNLOAD . $movie_filename);

				if (file_exists(DIR_DOWNLOAD . $movie_filename)) {
					$data['movie'] = $movie_filename;
					$data['mask'] = $this->request->files['movie']['name'];
				}
			}
			
			$this->model_catalog_download->editDownload($this->request->get['download_id'], array_merge($this->request->post, $data));
	  		
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
			
			$this->redirect($this->url->link('catalog/download', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
    	$this->getForm();
  	}

  	public function delete() {
		$this->load->language('catalog/download');
 
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/download');
			
    	if (isset($this->request->post['selected']) && $this->validateDelete()) {	  
			foreach ($this->request->post['selected'] as $download_id) {
			
				$results = $this->model_catalog_download->getDownload($download_id);
               
				$filename = $results['filename'];

				if (file_exists(DIR_DOWNLOAD . $filename)) {
					@unlink(DIR_DOWNLOAD . $filename);
				}
			
				$this->model_catalog_download->deleteDownload($download_id);
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
			
			$this->redirect($this->url->link('catalog/download', 'token=' . $this->session->data['token'] . $url, 'SSL'));
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
			'href'      => $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['insert'] = $this->url->link('catalog/download/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/download/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$this->data['downloads'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$download_total = $this->model_catalog_download->getTotalDownloads();
	
		$results = $this->model_catalog_download->getDownloads($data);
 
    	foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/download/update', 'token=' . $this->session->data['token'] . '&download_id=' . $result['download_id'] . $url, 'SSL')
			);
						
			$this->data['downloads'][] = array(
				'download_id' => $result['download_id'],
				'name'        => $result['name'],
				'category_name' => $result['category_name'],
				'download_allowed'   => $result['download_allowed'],
				'sort_order' => $result['sort_order'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['download_id'], $this->request->post['selected']),
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
		
		$this->data['sort_name'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . '&sort=dd.name' . $url, 'SSL');
		$this->data['sort_category_name'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . '&sort=dcd.name' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . '&sort=d.sort_order' . $url, 'SSL');
		$this->data['sort_download_allowed'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . '&sort=d.download_allowed' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $download_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/download_list.tpl';
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
		
  		if (isset($this->error['download'])) {
			$this->data['error_download'] = $this->error['download'];
		} else {
			$this->data['error_download'] = '';
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
			'href'      => $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . $url, 'SSL'),      		
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['download_id'])) {
			$this->data['action'] = $this->url->link('catalog/download/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/download/update', 'token=' . $this->session->data['token'] . '&download_id=' . $this->request->get['download_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'] . $url, 'SSL');
 		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

    	if (isset($this->request->get['download_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$download_info = $this->model_catalog_download->getDownload($this->request->get['download_id']);
    	}

    	if (isset($download_info['filename'])) {
    		$this->data['filename'] = $download_info['filename'];
		} else {
			$this->data['filename'] = '';
		}
		
		if (isset($download_info['movie'])) {
    		$this->data['movie'] = $download_info['movie'];
		} else {
			$this->data['movie'] = '';
		}
    	  
    	if (isset($this->request->get['download_id'])) {
    		$this->data['show_update'] = true;
		} else {
			$this->data['show_update'] = false;
 		}

		if (isset($this->request->post['download_description'])) {
			$this->data['download_description'] = $this->request->post['download_description'];
		} elseif (isset($this->request->get['download_id'])) {
			$this->data['download_description'] = $this->model_catalog_download->getDownloadDescriptions($this->request->get['download_id']);
		} else {
			$this->data['download_description'] = array();
		}   	
		
		if (isset($this->request->post['download_allowed'])) {
      		$this->data['download_allowed'] = $this->request->post['download_allowed'];
    	} elseif (isset($download_info['download_allowed'])) {
      		$this->data['download_allowed'] = $download_info['download_allowed'];
    	} else {
      		$this->data['download_allowed'] = 1;
    	}
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['download_store'])) {
			$this->data['download_store'] = $this->request->post['download_store'];
		} elseif (isset($download_info)) {
			$this->data['download_store'] = $this->model_catalog_download->getDownloadStores($this->request->get['download_id']);
		} else {
			$this->data['download_store'] = array(0);
		}
		
		$this->load->model('catalog/download_category');
		
		$this->data['categories'] = $this->model_catalog_download_category->getDownloadCategories(0);
		
		if (isset($this->request->post['download_category'])) {
			$this->data['download_category'] = $this->request->post['download_category'];
		} elseif (isset($download_info)) {
			$this->data['download_category'] = $this->model_catalog_download->getDownloadDownloadCategories($this->request->get['download_id']);
		} else {
			$this->data['download_category'] = array();
		}
		$this->load->model('tool/image');
		
		if (isset($this->request->post['download_image'])) {
			$download_images = $this->request->post['download_image'];
		} elseif (isset($download_info)) {
			$download_images = $this->model_catalog_download->getDownloadImages($this->request->get['download_id']);
		} else {
			$download_images = array();
		}
		
		$this->data['download_images'] = array();
		
		foreach ($download_images as $download_image) {
			if ($download_image['image'] && file_exists(DIR_IMAGE . $download_image['image'])) {
				$image = $download_image['image'];
			} else {
				$image = 'no_image.jpg';
			}
			$image_title = $download_image['image_title'];
			
			$this->data['download_images'][] = array(
				'image'   => $image,
				'image_title'   => $image_title,
				'preview' => $this->model_tool_image->resize($image, 100, 100)
			);
			
		}
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['download_store'])) {
			$this->data['download_store'] = $this->request->post['download_store'];
		} elseif (isset($download_info)) {
			$this->data['download_store'] = $this->model_catalog_download->getdownloadStores($this->request->get['download_id']);
		} else {
			$this->data['download_store'] = array(0);
		}
    	
    	if (isset($this->request->post['update'])) {
      		$this->data['update'] = $this->request->post['update'];
    	} else {
      		$this->data['update'] = false;
    	}

		$this->template = 'catalog/download_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());	
  	}

  	private function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'catalog/download')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
	
    	/*foreach ($this->request->post['download_description'] as $language_id => $value) {
      		if ((strlen(utf8_decode($value['name'])) < 3) || (strlen(utf8_decode($value['name'])) > 64)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		}
    	}*/	

		if ($this->request->files['download']['name']) {
			if ((strlen(utf8_decode($this->request->files['download']['name'])) < 3) || (strlen(utf8_decode($this->request->files['download']['name'])) > 128)) {
        		$this->error['download'] = $this->language->get('error_filename');
	  		}	  	
			
			if (substr(strrchr($this->request->files['download']['name'], '.'), 1) == 'php') {
       	   		$this->error['download'] = $this->language->get('error_filetype');
       		}	
						
			if ($this->request->files['download']['error'] != UPLOAD_ERR_OK) {
				$this->error['warning'] = $this->language->get('error_upload_' . $this->request->files['download']['error']);
			}
		}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}

  	private function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'catalog/download')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}	
		
		$this->load->model('catalog/download');

		foreach ($this->request->post['selected'] as $download_id) {
  			$download_total = $this->model_catalog_download->getTotaldownloadsByDownloadId($download_id);
    
			if ($download_total) {
	  			$this->error['warning'] = sprintf($this->language->get('error_download'), $download_total);	
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