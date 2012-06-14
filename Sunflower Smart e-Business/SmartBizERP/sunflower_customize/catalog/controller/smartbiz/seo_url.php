<?php
class ControllerSmartBizSeoUrl extends SmartBizController {
	public function index() {
		if (isset($this->request->get['_route_'])) {			$parts = explode('/', $this->request->get['_route_']);			if (isset($parts[0])) {				if ($parts[0] == 'home') {					$this->request->get['route'] = 'smartbiz/home';				} else if ($parts[0] == 'demo') {					$this->request->get['route'] = 'smartbiz/demo';					if (isset($parts[1])) {						$this->request->get['product_type'] = $parts[1];					}				} else if ($parts[0] == 'about') {					$this->request->get['route'] = 'smartbiz/about';				} else if ($parts[0] == 'contact') {					$this->request->get['route'] = 'smartbiz/contact';				} else if ($parts[0] == 'solution') {					$this->request->get['route'] = 'smartbiz/product';					if (isset($parts[1])) {						$this->request->get['product_type'] = $parts[1];					}				} else if ($parts[0] == 'news') {					$this->request->get['route'] = 'smartbiz/news';					if (isset($parts[1])) {						$this->request->get['news_id'] = $parts[1];					}				} else if($parts[0] == 'downloads') {					$this->request->get['route'] = 'smartbiz/download';				} else if ($parts[0] == 'service') {					$this->request->get['route'] = 'smartbiz/service';					if (isset($parts[1])) {						$this->request->get['product_type'] = $parts[1];					}				} else if ($parts[0] == 'vision') {					$this->request->get['route'] = 'smartbiz/vision';				} else if ($parts[0] == 'culture') {					$this->request->get['route'] = 'smartbiz/culture';				} else if ($parts[0] == 'language') {					$this->request->get['route'] = 'smartbiz/language';					if (isset($parts[1])) {						$this->request->get['lang'] = $parts[1];					}				}  else if ($parts[0] == 'login') {					$this->request->get['route'] = 'smartbiz/login';				} else if ($parts[0] == 'proposal') {					$this->request->get['route'] = 'smartbiz/request_proposal';				} else if ($parts[0] == 'searchgoogle') {					$this->request->get['route'] = 'smartbiz/searchgoogle';				} 				else if ($parts[0] == 'sitemap') {					$this->request->get['route'] = 'smartbiz/sitemap';				} 				else if ($parts[0] == 'terms-of-use') {					$this->request->get['route'] = 'smartbiz/use';				} 				else if ($parts[0] == 'privacy-statement') {					$this->request->get['route'] = 'smartbiz/statement';				}else if ($parts[0] == 'quick-link') {					$this->request->get['route'] = 'smartbiz/quicklink';				} else {					$this->request->get['route'] = 'smartbiz/error';				}			} else {				foreach ($parts as $part) {					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");					if ($query->num_rows) {						$url = explode('&', $query->row['query']);						foreach ($url as $k=>$v){							$u = explode('=',$v);							if ($u[0] == 'product_id') {								$this->request->get['product_id'] = $u[1];							}
							if ($u[0] == 'category_id') {								if (!isset($this->request->get['path'])) {									$this->request->get['path'] = $u[1];								} else {									$this->request->get['path'] .= '_' . $u[1];								}							}
							if ($u[0] == 'manufacturer_id') {								$this->request->get['manufacturer_id'] = $u[1];							}
							if ($u[0] == 'information_id') {								$this->request->get['information_id'] = $u[1];							}						}					} else {						$this->request->get['route'] = 'smartbiz/error';					}				}			}
			if (isset($this->request->get['product_id'])) {				$this->request->get['route'] = 'product/product';			} elseif (isset($this->request->get['path'])) {				$this->request->get['route'] = 'product/category';			} elseif (isset($this->request->get['manufacturer_id'])) {				$this->request->get['route'] = 'product/manufacturer';			} elseif (isset($this->request->get['information_id'])) {				$this->request->get['route'] = 'information/information';			}
			if (isset($this->request->get['route'])) {				return $this->forward($this->request->get['route']);			}		}	}}?>