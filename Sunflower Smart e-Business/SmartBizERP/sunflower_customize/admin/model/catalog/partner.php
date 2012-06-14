<?php
class ModelCatalogPartner extends Model {
	public function addPartner($data) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "partner SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "'");
		
		$partner_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "partner SET image = '" . $this->db->escape($data['image']) . "' WHERE partner_id = '" . (int)$partner_id . "'");
		}
		
		if (isset($data['partner_store'])) {
			foreach ($data['partner_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "partner_to_store SET partner_id = '" . (int)$partner_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
				
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'partner_id=" . (int)$partner_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('partner');
	}
	
	public function editPartner($partner_id, $data) {
      	$this->db->query("UPDATE " . DB_PREFIX . "partner SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE partner_id = '" . (int)$partner_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "partner SET image = '" . $this->db->escape($data['image']) . "' WHERE partner_id = '" . (int)$partner_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "partner_to_store WHERE partner_id = '" . (int)$partner_id . "'");

		if (isset($data['partner_store'])) {
			foreach ($data['partner_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "partner_to_store SET partner_id = '" . (int)$partner_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
			
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'partner_id=" . (int)$partner_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'partner_id=" . (int)$partner_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('partner');
	}
	
	public function deletePartner($partner_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "partner WHERE partner_id = '" . (int)$partner_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "partner_to_store WHERE partner_id = '" . (int)$partner_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'partner_id=" . (int)$partner_id . "'");
			
		$this->cache->delete('partner');
	}	
	
	public function getPartner($partner_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'partner_id=" . (int)$partner_id . "') AS keyword FROM " . DB_PREFIX . "partner WHERE partner_id = '" . (int)$partner_id . "'");
		
		return $query->row;
	}
	
	public function getPartners($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "partner";
			
			$sort_data = array(
				'name',
				'sort_order'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY name";	
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
			$partner_data = $this->cache->get('partner');
		
			if (!$partner_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "partner ORDER BY name");
	
				$partner_data = $query->rows;
			
				$this->cache->set('partner', $partner_data);
			}
		 
			return $partner_data;
		}
	}
	
	public function getPartnerStores($partner_id) {
		$partner_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "partner_to_store WHERE partner_id = '" . (int)$partner_id . "'");

		foreach ($query->rows as $result) {
			$partner_store_data[] = $result['store_id'];
		}
		
		return $partner_store_data;
	}
	
	public function getTotalPartnersByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "partner WHERE image_id = '" . (int)$image_id . "'");

		return $query->row['total'];
	}

	public function getTotalPartners() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "partner");
		
		return $query->row['total'];
	}	
}
?>