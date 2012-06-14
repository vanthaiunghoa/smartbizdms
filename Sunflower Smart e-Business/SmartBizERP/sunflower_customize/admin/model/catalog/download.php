<?php
class ModelCatalogDownload extends Model {
	public function addDownload($data) {
		if(isset($data['download_allowed'])) $download_allowed = $data['download_allowed'];
		else $download_allowed = 0;
		if(isset($data['sort_order']) && !empty($data['sort_order'])) $sort_order = $data['sort_order'];
		else $sort_order = 0;
		
      	$this->db->query("INSERT INTO " . DB_PREFIX . "download SET download_allowed = '" . (int)$download_allowed . "', sort_order = '" . (int)$sort_order . "', date_added = NOW()");

      	$download_id = $this->db->getLastId(); 
		
		if (isset($data['download_store'])) {
			foreach ($data['download_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "download_to_store SET download_id = '" . (int)$download_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		if (isset($data['download_category'])) {
			foreach ($data['download_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "download_to_download_category SET download_id = '" . (int)$download_id . "', download_category_id = '" . (int)$category_id . "'");
			}
		}
		
      	if (isset($data['download'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "download SET filename = '" . $this->db->escape($data['download']) . "', mask = '" . $this->db->escape($data['mask']) . "' WHERE download_id = '" . (int)$download_id . "'");
      	}
		
		if (isset($data['movie'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "download SET movie = '" . $this->db->escape($data['movie']) . "' WHERE download_id = '" . (int)$download_id . "'");
      	}

      	foreach ($data['download_description'] as $language_id => $value) {
        	$this->db->query("INSERT INTO " . DB_PREFIX . "download_description SET download_id = '" . (int)$download_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
		if (isset($data['download_image'])) {
			foreach ($data['download_image'] as $image) {
				if(empty($image['image'])) {
					return;
				}
				$sql = "INSERT INTO " . DB_PREFIX . "download_image SET download_id = '" . (int)$download_id . "' ";
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
	
	public function editDownload($download_id, $data) {
        $query = $this->db->query("SELECT filename, movie from " . DB_PREFIX . "download WHERE download_id = '" . (int)$download_id . "'");
        
        $old_filename = $query->row['filename'];
		$old_movie = $query->row['movie'];
		
		if(isset($data['download_allowed'])) $download_allowed = $data['download_allowed'];
		else $download_allowed = 0;
		
		if(isset($data['sort_order']) && !empty($data['sort_order'])) $sort_order = $data['sort_order'];
		else $sort_order = 0;
        
        $this->db->query("UPDATE " . DB_PREFIX . "download SET download_allowed = '" . (int)$download_allowed . "', sort_order = '" . (int)$sort_order . "' WHERE download_id = '" . (int)$download_id . "'");
      	
		if (isset($data['download'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "download SET filename = '" . $this->db->escape($data['download']) . "', mask = '" . $this->db->escape($data['mask']) . "' WHERE download_id = '" . (int)$download_id . "'");
        	
        	/*if (isset($data['update'])) {
      			$query = $this->db->query("SELECT * from " . DB_PREFIX . "download WHERE download_id = '" . (int)$download_id . "'");
	                
      			$this->db->query("UPDATE " . DB_PREFIX . "order_download SET download_allowed = '" . (int)$query->row['download_allowed'] . "', `filename` = '" . $this->db->escape($query->row['filename']) . "', mask = '" . $this->db->escape($query->row['mask']) . "' WHERE `filename` = '" . $this->db->escape($old_filename) . "'");
      		}*/
      	
      	}
		
		if (isset($data['movie'])) {
        	$this->db->query("UPDATE " . DB_PREFIX . "download SET movie = '" . $this->db->escape($data['movie']) . "', mask = '" . $this->db->escape($data['mask']) . "' WHERE download_id = '" . (int)$download_id . "'");
        	
        	/*if (isset($data['update'])) {
      			$query = $this->db->query("SELECT * from " . DB_PREFIX . "download WHERE download_id = '" . (int)$download_id . "'");
	                
      			$this->db->query("UPDATE " . DB_PREFIX . "order_download SET download_allowed = '" . (int)$query->row['download_allowed'] . "', `filename` = '" . $this->db->escape($query->row['filename']) . "', mask = '" . $this->db->escape($query->row['mask']) . "' WHERE `filename` = '" . $this->db->escape($old_filename) . "'");
      		}*/
      	
      	}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_to_store WHERE download_id = '" . (int)$download_id . "'");
		
		if (isset($data['download_store'])) {
			foreach ($data['download_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "download_to_store SET download_id = '" . (int)$download_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_to_download_category WHERE download_id = '" . (int)$download_id . "'");
		
		if (isset($data['download_category'])) {
			foreach ($data['download_category'] as $download_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "download_to_download_category SET download_id = '" . (int)$download_id . "', download_category_id = '" . (int)$download_category_id . "'");
			}
		}

      	$this->db->query("DELETE FROM " . DB_PREFIX . "download_description WHERE download_id = '" . (int)$download_id . "'");

      	foreach ($data['download_description'] as $language_id => $value) {
        	$this->db->query("INSERT INTO " . DB_PREFIX . "download_description SET download_id = '" . (int)$download_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_image WHERE download_id = '" . (int)$download_id . "'");
		
		if (isset($data['download_image'])) {
			foreach ($data['download_image'] as $image) {
				if(empty($image['image'])) {
					return;
				}
				$sql = "INSERT INTO " . DB_PREFIX . "download_image SET download_id = '" . (int)$download_id . "' ";
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
	
	public function deleteDownload($download_id) {
      	$this->db->query("DELETE FROM " . DB_PREFIX . "download WHERE download_id = '" . (int)$download_id . "'");
	  	$this->db->query("DELETE FROM " . DB_PREFIX . "download_description WHERE download_id = '" . (int)$download_id . "'");	
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_image WHERE download_id = '" . (int)$download_id . "'");
	  	$this->db->query("DELETE FROM " . DB_PREFIX . "download_to_download_category WHERE download_id = '" . (int)$download_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_to_store WHERE download_id = '" . (int)$download_id . "'");
	}	

	public function getDownload($download_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "download WHERE download_id = '" . (int)$download_id . "'");
		
		return $query->row;
	}

	public function getDownloads($data = array()) {
		$sql = "SELECT DISTINCT d.*,dd.*, dcd.name category_name FROM " . 
		DB_PREFIX . "download_to_download_category ddc, " . 
		DB_PREFIX . "download_category dc, " . 
		DB_PREFIX . "download_category_description dcd, ".
		DB_PREFIX . "download d LEFT JOIN " . 
		DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) " . 
		" WHERE dc.download_category_id = dcd.download_category_id AND d.download_id = ddc.download_id AND dc.download_category_id = ddc.download_category_id AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
	
	public function getDownloadDescriptions($download_id) {
		$download_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_description WHERE download_id = '" . (int)$download_id . "'");
		
		foreach ($query->rows as $result) {
			$download_description_data[$result['language_id']] = array('name' => $result['name'],'description' => $result['description']);
		}
		
		return $download_description_data;
	}
	
	public function getDownloadImages($download_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_image WHERE download_id = '" . (int)$download_id . "'");
		
		return $query->rows;
	}
	
	public function getDownloadStores($download_id) {
		$download_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_to_store WHERE download_id = '" . (int)$download_id . "'");

		foreach ($query->rows as $result) {
			$download_store_data[] = $result['store_id'];
		}
		
		return $download_store_data;
	}
	
	public function getDownloadDownloadCategories($download_id) {
		$download_category_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_to_download_category WHERE download_id = '" . (int)$download_id . "'");
		
		foreach ($query->rows as $result) {
			$download_category_data[] = $result['download_category_id'];
		}

		return $download_category_data;
	}
	
	public function getTotalDownloads() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "download");
		
		return $query->row['total'];
	}	
}
?>