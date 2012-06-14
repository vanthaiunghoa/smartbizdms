<?php
class ModelCatalogService extends Model {
	public function addService($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "service SET sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		
		$service_id = $this->db->getLastId();
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE service_id = '" . (int)$service_id . "'");
		}
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service SET image = '" . $this->db->escape($data['image']) . "' WHERE service_id = '" . (int)$service_id . "'");
		}
		if (isset($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE service_id = '" . (int)$service_id . "'");
		}
		
		foreach ($data['service_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "service_description SET service_id = '" . (int)$service_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		
		$this->cache->delete('service');
	}
	
	public function editService($service_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "service SET sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE service_id = '" . (int)$service_id . "'");

		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE service_id = '" . (int)$service_id . "'");
		}
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service SET image = '" . $this->db->escape($data['image']) . "' WHERE service_id = '" . (int)$service_id . "'");
		}
		if (isset($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE service_id = '" . (int)$service_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "service_description WHERE service_id = '" . (int)$service_id . "'");
		
		foreach ($data['service_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "service_description SET service_id = '" . (int)$service_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->cache->delete('service');
	}
	
	public function copyService($service_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "service p LEFT JOIN " . DB_PREFIX . "service_description pd ON (p.service_id = pd.service_id) WHERE p.service_id = '" . (int)$service_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		if ($query->num_rows) {
			$data = array();
			
			$data = $query->row;
			$data = array_merge($data, array('service_description' => $this->getServiceDescriptions($service_id)));			
			$this->addService($data);
		}
	}
	
	public function deleteService($service_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "service WHERE service_id = '" . (int)$service_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "service_description WHERE service_id = '" . (int)$service_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'service_id=" . (int)$service_id. "'");
		
		$this->cache->delete('service');
	}
	
	public function getService($service_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'service_id=" . (int)$service_id . "') AS keyword FROM " . DB_PREFIX . "service p LEFT JOIN " . DB_PREFIX . "service_description pd ON (p.service_id = pd.service_id) WHERE p.service_id = '" . (int)$service_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
		return $query->row;
	}
	public function getAllServices() {
		$sql = "SELECT s.*,sd.* FROM " . DB_PREFIX . "service s LEFT JOIN " . DB_PREFIX . "service_description sd ON (s.service_id = sd.service_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	public function getServices($data = array()) {
		if ($data) {
			// Add 
			$sql = "SELECT s.*,sd.* FROM " . DB_PREFIX . "service s LEFT JOIN " . DB_PREFIX . "service_description sd ON (s.service_id = sd.service_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
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
			$service_data = $this->cache->get('service.' . $this->config->get('config_language_id'));
		
			if (!$service_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "service s LEFT JOIN " . DB_PREFIX . "service_description sd ON (s.service_id = sd.service_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sd.name ASC");
	
				$service_data = $query->rows;
			
				$this->cache->set('service.' . $this->config->get('config_language_id'), $service_data);
			}	
	
			return $service_data;
		}
	}
	
	public function getServiceDescriptions($service_id) {
		$service_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "service_description WHERE service_id = '" . (int)$service_id . "'");
		
		foreach ($query->rows as $result) {
			$service_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description']
			);
		}
		
		return $service_description_data;
	}
	public function getTotalServices($data = array()) {
		
		// Add
		$sql = "SELECT count(distinct s.service_id) AS total FROM " . DB_PREFIX . "service s 
                LEFT JOIN " . DB_PREFIX . "service_description sd ON (s.service_id = sd.service_id) 
                WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		// End add
		
		if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
			$sql .= " AND LCASE(sd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
		}

		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	public function getServiceSpecials($service_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "service_special WHERE service_id = '" . (int)$service_id . "' ORDER BY priority, price");
		
		return $query->rows;
	}
}
?>