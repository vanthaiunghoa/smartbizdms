<?php
class ModelCatalogDownloadCategory extends Model {
	public function addDownloadCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "download_category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");
	
		$download_category_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "download_category SET image = '" . $this->db->escape($data['image']) . "' WHERE download_category_id = '" . (int)$download_category_id . "'");
		}
		
		foreach ($data['download_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "download_category_description SET download_category_id = '" . (int)$download_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['download_category_store'])) {
			foreach ($data['download_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "download_category_to_store SET download_category_id = '" . (int)$download_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'download_category_id=" . (int)$download_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('download_category');
	}
	
	public function editDownloadCategory($download_category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "download_category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE download_category_id = '" . (int)$download_category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "download_category SET image = '" . $this->db->escape($data['image']) . "' WHERE download_category_id = '" . (int)$download_category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "download_category_description WHERE download_category_id = '" . (int)$download_category_id . "'");

		foreach ($data['download_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "download_category_description SET download_category_id = '" . (int)$download_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_category_to_store WHERE download_category_id = '" . (int)$download_category_id . "'");
		
		if (isset($data['download_category_store'])) {		
			foreach ($data['download_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "download_category_to_store SET download_category_id = '" . (int)$download_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'download_category_id=" . (int)$download_category_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'download_category_id=" . (int)$download_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('download_category');
	}
	
	public function deleteDownloadCategory($download_category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_category WHERE download_category_id = '" . (int)$download_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_category_description WHERE download_category_id = '" . (int)$download_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "download_category_to_store WHERE download_category_id = '" . (int)$download_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'download_category_id=" . (int)$download_category_id . "'");
		
		$query = $this->db->query("SELECT download_category_id FROM " . DB_PREFIX . "download_category WHERE parent_id = '" . (int)$download_category_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteDownloadCategory($result['download_category_id']);
		}
		
		$this->cache->delete('download_category');
	} 

	public function getDownloadCategory($download_category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'download_category_id=" . (int)$download_category_id . "') AS keyword FROM " . DB_PREFIX . "download_category WHERE download_category_id = '" . (int)$download_category_id . "'");
		
		return $query->row;
	} 
	
	public function getDownloadCategories($parent_id) {
		$download_category_data = $this->cache->get('download_category.' . $this->config->get('config_language_id') . '.' . $parent_id);
	
		if (!$download_category_data) {
			$download_category_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_category c LEFT JOIN " . DB_PREFIX . "download_category_description cd ON (c.download_category_id = cd.download_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
			foreach ($query->rows as $result) {
				$download_category_data[] = array(
					'download_category_id' => $result['download_category_id'],
					'name'        => $this->getPath($result['download_category_id'], $this->config->get('config_language_id')),
					'status'  	  => $result['status'],
					'sort_order'  => $result['sort_order']
				);
			
				$download_category_data = array_merge($download_category_data, $this->getDownloadCategories($result['download_category_id']));
			}	
	
			$this->cache->set('download_category.' . $this->config->get('config_language_id') . '.' . $parent_id, $download_category_data);
		}
		
		return $download_category_data;
	}
	
	public function getPath($download_category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "download_category c LEFT JOIN " . DB_PREFIX . "download_category_description cd ON (c.download_category_id = cd.download_category_id) WHERE c.download_category_id = '" . (int)$download_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		$download_category_info = $query->row;
		
		if ($download_category_info['parent_id']) {
			return $this->getPath($download_category_info['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $download_category_info['name'];
		} else {
			return $download_category_info['name'];
		}
	}
	
	public function getDownloadCategoryDescriptions($download_category_id) {
		$download_category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_category_description WHERE download_category_id = '" . (int)$download_category_id . "'");
		
		foreach ($query->rows as $result) {
			$download_category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $download_category_description_data;
	}	
	
	public function getDownloadCategoryStores($download_category_id) {
		$download_category_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_category_to_store WHERE download_category_id = '" . (int)$download_category_id . "'");

		foreach ($query->rows as $result) {
			$download_category_store_data[] = $result['store_id'];
		}
		
		return $download_category_store_data;
	}

	public function getDownloadCategoryLayouts($download_category_id) {
		$download_category_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_category_to_layout WHERE download_category_id = '" . (int)$download_category_id . "'");
		
		foreach ($query->rows as $result) {
			$download_category_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $download_category_layout_data;
	}
		
	public function getTotalCategories() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "download_category");
		
		return $query->row['total'];
	}	
		
	public function getTotalCategoriesByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "download_category WHERE image_id = '" . (int)$image_id . "'");
		
		return $query->row['total'];
	}

	public function getTotalCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "download_category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}		
}
?>