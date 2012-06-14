<?php

/**

 * Service model

 */

class ModelSmartBizService extends Model {
	
	public function getAll() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "service s LEFT JOIN " . DB_PREFIX . "service_description sd ON s.service_id=sd.service_id WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT * FROM " . DB_PREFIX . "service s LEFT JOIN " . DB_PREFIX . "service_description sd ON s.service_id=sd.service_id WHERE s.service_id = '".$id."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getFirstId() {
		$sql = "SELECT * FROM " . DB_PREFIX . "service s ORDER BY sort_order ASC LIMIT 0,1";
		$query = $this->db->query($sql);
		return $query->row;
	}
}
?>