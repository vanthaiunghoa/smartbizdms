<?php
class ModelCatalogDemo extends Model {
	public function addDemo($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "demo SET sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		
		$demo_id = $this->db->getLastId();
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "demo SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE demo_id = '" . (int)$demo_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "demo SET image = '" . $this->db->escape($data['image']) . "' WHERE demo_id = '" . (int)$demo_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "demo SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE demo_id = '" . (int)$demo_id . "'");
		}
		
		foreach ($data['demo_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "demo_description SET demo_id = '" . (int)$demo_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		//$demo_link_id = $this->getLastDemoLinkId();
		
		if(!empty($data['links'])) {
			foreach ($data['links'] as  $values) {
				foreach($values as $language_id=>$value) {
					if(strpos($value['url'],' ') !== false) {
						$value['url'] = str_replace(' ','',$value['url']);
					}
					if(strpos($value['url'],'http://') === false && strpos($value['url'],'https://') === false) {
						$url = 'http://' . $value['url'];
					} else {
						$url = $value['url'];
					}
					$this->db->query("INSERT INTO " . DB_PREFIX . "demo_link SET demo_id = '" . (int)$demo_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', url = '" . $this->db->escape($url) . "'");
				}
			}
		}
		
		$this->cache->delete('demo');
	}
	public function getLastDemoLinkId() {
		$demo_link_id = 0;
		$sql = "SELECT demo_link_id FROM " . DB_PREFIX . "demo_link ORDER BY demo_link_id DESC LIMIT 1,1 ";
		$query = $this->db->query($sql);
		$demo_link_id = $query->rows['demo_link_id'];
		
		return ($demo_link_id+1);
	}
	public function editDemo($demo_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "demo SET sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE demo_id = '" . (int)$demo_id . "'");
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "demo SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE demo_id = '" . (int)$demo_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "demo SET image = '" . $this->db->escape($data['image']) . "' WHERE demo_id = '" . (int)$demo_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "demo SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE demo_id = '" . (int)$demo_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "demo_description WHERE demo_id = '" . (int)$demo_id . "'");
		
		foreach ($data['demo_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "demo_description SET demo_id = '" . (int)$demo_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "demo_link WHERE demo_id = '" . (int)$demo_id . "'");
		
		if(!empty($data['links'])) {
			foreach ($data['links'] as $language_id => $values) {
				foreach($values as $language_id=>$value) {
					if(strpos($value['url'],' ') !== false) {
						$value['url'] = str_replace(' ','',$value['url']);
					}
					if(strpos($value['url'],'http://') === false && strpos($value['url'],'https://') === false) {
						$url = 'http://' . $value['url'];
					} else {
						$url = $value['url'];
					}
					$this->db->query("INSERT INTO " . DB_PREFIX . "demo_link SET demo_id = '" . (int)$demo_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', url = '" . $this->db->escape($url) . "'");
				}
			}
		}
		
		$this->cache->delete('demo');
	}
	
	public function copyDemo($demo_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "demo p LEFT JOIN " . DB_PREFIX . "demo_description pd ON (p.demo_id = pd.demo_id) WHERE p.demo_id = '" . (int)$demo_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		if ($query->num_rows) {
			$data = array();
			$links = array();
			$links['links'] = $this->getDemoLinks($demo_id);
			$data = $query->row;
			$data = array_merge($data, array('demo_description' => $this->getDemoDescriptions($demo_id)));
			$data = array_merge($data, $links);
			$this->addDemo($data);
		}
	}
	
	public function deleteDemo($demo_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "demo WHERE demo_id = '" . (int)$demo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "demo_description WHERE demo_id = '" . (int)$demo_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'demo_id=" . (int)$demo_id. "'");
		
		$this->cache->delete('demo');
	}
	
	public function getDemo($demo_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'demo_id=" . (int)$demo_id . "') AS keyword FROM " . DB_PREFIX . "demo p LEFT JOIN " . DB_PREFIX . "demo_description pd ON (p.demo_id = pd.demo_id) WHERE p.demo_id = '" . (int)$demo_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}
	
	public function getDemos($data = array()) {
		if ($data) {
			// Add 
			$sql = "SELECT s.*,sd.* FROM " . DB_PREFIX . "demo s LEFT JOIN " . DB_PREFIX . "demo_description sd ON (s.demo_id = sd.demo_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
			// End add
			
			if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
				$sql .= " AND LCASE(sd.name) LIKE '" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
			}
			
			$sort_data = array(
				'sd.name',
				's.sort_order'
			);	
			
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY sd.name";
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
			
			$query = $this->db->query($sql);
		
			return $query->rows;
		} else {
			$demo_data = $this->cache->get('demo.' . $this->config->get('config_language_id'));
		
			if (!$demo_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "demo s LEFT JOIN " . DB_PREFIX . "demo_description sd ON (s.demo_id = sd.demo_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sd.name ASC");
	
				$demo_data = $query->rows;
			
				$this->cache->set('demo.' . $this->config->get('config_language_id'), $demo_data);
			}	
	
			return $demo_data;
		}
	}
	
	public function getDemoDescriptions($demo_id) {
		$demo_description_data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "demo_description WHERE demo_id = '" . (int)$demo_id . "'";
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			foreach($result as $key=>$val) {
				$demo_description_data[$result['language_id']][$key] = $val;
			}
		}
		
		return $demo_description_data;
	}
	
	public function getDemoLinks($demo_id) {
		$demo_link_data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "demo_link WHERE demo_id = '" . (int)$demo_id . "'";
		echo $sql;
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$demo_link_data[][$result['language_id']] = $result;
		}
		return $demo_link_data;
	}
	
	public function getTotalDemos($data = array()) {
		
		// Add
		$sql = "SELECT count(distinct s.demo_id) AS total FROM " . DB_PREFIX . "demo s 
                LEFT JOIN " . DB_PREFIX . "demo_description sd ON (s.demo_id = sd.demo_id) 
                WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		// End add
		
		if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
			$sql .= " AND LCASE(sd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
		}

		$query = $this->db->query($sql);
		return $query->row['total'];
	}
	
}
?>