<?php
class ModelCatalogPartner extends Model {
	public function getPartner($partner_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "partner m LEFT JOIN " . DB_PREFIX . "partner_to_store m2s ON (m.partner_id = m2s.partner_id) WHERE m.partner_id = '" . (int)$partner_id . "' AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
	
		return $query->row;	
	}
	
	public function getPartners($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "partner m LEFT JOIN " . DB_PREFIX . "partner_to_store m2s ON (m.partner_id = m2s.partner_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
			
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
			$partner_data = $this->cache->get('partner.' . (int)$this->config->get('config_store_id'));
		
			if (!$partner_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "partner m LEFT JOIN " . DB_PREFIX . "partner_to_store m2s ON (m.partner_id = m2s.partner_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY name");
	
				$partner_data = $query->rows;
			
				$this->cache->set('partner.' . (int)$this->config->get('config_store_id'), $partner_data);
			}
		 
			return $partner_data;
		}	
	} 
}
?>