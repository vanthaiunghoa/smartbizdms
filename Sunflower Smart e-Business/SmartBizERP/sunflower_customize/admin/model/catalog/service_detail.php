<?php
class ModelCatalogServiceDetail extends Model {
	public function addServiceDetail($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "service_detail SET sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		
		$service_detail_id = $this->db->getLastId();
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service_detail SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service_detail SET image = '" . $this->db->escape($data['image']) . "' WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service_detail SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		}
		
		foreach ($data['service_detail_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "service_detail_description SET service_detail_id = '" . (int)$service_detail_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['services'])) {
			foreach ($data['services'] as $service_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "service_detail_to_service SET service_detail_id = '" . (int)$service_detail_id . "', service_id = '" . (int)$service_id . "'");
			}
		}
		
		$this->cache->delete('service_detail');
	}
	
	public function editServiceDetail($service_detail_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "service_detail SET sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service_detail SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service_detail SET image = '" . $this->db->escape($data['image']) . "' WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "service_detail SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "service_detail_description WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		
		foreach ($data['service_detail_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "service_detail_description SET service_detail_id = '" . (int)$service_detail_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		$this->cache->delete('service_detail');
	}
	
	public function copyServiceDetail($service_detail_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "service_detail p LEFT JOIN " . DB_PREFIX . "service_detail_description pd ON (p.service_detail_id = pd.service_detail_id) WHERE p.service_detail_id = '" . (int)$service_detail_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		if ($query->num_rows) {
			$data = array();
			
			$data = $query->row;
			$data = array_merge($data, array('service_detail_description' => $this->getServiceDetailDescriptions($service_detail_id)));			
			$this->addServiceDetail($data);
		}
	}
	
	public function deleteServiceDetail($service_detail_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "service_detail WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "service_detail_description WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'service_detail_id=" . (int)$service_detail_id. "'");
		
		$this->cache->delete('service_detail');
	}
	public function getServiceDetailService($service_detail_id) {
		$service_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "service_detail_to_service WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		
		foreach ($query->rows as $result) {
			$service_data[] = $result['service_id'];
		}

		return $service_data;
	}
	public function getServiceDetail($service_detail_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'service_detail_id=" . (int)$service_detail_id . "') AS keyword FROM " . DB_PREFIX . "service_detail p LEFT JOIN " . DB_PREFIX . "service_detail_description pd ON (p.service_detail_id = pd.service_detail_id) WHERE p.service_detail_id = '" . (int)$service_detail_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
		return $query->row;
	}
	
	public function getServiceDetails($data = array()) {
		if ($data) {
			// Add 
			$sql = "SELECT s.*,sd.* FROM " . DB_PREFIX . "service_detail s LEFT JOIN " . DB_PREFIX . "service_detail_description sd ON (s.service_detail_id = sd.service_detail_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
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
			$service_detail_data = $this->cache->get('service_detail.' . $this->config->get('config_language_id'));
		
			if (!$service_detail_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "service_detail s LEFT JOIN " . DB_PREFIX . "service_detail_description sd ON (s.service_detail_id = sd.service_detail_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sd.name ASC");
	
				$service_detail_data = $query->rows;
			
				$this->cache->set('service_detail.' . $this->config->get('config_language_id'), $service_detail_data);
			}	
	
			return $service_detail_data;
		}
	}
	
	public function getServiceDetailDescriptions($service_detail_id) {
		$service_detail_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "service_detail_description WHERE service_detail_id = '" . (int)$service_detail_id . "'");
		
		foreach ($query->rows as $result) {
			$service_detail_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description']
			);
		}
		
		return $service_detail_description_data;
	}
	public function getTotalServiceDetails($data = array()) {
		
		// Add
		$sql = "SELECT count(distinct s.service_detail_id) AS total FROM " . DB_PREFIX . "service_detail s 
                LEFT JOIN " . DB_PREFIX . "service_detail_description sd ON (s.service_detail_id = sd.service_detail_id) 
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