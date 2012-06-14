<?php
class ModelCatalogQuickLink extends Model {
	public function addQuickLink($data) {
		
		if(isset($data['sort_order']) && !empty($data['sort_order'])) $sort_order = $data['sort_order'];
		else $sort_order = 0;
		
      	$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link SET demo_url = '" . $this->db->escape($data['demo_url']) . "',username_password = '" . $this->db->escape($data['username_password']) . "', sort_order = '" . (int)$sort_order . "', date_added = NOW()");

      	$quick_link_id = $this->db->getLastId(); 
		
		if (isset($data['quick_link_store'])) {
			foreach ($data['quick_link_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_to_store SET quick_link_id = '" . (int)$quick_link_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		if (isset($data['quick_link_category'])) {
			foreach ($data['quick_link_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_to_quick_link_category SET quick_link_id = '" . (int)$quick_link_id . "', quick_link_category_id = '" . (int)$category_id . "'");
			}
		}
		/*
      	if (isset($data['quick_link'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "quick_link SET filename = '" . $this->db->escape($data['quick_link']) . "', mask = '" . $this->db->escape($data['mask']) . "' WHERE quick_link_id = '" . (int)$quick_link_id . "'");
      	}
		
		if (isset($data['movie'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "quick_link SET movie = '" . $this->db->escape($data['movie']) . "' WHERE quick_link_id = '" . (int)$quick_link_id . "'");
      	}
		*/
      	foreach ($data['quick_link_description'] as $language_id => $value) {
        	$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_description SET quick_link_id = '" . (int)$quick_link_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
		if (isset($data['quick_link_image'])) {
			foreach ($data['quick_link_image'] as $image) {
				if(empty($image['image'])) {
					return;
				}
				$sql = "INSERT INTO " . DB_PREFIX . "quick_link_image SET quick_link_id = '" . (int)$quick_link_id . "' ";
				if(!empty($image['image'])) {
					$sql .= ", image = '" . $this->db->escape($image['image']) . "'";
				}
				if(!empty($image['image_title'])) {
					$sql .= ", image_title = '" . $this->db->escape($image['image_title'])."'";
				}
				$this->db->query($sql);
			}
		}
	}
	
	public function editQuickLink($quick_link_id, $data) {
        $query = $this->db->query("SELECT filename, movie from " . DB_PREFIX . "quick_link WHERE quick_link_id = '" . (int)$quick_link_id . "'");
        
        $old_filename = $query->row['filename'];
		$old_movie = $query->row['movie'];
		/*
		if(isset($data['download_allowed'])) $download_allowed = $data['download_allowed'];
		else $download_allowed = 0;
		*/
		if(isset($data['sort_order']) && !empty($data['sort_order'])) $sort_order = $data['sort_order'];
		else $sort_order = 0;
        
        $this->db->query("UPDATE " . DB_PREFIX . "quick_link SET demo_url = '" . $this->db->escape($data['demo_url']). "',username_password = '" . $this->db->escape($data['username_password']) . "', sort_order = '" . (int)$sort_order . "' WHERE quick_link_id = '" . (int)$quick_link_id . "'");
      	/*
		if (isset($data['quick_link'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "quick_link SET filename = '" . $this->db->escape($data['quick_link']) . "', mask = '" . $this->db->escape($data['mask']) . "' WHERE quick_link_id = '" . (int)$quick_link_id . "'");
      	}
		if (isset($data['movie'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "quick_link SET movie = '" . $this->db->escape($data['movie']) . "', mask = '" . $this->db->escape($data['mask']) . "' WHERE quick_link_id = '" . (int)$quick_link_id . "'");
      	}
		*/
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_to_store WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		
		if (isset($data['quick_link_store'])) {
			foreach ($data['quick_link_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_to_store SET quick_link_id = '" . (int)$quick_link_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_to_quick_link_category WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		
		if (isset($data['quick_link_category'])) {
			foreach ($data['quick_link_category'] as $quick_link_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_to_quick_link_category SET quick_link_id = '" . (int)$quick_link_id . "', quick_link_category_id = '" . (int)$quick_link_category_id . "'");
			}
		}

      	$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_description WHERE quick_link_id = '" . (int)$quick_link_id . "'");

      	foreach ($data['quick_link_description'] as $language_id => $value) {
        	$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_description SET quick_link_id = '" . (int)$quick_link_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_image WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		
		if (isset($data['quick_link_image'])) {
			foreach ($data['quick_link_image'] as $image) {
				if(empty($image['image'])) {
					return;
				}
				$sql = "INSERT INTO " . DB_PREFIX . "quick_link_image SET quick_link_id = '" . (int)$quick_link_id . "' ";
				if(!empty($image['image'])) {
					$sql .= ", image = '" . $this->db->escape($image['image']) . "'";
				}
				if(!empty($image['image_title'])) {
					$sql .= ", image_title = '" . $this->db->escape($image['image_title'])."'";
				}
				$this->db->query($sql);
			}
		}
	}
	
	public function deleteQuickLink($quick_link_id) {
      	$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link WHERE quick_link_id = '" . (int)$quick_link_id . "'");
	  	$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_description WHERE quick_link_id = '" . (int)$quick_link_id . "'");	
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_image WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_to_quick_link_category WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . " quick_link_to_store WHERE quick_link_id = '" . (int)$quick_link_id . "'");
	}	

	public function getQuickLink($quick_link_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "quick_link WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		
		return $query->row;
	}

	public function getQuickLinks($data = array()) {
		$sql = "SELECT DISTINCT d.*,dd.*, dcd.name category_name FROM " . 
		DB_PREFIX . "quick_link_to_quick_link_category ddc, " . 
		DB_PREFIX . "quick_link_category dc, " . 
		DB_PREFIX . "quick_link_category_description dcd, ".
		DB_PREFIX . "quick_link d LEFT JOIN " . 
		DB_PREFIX . "quick_link_description dd ON (d.quick_link_id = dd.quick_link_id) " . 
		" WHERE dc.quick_link_category_id = dcd.quick_link_category_id AND d.quick_link_id = ddc.quick_link_id AND dc.quick_link_category_id = ddc.quick_link_category_id AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'dd.name',
			'd.sort_order',
			'dcd.category_name',
			'd.sort_order',
		);
	
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY dd.name";	
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
	
	public function getQuickLinkDescriptions($quick_link_id) {
		$quick_link_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_description WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		
		foreach ($query->rows as $result) {
			$quick_link_description_data[$result['language_id']] = array('name' => $result['name'],'description' => $result['description']);
		}
		
		return $quick_link_description_data;
	}
	
	public function getQuickLinkImages($quick_link_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_image WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		
		return $query->rows;
	}
	
	public function getQuickLinkStores($quick_link_id) {
		$quick_link_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_to_store WHERE quick_link_id = '" . (int)$quick_link_id . "'");

		foreach ($query->rows as $result) {
			$quick_link_store_data[] = $result['store_id'];
		}
		
		return $quick_link_store_data;
	}
	
	public function getQuickLinkToQuickLinkCategories($quick_link_id) {
		$quick_link_category_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_to_quick_link_category WHERE quick_link_id = '" . (int)$quick_link_id . "'");
		
		foreach ($query->rows as $result) {
			$quick_link_category_data[] = $result['quick_link_category_id'];
		}

		return $quick_link_category_data;
	}
	
	public function getTotalQuickLinks() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "quick_link");
		
		return $query->row['total'];
	}	
}
?>