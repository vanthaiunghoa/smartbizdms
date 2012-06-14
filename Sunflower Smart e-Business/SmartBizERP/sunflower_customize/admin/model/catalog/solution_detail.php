<?php
class ModelCatalogSolutionDetail extends Model {
	public function addSolutionDetail($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "solution_detail SET sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		
		$solution_detail_id = $this->db->getLastId();
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution_detail SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution_detail SET image = '" . $this->db->escape($data['image']) . "' WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution_detail SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		}
		
		foreach ($data['solution_detail_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "solution_detail_description SET solution_detail_id = '" . (int)$solution_detail_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['solution_detail_special'])) {
			foreach ($data['solution_detail_special'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "solution_detail_special SET solution_detail_id = '" . (int)$solution_detail_detail_id . "', customer_group_id = '" . (int)$value['customer_group_id'] . "', priority = '" . (int)$value['priority'] . "', price = '" . (float)$value['price'] . "', date_start = '" . $this->db->escape($value['date_start']) . "', date_end = '" . $this->db->escape($value['date_end']) . "'");
			}
		}
		
		if (isset($data['solutions'])) {
			foreach ($data['solutions'] as $solution_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "solution_detail_to_solution SET solution_detail_id = '" . (int)$solution_detail_id . "', solution_id = '" . (int)$solution_id . "'");
			}
		}
		
		$this->cache->delete('solution_detail');
	}
	
	public function editSolutionDetail($solution_detail_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "solution_detail SET sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution_detail SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution_detail SET image = '" . $this->db->escape($data['image']) . "' WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution_detail SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution_detail_description WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		
		foreach ($data['solution_detail_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "solution_detail_description SET solution_detail_id = '" . (int)$solution_detail_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->cache->delete('solution_detail');
	}
	
	public function copySolutionDetail($solution_detail_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "solution_detail p LEFT JOIN " . DB_PREFIX . "solution_detail_description pd ON (p.solution_detail_id = pd.solution_detail_id) WHERE p.solution_detail_id = '" . (int)$solution_detail_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		if ($query->num_rows) {
			$data = array();
			
			$data = $query->row;
			$data = array_merge($data, array('solution_detail_description' => $this->getSolutionDetailDescriptions($solution_detail_id)));			
			$data = array_merge($data, array('solution_detail_special' => $this->getSolutionDetailSpecials($solution_detail_id)));
			$this->addSolutionDetail($data);
		}
	}
	
	public function deleteSolutionDetail($solution_detail_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution_detail WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution_detail_description WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'solution_detail_id=" . (int)$solution_detail_id. "'");
		
		$this->cache->delete('solution_detail');
	}
	public function getSolutionDetailSolution($solution_detail_id) {
		$solution_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "solution_detail_to_solution WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		
		foreach ($query->rows as $result) {
			$solution_data[] = $result['solution_id'];
		}

		return $solution_data;
	}
	public function getSolutionDetail($solution_detail_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'solution_detail_id=" . (int)$solution_detail_id . "') AS keyword FROM " . DB_PREFIX . "solution_detail p LEFT JOIN " . DB_PREFIX . "solution_detail_description pd ON (p.solution_detail_id = pd.solution_detail_id) WHERE p.solution_detail_id = '" . (int)$solution_detail_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
		return $query->row;
	}
	
	public function getSolutionDetails($data = array()) {
		if ($data) {
			// Add 
			$sql = "SELECT s.*,sd.* FROM " . DB_PREFIX . "solution_detail s LEFT JOIN " . DB_PREFIX . "solution_detail_description sd ON (s.solution_detail_id = sd.solution_detail_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
			// End add
			
			if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
				$sql .= " AND LCASE(sd.name) LIKE '" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
			}
			
			if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
				$sql .= " AND s.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
			}
			
			$sort_data = array(
				'sd.name',
				's.price',
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
			$solution_detail_data = $this->cache->get('solution_detail.' . $this->config->get('config_language_id'));
		
			if (!$solution_detail_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "solution_detail s LEFT JOIN " . DB_PREFIX . "solution_detail_description sd ON (s.solution_detail_id = sd.solution_detail_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sd.name ASC");
	
				$solution_detail_data = $query->rows;
			
				$this->cache->set('solution_detail.' . $this->config->get('config_language_id'), $solution_detail_data);
			}	
	
			return $solution_detail_data;
		}
	}
	
	public function getSolutionDetailDescriptions($solution_detail_id) {
		$solution_detail_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "solution_detail_description WHERE solution_detail_id = '" . (int)$solution_detail_id . "'");
		
		foreach ($query->rows as $result) {
			$solution_detail_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description']
			);
		}
		
		return $solution_detail_description_data;
	}
	public function getTotalSolutionDetails($data = array()) {
		
		// Add
		$sql = "SELECT count(distinct s.solution_detail_id) AS total FROM " . DB_PREFIX . "solution_detail s 
                LEFT JOIN " . DB_PREFIX . "solution_detail_description sd ON (s.solution_detail_id = sd.solution_detail_id) 
                WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		// End add
		
		if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
			$sql .= " AND LCASE(sd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
		}

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND s.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
}
?>