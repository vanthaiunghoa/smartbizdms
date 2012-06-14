<?php
class ModelCatalogSolution extends Model {
	public function addSolution($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "solution SET price = '" . (float)$data['price'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		
		$solution_id = $this->db->getLastId();
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE solution_id = '" . (int)$solution_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution SET image = '" . $this->db->escape($data['image']) . "' WHERE solution_id = '" . (int)$solution_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE solution_id = '" . (int)$solution_id . "'");
		}
		
		foreach ($data['solution_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "solution_description SET solution_id = '" . (int)$solution_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['solution_special'])) {
			foreach ($data['solution_special'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "solution_special SET solution_id = '" . (int)$solution_id . "', customer_group_id = '" . (int)$value['customer_group_id'] . "', priority = '" . (int)$value['priority'] . "', special_price = '" . (float)$value['price'] . "', date_start = '" . $this->db->escape($value['date_start']) . "', date_end = '" . $this->db->escape($value['date_end']) . "'");
			}
		}
		
		$this->cache->delete('solution');
	}
	
	public function editSolution($solution_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "solution SET price = '" . (float)$data['price'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE solution_id = '" . (int)$solution_id . "'");
		
		if (isset($data['image_icon']) && !empty($data['image_icon'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution SET image_icon = '" . $this->db->escape($data['image_icon']) . "' WHERE solution_id = '" . (int)$solution_id . "'");
		}
		if (isset($data['image']) && !empty($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution SET image = '" . $this->db->escape($data['image']) . "' WHERE solution_id = '" . (int)$solution_id . "'");
		}
		if (isset($data['image_preview']) && !empty($data['image_preview'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "solution SET image_preview = '" . $this->db->escape($data['image_preview']) . "' WHERE solution_id = '" . (int)$solution_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution_description WHERE solution_id = '" . (int)$solution_id . "'");
		
		foreach ($data['solution_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "solution_description SET solution_id = '" . (int)$solution_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution_special WHERE solution_id = '" . (int)$solution_id . "'");
		
		if (isset($data['solution_special'])) {
			foreach ($data['solution_special'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "solution_special SET solution_id = '" . (int)$solution_id . "', customer_group_id = '" . (int)$value['customer_group_id'] . "', priority = '" . (int)$value['priority'] . "', special_price = '" . (float)$value['price'] . "', date_start = '" . $this->db->escape($value['date_start']) . "', date_end = '" . $this->db->escape($value['date_end']) . "'");
			}
		}
		
		$this->cache->delete('solution');
	}
	
	public function copySolution($solution_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "solution p LEFT JOIN " . DB_PREFIX . "solution_description pd ON (p.solution_id = pd.solution_id) WHERE p.solution_id = '" . (int)$solution_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		if ($query->num_rows) {
			$data = array();
			
			$data = $query->row;
			$data = array_merge($data, array('solution_description' => $this->getSolutionDescriptions($solution_id)));			
			$data = array_merge($data, array('solution_special' => $this->getSolutionSpecials($solution_id)));
			$this->addSolution($data);
		}
	}
	
	public function deleteSolution($solution_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution WHERE solution_id = '" . (int)$solution_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution_description WHERE solution_id = '" . (int)$solution_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "solution_special WHERE solution_id = '" . (int)$solution_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'solution_id=" . (int)$solution_id. "'");
		
		$this->cache->delete('solution');
	}
	
	public function getSolution($solution_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'solution_id=" . (int)$solution_id . "') AS keyword FROM " . DB_PREFIX . "solution p LEFT JOIN " . DB_PREFIX . "solution_description pd ON (p.solution_id = pd.solution_id) WHERE p.solution_id = '" . (int)$solution_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
		return $query->row;
	}
	public function getAllSolutions() {
		$sql = "SELECT s.*,sd.* FROM " . DB_PREFIX . "solution s LEFT JOIN " . DB_PREFIX . "solution_description sd ON (s.solution_id = sd.solution_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	public function getSolutions($data = array()) {
		if ($data) {
			// Add 
			$sql = "SELECT s.*,sd.* FROM " . DB_PREFIX . "solution s LEFT JOIN " . DB_PREFIX . "solution_description sd ON (s.solution_id = sd.solution_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "'" ;
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
			$solution_data = $this->cache->get('solution.' . $this->config->get('config_language_id'));
		
			if (!$solution_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "solution s LEFT JOIN " . DB_PREFIX . "solution_description sd ON (s.solution_id = sd.solution_id) WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sd.name ASC");
	
				$solution_data = $query->rows;
			
				$this->cache->set('solution.' . $this->config->get('config_language_id'), $solution_data);
			}	
	
			return $solution_data;
		}
	}
	
	public function getSolutionDescriptions($solution_id) {
		$solution_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "solution_description WHERE solution_id = '" . (int)$solution_id . "'");
		
		foreach ($query->rows as $result) {
			$solution_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description']
			);
		}
		return $solution_description_data;
	}
	public function getTotalSolutions($data = array()) {
		
		// Add
		$sql = "SELECT count(distinct s.solution_id) AS total FROM " . DB_PREFIX . "solution s 
                LEFT JOIN " . DB_PREFIX . "solution_description sd ON (s.solution_id = sd.solution_id) 
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
	public function getSolutionSpecials($solution_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "solution_special WHERE solution_id = '" . (int)$solution_id . "' ORDER BY priority, special_price");
		
		return $query->rows;
	}
}
?>