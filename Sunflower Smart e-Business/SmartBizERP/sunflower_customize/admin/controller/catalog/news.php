<?php
class ControllerCatalogNews extends Controller {
	private $error = array();
 
	public function index() {
		
		$this->load->language('catalog/news');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		$this->getList();
	} 
	
	private function getList() {
		$checkTable = $this->model_catalog_news->checkTable();
		$this->data['checkTable'] = $checkTable;
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'r.date_added';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url,
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = HTTPS_SERVER . 'index.php?route=catalog/news/insert&token=' . $this->session->data['token'] . $url;
		$this->data['delete'] = HTTPS_SERVER . 'index.php?route=catalog/news/delete&token=' . $this->session->data['token'] . $url;
		//$this->data['gen_table'] = HTTPS_SERVER . 'index.php?route=catalog/news/checkTableExit&token=' . $this->session->data['token'] . $url;

		$this->data['news'] = array();

		if ($page > 0) {
			$data = array(
				'sort'  => $sort,
				'order' => $order,
				'start' => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit' => $this->config->get('config_admin_limit')
				);
		} else {
			$data = array(
				'sort'  => $sort,
				'order' => $order
				);
		}
		
		$news_total = $this->model_catalog_news->getTotalNews();
		
		$results = $this->model_catalog_news->getArrNews($data);
 
    	foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => HTTPS_SERVER . 'index.php?route=catalog/news/update&token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'] . $url,
				'view' => $this->language->get('text_view'),
				'viewhref' => HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'] . $url
			);
						
			$this->data['news'][] = array(
				'news_id'  => $result['news_id'],
				'name'       => $result['title'],
				'author'     => $result['author'],
				'post' 		 => $this->model_catalog_news->getTotalPost($result['news_id']),
				'read'		 => $this->model_catalog_news->getTotalRead($result['news_id']),
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])), 
				'time_added' => date($this->language->get('time_format'), strtotime($result['date_added'])),
				'selected'   => isset($this->request->post['selected']) && in_array($result['news_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_subject'] = $this->language->get('column_subject');
		$this->data['column_author'] = $this->language->get('column_author');
		$this->data['column_readwrite'] = $this->language->get('column_readwrite');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['column_post'] = $this->language->get('column_post');
		$this->data['column_read'] = $this->language->get('column_read');
		$this->data['column_createdby'] = $this->language->get('column_createdby');		
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_table'] = $this->language->get('button_table');
		
 		
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
		
		$this->data['sort_news'] = HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . '&sort=nid.title' . $url;
		$this->data['sort_author'] = HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . '&sort=n.author' . $url;
		$this->data['sort_status'] = HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . '&sort=n.status' . $url;
		$this->data['sort_date_added'] = HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . '&sort=n.date_added' . $url;
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->is_guide = false;
		$pagination->is_bo_page = true;
		$pagination->num_current_products = count($results);
		if ($page > 0) {
			$pagination->limit = $this->config->get('config_admin_limit');	
		} else {
			$pagination->limit = $news_total;
		}
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url . '&page={page}';
			
		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		
		$this->template = 'catalog/news_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}

	public function insert() {
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news->addNews($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url);
		}

		$this->getForm();
	}
	
	private function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_select'] = $this->language->get('text_select');

		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_preview'] = $this->language->get('entry_preview');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['entry_metakeyword'] = $this->language->get('entry_metakeyword');
		$this->data['entry_metadescription'] = $this->language->get('entry_metadescription');
		
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
		
		$this->data['entry_youtube_title'] = $this->language->get('entry_youtube_title');
		$this->data['entry_youtube_preview'] = $this->language->get('entry_youtube_preview');
		$this->data['entry_youtube_v'] = $this->language->get('entry_youtube_v');
		$this->data['entry_youtube_width'] = $this->language->get('entry_youtube_width');
		$this->data['entry_youtube_height'] = $this->language->get('entry_youtube_height');
		$this->data['entry_youtube_autoplay'] = $this->language->get('entry_youtube_autoplay');
		
		$this->data['entry_main_caption'] = $this->language->get('entry_main_caption');
		
		$this->data['entry_option_images'] = array();
		
		for ($i = 0; $i < 6; $i++ ) {
			$this->data['entry_option_images'][] = array(
				'image' => $this->language->get('entry_option_image_' . ($i+1)),
				'thumbnail' => $this->language->get('entry_option_thumbnail_' . ($i+1)),
				'caption' => $this->language->get('entry_option_caption_' . ($i+1)),
			);
			
		}

		
		
		$this->data['entry_fred_samuel_image'] = $this->language->get('entry_fred_samuel_image');
		$this->data['entry_relate_product_image'] = $this->language->get('entry_relate_product_image');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_youtube'] = $this->language->get('button_add_youtube');
		
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_youtube'] = $this->language->get('tab_youtube');
		$this->data['tab_related'] = $this->language->get('tab_related');
		
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
 		
		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = '';
		}
		
		if (isset($this->error['preview'])) {
			$this->data['error_preview'] = $this->error['preview'];
		} else {
			$this->data['error_preview'] = '';
		}
		
		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = '';
		}
		
 		if (isset($this->error['author'])) {
			$this->data['error_author'] = $this->error['author'];
		} else {
			$this->data['error_author'] = '';
		}
		
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = '';
		}
		
		if (isset($this->error['thumbnail'])) {
			$this->data['error_thumbnail'] = $this->error['thumbnail'];
		} else {
			$this->data['error_thumbnail'] = '';
		}
		
		if (isset($this->error['fred_image'])) {
			$this->data['error_fred_image'] = $this->error['fred_image'];
		} else {
			$this->data['error_fred_image'] = '';
		}
		
		if (isset($this->error['related_product_image'])) {
			$this->data['error_related_product_image'] = $this->error['related_product_image'];
		} else {
			$this->data['error_related_product_image'] = '';
		}
		
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['news_id'])) {
			$url .= '&news_id=' . $this->request->get['news_id'];
		}
				
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url,
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->load->model('localisation/language');
		$this->load->model('tool/image');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (!isset($this->request->get['news_id'])) { 
			$this->data['action'] = HTTPS_SERVER . 'index.php?route=catalog/news/insert&token=' . $this->session->data['token'] . $url;
		} else {
			$this->data['action'] = HTTPS_SERVER . 'index.php?route=catalog/news/update&token=' . $this->session->data['token'] . $url;
		}
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url;

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['news_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$news_info = $this->model_catalog_news->getNews($this->request->get['news_id']);
		}
		
		if (isset($this->request->post['news_description'])) {
			$this->data['news_description'] = $this->request->post['news_description'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_description'] = $this->model_catalog_news->getNewsDescriptions($this->request->get['news_id']);
		} else {
			$this->data['news_description'] = array();
		}
		
		if (isset($this->request->post['news_youtubes'])) {
			$this->data['news_youtubes'] = $this->request->post['news_youtubes'];
		} elseif (isset($news_info)) {
			$this->data['news_youtubes'] = $this->model_catalog_news->getYoutube($this->request->get['news_id']);
		} else {
			$this->data['news_youtubes'] = array();
		}
				
		if (isset($this->request->post['author'])) {
			$this->data['author'] = $this->request->post['author'];
		} elseif (isset($news_info)) {
			$this->data['author'] = $news_info['author'];
		} else {
			$this->data['author'] = '';
		}
		
		if (isset($this->request->post['start_date'])) {
			$this->data['start_date'] = $this->request->post['start_date'];
		} elseif (isset($news_info)) {
			if($news_info['publish_start']=='0000-00-00 00:00:00'){
				$this->data['start_date'] = '';
			}else{
				$this->data['start_date'] = date('Y-m-d', strtotime($news_info['publish_start']));
			}
		} else {
			$this->data['start_date'] = '';
		}
		
		if (isset($this->request->post['end_date'])) {
			$this->data['end_date'] = $this->request->post['end_date'];
		} elseif (isset($news_info)) {
			if($news_info['publish_end']=='0000-00-00 00:00:00'){
				$this->data['end_date'] = '';
			}else{
				$this->data['end_date'] = date('Y-m-d', strtotime($news_info['publish_end']));
			}
		} else {
			$this->data['end_date'] = '';
		}
		
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($news_info)) {
			$this->data['sort_order'] = $news_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}
		
		$this->data['newsarry'] = $this->model_catalog_news->getNewsList();
		
		if (isset($this->request->post['news_related'])) {
			$this->data['news_related'] = $this->request->post['news_related'];
		} elseif (isset($news_info)) {
			$this->data['news_related'] = $this->model_catalog_news->getNewsRelated($this->request->get['news_id']);
		} else {
			$this->data['news_related'] = array();
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['image']) && trim($this->request->post['image']) != '') {
			$this->data['image'] = $this->request->post['image'];
			$this->data['preview'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (isset($news_info)) {
			$this->data['image'] = $news_info['image'];
			if ($news_info['image'] && file_exists(DIR_IMAGE . $news_info['image'])) {
				
				$this->data['preview'] = $this->model_tool_image->resize($news_info['image'], 100, 100);
			} else {
				$this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
			}	
		} else {
			$this->data['image'] = '';
			$this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($news_info)) {
			$this->data['status'] = $news_info['status'];
		} else {
			$this->data['status'] = '';
		}
		
		$this->template = 'catalog/news_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	public function delete() { 
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_catalog_news->deleteNews($news_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url);
		}

		$this->getList();
	}
	
	public function update() {
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		//echo "<pre>";print_r($this->request->post);echo "</pre>";exit();
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news->editNews($this->request->get['news_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url);
		}

		$this->getForm();
	}
	
	public function view() {
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		$this->getPosts();
	} 
	
	private function getPosts() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'n.date_added';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['news_id'])) {
			$url .= '&news_id=' . $this->request->get['news_id'];
		}
		
		$news_id = $this->request->get['news_id'];
		
		$news_title = $this->model_catalog_news->getNewsDescription($news_id);
		
  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . $url,
       		'text'      => $news_title['title'],
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = HTTPS_SERVER . 'index.php?route=catalog/news/insertpost&token=' . $this->session->data['token'] . $url;					
		$this->data['delete'] = HTTPS_SERVER . 'index.php?route=catalog/news/deletepost&token=' . $this->session->data['token'] . $url;

		

		$data = array(
			'news_id' => $news_id,
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$news_total = $this->model_catalog_news->getTotalPost($news_id);
		
		$results = $this->model_catalog_news->getPosts($data);
 		
		$this->data['newsarry'] = array();
		
    	foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => HTTPS_SERVER . 'index.php?route=catalog/news/updatepost&token=' . $this->session->data['token'] . '&post_id=' . $result['post_id'] . $url,
			);
			
			$this->data['newsarry'][] = array(
				'news_id'  => $result['news_id'],
				'post_id'  => $result['post_id'],
				'name'       => $result['text'],
				'author'     => $result['author'],
				'ip'       => $result['ip'],
				'rating'     => $result['rating'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])), 
				'time_added' => date($this->language->get('time_format'), strtotime($result['date_added'])),
				'selected'   => isset($this->request->post['selected']) && in_array($result['news_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}	
		
		$this->data['heading_title'] = $news_title['title'];

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_title'] = $this->language->get('column_subject');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_createdby'] = $this->language->get('column_createdby');
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['column_rating'] = $this->language->get('column_rating');
		$this->data['column_status'] = $this->language->get('column_status');
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_table'] = $this->language->get('button_table');
		
 		
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
		
		if (isset($this->request->get['news_id'])) {
			$url .= '&news_id=' . $this->request->get['news_id'];
		}
		
		$this->data['sort_text'] = HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . '&sort=np.text' . $url;
		$this->data['sort_date_added'] = HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . '&sort=np.date_added' . $url;
		$this->data['sort_status'] = HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . '&sort=np.status' . $url;
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->is_guide = false;
		$pagination->is_bo_page = true;
		$pagination->num_current_products = count($results);
		if ($page > 0) {
			$pagination->limit = $this->config->get('config_admin_limit');	
		} else {
			$pagination->limit = $news_total;
		}
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url . '&page={page}';
			
		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		
		$this->template = 'catalog/newspost_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	public function deletepost() { 
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $post_id) {
				$this->model_catalog_news->deletePost($post_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['news_id'])) {
				$url .= '&news_id=' . $this->request->get['news_id'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . $url);
		}

		$this->getPosts();
	}
	
	public function insertpost() {
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePostForm()) {
			$this->model_catalog_news->addPost($this->request->get['news_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['news_id'])) {
				$url .= '&news_id=' . $this->request->get['news_id'];
			}
			
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . $url);
		}

		$this->getPostForm();
	}
	
	private function getPostForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_select'] = $this->language->get('text_select');

		
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_description'] = $this->language->get('entry_description');
		
		$this->data['entry_rating'] = $this->language->get('entry_rating');
		$this->data['entry_bad'] = $this->language->get('entry_bad');
		$this->data['entry_good'] = $this->language->get('entry_good');
				
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
 		
		
		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = '';
		}
		
		if (isset($this->error['author'])) {
			$this->data['error_author'] = $this->error['author'];
		} else {
			$this->data['error_author'] = '';
		}
		
		if (isset($this->error['rating'])) {
			$this->data['error_rating'] = $this->error['rating'];
		} else {
			$this->data['error_rating'] = '';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['news_id'])) {
			$url .= '&news_id=' . $this->request->get['news_id'];
		}
		
		if (isset($this->request->get['post_id'])) {
			$url .= '&post_id=' . $this->request->get['post_id'];
		}
		
		$news_id = $this->request->get['news_id'];
		
		$news_title = $this->model_catalog_news->getNewsDescription($news_id);
				
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=catalog/news&token=' . $this->session->data['token'] . $url,
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . $url,
       		'text'      => $news_title['title'],
      		'separator' => ' :: '
   		);
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->get['post_id'])) { 
			$this->data['action'] = HTTPS_SERVER . 'index.php?route=catalog/news/updatepost&token=' . $this->session->data['token'] . $url;
		} else {
			$this->data['action'] = HTTPS_SERVER . 'index.php?route=catalog/news/insertpost&token=' . $this->session->data['token'] . $url;
		}
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . $url;

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['post_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$post_info = $this->model_catalog_news->getPost($this->request->get['post_id']);
		}
		
		if (isset($this->request->post['description'])) {
			$this->data['description'] = $this->request->post['description'];
		} elseif (isset($post_info)) {
			$this->data['description'] = $post_info['text'];
		} else {
			$this->data['description'] = '';
		}
		
		if (isset($this->request->post['related_product_url_text'])) {
			$this->data['related_product_url_text'] = $this->request->post['related_product_url_text'];
		} elseif (isset($post_info)) {
			$this->data['related_product_url_text'] = $post_info['related_product_url_text'];
		} else {
			$this->data['related_product_url_text'] = '';
		}
		
		$myip = $_SERVER["REMOTE_ADDR"];
		$this->data['myip'] = $myip;
		
		if (isset($this->request->post['author'])) {
			$this->data['author'] = $this->request->post['author'];
		} elseif (isset($post_info)) {
			$this->data['author'] = $post_info['author'];
		} else {
			$this->data['author'] = '';
		}
		
		if (isset($this->request->post['rating'])) {
			$this->data['rating'] = $this->request->post['rating'];
		} elseif (isset($post_info)) {
			$this->data['rating'] = $post_info['rating'];
		} else {
			$this->data['rating'] = '';
		}
		
			
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($post_info)) {
			$this->data['status'] = $post_info['status'];
		} else {
			$this->data['status'] = '';
		}
		
		$this->template = 'catalog/newspost_form.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		$this->response->setOutput($this->render());
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	public function updatepost() {
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePostForm()) {
			$this->model_catalog_news->editNewsPost($this->request->get['post_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['news_id'])) {
				$url .= '&news_id=' . $this->request->get['news_id'];
			}
			
			if (isset($this->request->get['post_id'])) {
				$url .= '&post_id=' . $this->request->get['post_id'];
			}
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/news/view&token=' . $this->session->data['token'] . $url);
		}

		$this->getPostForm();
	}
	
	public function checkTableExit() {
		$this->load->language('catalog/news');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		$checkTable = $this->model_catalog_news->checkTable();
		$this->data['checkTable'] = $checkTable;

		$this->getList();
	}
	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
			
		if (!$this->error) {
			return TRUE;
		} else {
			if (!isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_required_data');
			}
			return FALSE;
		}
	}
	
	private function validatePostForm() {
		if (!$this->user->hasPermission('modify', 'catalog/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		
		if ((strlen(utf8_decode($this->request->post['author'])) < 3) || (strlen(utf8_decode($this->request->post['author'])) > 64)) {
			$this->error['author'] = $this->language->get('error_author');
		}
			
		if ((strlen(utf8_decode($this->request->post['description'])) < 25) || (strlen(utf8_decode($this->request->post['author'])) > 1000)) {
			$this->error['description'] = $this->language->get('error_description');
		}
			
		
		if (!$this->error) {
			return TRUE;
		} else {
			if (!isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_required_data');
			}
			return FALSE;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/news')) {
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