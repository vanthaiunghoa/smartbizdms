<?php
class ModelCatalogCompany extends Model {
	public function addCompany($data) {

		if(isset($data['sort_order']) && !empty($data['sort_order'])) $sort_order = $data['sort_order'];
		else $sort_order = 0;
		$sql = "INSERT INTO " . DB_PREFIX . "company SET sort_order = '" . (int)$sort_order . "',  date_added = NOW()";
      	if(!empty($data['small_image'])) {
			$sql .=", small_image = '" . $this->db->escape($data['small_image']) . "'";
		}
		
		if(!empty($data['big_image'])) {
			$sql .=", big_image = '" . $this->db->escape($data['big_image']) . "'";
		}
		
		$this->db->query($sql);

      	$company_id = $this->db->getLastId(); 
		
      	foreach ($data['company_description'] as $language_id => $value) {
        	$this->db->query("INSERT INTO " . DB_PREFIX . "company_description SET company_id = '" . (int)$company_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', position = '" . $this->db->escape($value['position']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
		if (isset($data['company_image'])) {
			foreach ($data['company_image'] as $image) {
				if(empty($image['image'])) {
					return;
				}
				$sql = "INSERT INTO " . DB_PREFIX . "company_image SET company_id = '" . (int)$company_id . "' ";
				if(!empty($image['image'])) {
					$sql .= ", image = '" . $this->db->escape($image['image']) . "'";
				}
				$this->db->query($sql);
			}
		}
	}
	
	public function editCompany($company_id, $data) {
        $query = $this->db->query("SELECT small_image, big_image from " . DB_PREFIX . "company WHERE company_id = '" . (int)$company_id . "'");
        
        $old_small_image = $query->row['small_image'];
		$old_big_image = $query->row['big_image'];
		
		if(isset($data['sort_order']) && !empty($data['sort_order'])) $sort_order = $data['sort_order'];
		else $sort_order = 0;
        
		$sql = "UPDATE " . DB_PREFIX . "company SET sort_order = '" . (int)$sort_order . "' ";
      	if(!empty($data['small_image'])) {
			$sql .=", small_image = '" . $this->db->escape($data['small_image']) . "' ";
		}
		
		if(!empty($data['big_image'])) {
			$sql .=", big_image = '" . $this->db->escape($data['big_image']) . "'";
		}

		$sql .= " WHERE company_id = '" . (int)$company_id . "'";
		
		$this->db->query($sql);
      	
      	$this->db->query("DELETE FROM " . DB_PREFIX . "company_description WHERE company_id = '" . (int)$company_id . "'");

      	foreach ($data['company_description'] as $language_id => $value) {
        	$this->db->query("INSERT INTO " . DB_PREFIX . "company_description SET company_id = '" . (int)$company_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', position = '" . $this->db->escape($value['position']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "company_image WHERE company_id = '" . (int)$company_id . "'");
		
		if (isset($data['company_image'])) {
			foreach ($data['company_image'] as $image) {
				if(empty($image['image'])) {
					return;
				}
				$sql = "INSERT INTO " . DB_PREFIX . "company_image SET company_id = '" . (int)$company_id . "' ";
				if(!empty($image['image'])) {
					$sql .= ", image = '" . $this->db->escape($image['image']) . "'";
				}
				$this->db->query($sql);
			}
		}
	}
	
	public function deleteCompany($company_id) {
      	$this->db->query("DELETE FROM " . DB_PREFIX . "company WHERE company_id = '" . (int)$company_id . "'");
	  	$this->db->query("DELETE FROM " . DB_PREFIX . "company_description WHERE company_id = '" . (int)$company_id . "'");	
	}	

	public function getCompany($company_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "company WHERE company_id = '" . (int)$company_id . "'");
		
		return $query->row;
	}

	public function getCompanies($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "company c LEFT JOIN " . DB_PREFIX . "company_description cd ON (c.company_id = cd.company_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'cd.name',
			'c.sort_order',
			'cd.position',
		);
	
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY cd.name";	
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
	}
	
	public function getCompanyDescriptions($company_id) {
		$company_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "company_description WHERE company_id = '" . (int)$company_id . "'");
		
		foreach ($query->rows as $result) {
			$company_description_data[$result['language_id']] = array('name' => $result['name'],'position' => $result['position'],'description' => $result['description']);
		}
		
		return $company_description_data;
	}
	
	public function getCompanyImages($company_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "company_image WHERE company_id = '" . (int)$company_id . "'");
		
		return $query->rows;
	}
	
	public function getTotalCompanies() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "company");
		
		return $query->row['total'];
	}	
}
?>