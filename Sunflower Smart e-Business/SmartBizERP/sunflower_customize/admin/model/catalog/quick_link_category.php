<?php
class ModelCatalogQuickLinkCategory extends Model {
	public function addQuickLinkCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");
	
		$quick_link_category_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "quick_link_category SET image = '" . $this->db->escape($data['image']) . "' WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		}
		
		foreach ($data['quick_link_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_category_description SET quick_link_category_id = '" . (int)$quick_link_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['quick_link_category_store'])) {
			foreach ($data['quick_link_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_category_to_store SET quick_link_category_id = '" . (int)$quick_link_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'quick_link_category_id=" . (int)$quick_link_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('quick_link_category');
	}
	
	public function editQuickLinkCategory($quick_link_category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "quick_link_category SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "quick_link_category SET image = '" . $this->db->escape($data['image']) . "' WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_category_description WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");

		foreach ($data['quick_link_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_category_description SET quick_link_category_id = '" . (int)$quick_link_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_category_to_store WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		
		if (isset($data['quick_link_category_store'])) {		
			foreach ($data['quick_link_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "quick_link_category_to_store SET quick_link_category_id = '" . (int)$quick_link_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'quick_link_category_id=" . (int)$quick_link_category_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'quick_link_category_id=" . (int)$quick_link_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('quick_link_category');
	}
	
	public function deleteQuickLinkCategory($quick_link_category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_category WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_category_description WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "quick_link_category_to_store WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'quick_link_category_id=" . (int)$quick_link_category_id . "'");
		
		$query = $this->db->query("SELECT quick_link_category_id FROM " . DB_PREFIX . "quick_link_category WHERE parent_id = '" . (int)$quick_link_category_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteQuickLinkCategory($result['quick_link_category_id']);
		}
		
		$this->cache->delete('quick_link_category');
	} 

	public function getQuickLinkCategory($quick_link_category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'quick_link_category_id=" . (int)$quick_link_category_id . "') AS keyword FROM " . DB_PREFIX . "quick_link_category WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		
		return $query->row;
	} 
	
	public function getQuickLinkCategories($parent_id) {
		$quick_link_category_data = $this->cache->get('quick_link_category.' . $this->config->get('config_language_id') . '.' . $parent_id);
	
		if (!$quick_link_category_data) {
			$quick_link_category_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_category c LEFT JOIN " . DB_PREFIX . "quick_link_category_description cd ON (c.quick_link_category_id = cd.quick_link_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
			foreach ($query->rows as $result) {
				$quick_link_category_data[] = array(
					'quick_link_category_id' => $result['quick_link_category_id'],
					'name'        => $this->getPath($result['quick_link_category_id'], $this->config->get('config_language_id')),
					'status'  	  => $result['status'],
					'sort_order'  => $result['sort_order']
				);
			
				$quick_link_category_data = array_merge($quick_link_category_data, $this->getQuickLinkCategories($result['quick_link_category_id']));
			}	
	
			$this->cache->set('quick_link_category.' . $this->config->get('config_language_id') . '.' . $parent_id, $quick_link_category_data);
		}
		
		return $quick_link_category_data;
	}
	
	public function getPath($quick_link_category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "quick_link_category c LEFT JOIN " . DB_PREFIX . "quick_link_category_description cd ON (c.quick_link_category_id = cd.quick_link_category_id) WHERE c.quick_link_category_id = '" . (int)$quick_link_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		$quick_link_category_info = $query->row;
		
		if ($quick_link_category_info['parent_id']) {
			return $this->getPath($quick_link_category_info['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $quick_link_category_info['name'];
		} else {
			return $quick_link_category_info['name'];
		}
	}
	
	public function getQuickLinkCategoryDescriptions($quick_link_category_id) {
		$quick_link_category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_category_description WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		
		foreach ($query->rows as $result) {
			$quick_link_category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $quick_link_category_description_data;
	}	
	
	public function getQuickLinkCategoryStores($quick_link_category_id) {
		$quick_link_category_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_category_to_store WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");

		foreach ($query->rows as $result) {
			$quick_link_category_store_data[] = $result['store_id'];
		}
		
		return $quick_link_category_store_data;
	}

	public function getQuickLinkCategoryLayouts($quick_link_category_id) {
		$quick_link_category_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_category_to_layout WHERE quick_link_category_id = '" . (int)$quick_link_category_id . "'");
		
		foreach ($query->rows as $result) {
			$quick_link_category_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $quick_link_category_layout_data;
	}
		
	public function getTotalCategories() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "quick_link_category");
		
		return $query->row['total'];
	}	
		
	public function getTotalCategoriesByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "quick_link_category WHERE image_id = '" . (int)$image_id . "'");
		
		return $query->row['total'];
	}

	public function getTotalCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "quick_link_category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}		
}
?>