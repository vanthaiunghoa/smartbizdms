<?php
abstract class SmartBizController extends Controller {

	protected function display($filename, $hasHeader = true, $hasFooter = true) {
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = $this->config->get('config_ssl');
		} else {
			$this->data['base'] = $this->config->get('config_url');
		}
		$this->language->load('common/header');
		
		
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		
		
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = HTTPS_IMAGE;
		} else {
			$server = HTTP_IMAGE;
		}	
				
		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/layout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/layout.tpl';
		} else {
			$this->template = 'default/template/common/layout.tpl';
		}
		$this->children = array();
		if ($hasHeader) {
			$this->children[] = 'smartbiz/header';
		}
		
		if ($hasFooter) {
			$this->children[] = 'smartbiz/footer';
		}
		$this->data['content'] = $this->fetch($this->config->get('config_template') . $filename);
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	protected function ajax_display($filename) {
		$this->response->setOutput($this->fetch($this->config->get('config_template') . $filename), $this->config->get('config_compression'));
	}
	
	protected function getHomePage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "home?" . $param;
		} else {
			return HTTP_SERVER . "home" ;
		}
	}
	
	protected function getServicePage($param = '') {
		if ($param != '') {
			return HTTP_SERVER ."service?" . $param;
		} else {
			return HTTP_SERVER . "service" ;
		}
	}
	
	protected function getDetailPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "solution?" . $param;
		} else {
			return HTTP_SERVER . "solution" ;
		}
	}
	
	protected function getDemoPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "demo?" . $param;
		} else {
			return HTTP_SERVER . "demo" ;
		}
	}
	
	protected function getNewsPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "news?" . $param;
		} else {
			return HTTP_SERVER . "news" ;
		}
	}
	
	protected function getAboutPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "about?" . $param;
		} else {
			return HTTP_SERVER . "about" ;
		}
	}
	
	protected function getContactPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "contact?" . $param;
		} else {
			return HTTP_SERVER . "contact" ;
		}
	}
	
	protected function getDownloadPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "downloads?" . $param;
		} else {
			return HTTP_SERVER . "downloads" ;
		}
	}
	
	protected function getLanguagePage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "language?" . $param;
		} else {
			return HTTP_SERVER . "language" ;
		}
	}
	
	protected function getLoginPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "login?" . $param;
		} else {
			return HTTP_SERVER . "login" ;
		}
	}
	
	protected function getRegisterPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "register?" . $param;
		} else {
			return HTTP_SERVER . "register" ;
		}
	}
	
	protected function getRequestProposalPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "proposal?" . $param;
		} else {
			return HTTP_SERVER . "proposal" ;
		}
	}
	
	protected function getSearchgooglePage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "searchgoogle?" . $param;
		} else {
			return HTTP_SERVER . "searchgoogle" ;
		}
	}
	
	protected function getSitemapPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "sitemap?" . $param;
		} else {
			return HTTP_SERVER . "sitemap" ;
		}
	}
	
	protected function getUsePage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "terms-of-use?" . $param;
		} else {
			return HTTP_SERVER . "terms-of-use" ;
		}
	}
	
	protected function getStatementPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "privacy-statement?" . $param;
		} else {
			return HTTP_SERVER . "privacy-statement" ;
		}
	}
	protected function getQuickLinkPage($param = '') {
		if ($param != '') {
			return HTTP_SERVER . "quick-link?" . $param;
		} else {
			return HTTP_SERVER . "quick-link" ;
		}
	}
	protected function getParam($key) {
		return isset($this->request->get[$key]) ? $this->request->get[$key] : null;
	}
	
	protected function postParam($key) {
		return isset($this->request->post[$key]) ? $this->request->post[$key] : null;
	}
	
	protected function updateStatusMenuNavigation($menu_id) {
		if (!isset($this->session->data['menu_status'])) {
			$menu_status = array(
				'home' => '',
				'product' => '',
				'demo' => '',
				'about' => '',
				'download' => '',
				'service' => '',
			); 
			$this->session->data['menu_status'] = $menu_status;
		}
		$menu_status = $this->session->data['menu_status'];
		
		foreach($menu_status as $key => &$status) {
			if ($key == $menu_id) {
				$status = 'selectedLava';
			} else {
				$status = '';
			}
		}
		$this->session->data['menu_status'] = $menu_status;
		switch ($menu_id) {
				case 'home':
					$this->session->data['current_page'] = $this->getHomePage();
					break;
				case 'product':
					$this->session->data['current_page'] = $this->getDetailPage();
					break;
				case 'demo':
					$this->session->data['current_page'] = $this->getDemoPage();
					break;
				case 'about':
					$this->session->data['current_page'] = $this->getAboutPage();
					break;
				case 'download':
					$this->session->data['current_page'] = $this->getDownloadPage();
					break;
				case 'service':
					$this->session->data['current_page'] = $this->getServicePage();
					break;
				case 'contact':
					$this->session->data['current_page'] = $this->getContactPage();
					break;
				default:
					$this->session->data['current_page'] = $this->getHomePage();
		}
	}
	
	protected function send($sender, $from, $to, $subject, $message, $html=false) {
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->hostname = $this->config->get('config_smtp_host');
		$mail->username = $this->config->get('config_smtp_username');
		$mail->password = $this->config->get('config_smtp_password');
		$mail->port = $this->config->get('config_smtp_port');
		$mail->timeout = $this->config->get('config_smtp_timeout');
		$mail->setTo($to);
  		$mail->setFrom($from);
  		$mail->setSender($sender);
  		$mail->setSubject($subject);
  		if ($html) {
  			$mail->setHtml($message);
  		} else {
  			$mail->setText($message);
  		}
      	$mail->send();
	}
	
	protected function listFiles($dir) {
		if (is_dir(DIR_TEMPLATE . $this->config->get('config_template') . $dir)) {
			$list_files = array();
			$files = $this->_listFiles(DIR_TEMPLATE . $this->config->get('config_template') . $dir);
			foreach ($files as $file) {
				if (is_file($file)) {
					$fileInfo = pathinfo($file);
					$file_name = $fileInfo['filename'];
					$extension = $fileInfo['extension'];
					$title = str_replace(array("-"), array(" "), $file_name);
					$list_files[] = array('title' => $title,
						'file_path' => RESOURCE_PATH . $dir . '/' . $file_name . "." . $extension);
				}
			}
			return $list_files;
		} else {
			return array();
		}
	}
	
	private function _listFiles($path) {
        
        $files = array();
        
        $path = rtrim($path, '/').'/';  
        if (is_readable($path)) {
            $items = (array) glob($path.'*');

            foreach ($items as $index => $item) {
                $files[] = str_replace('\\', '/', $item);
            }
        }
        return $files;       
    }
}
?>