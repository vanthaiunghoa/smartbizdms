<?php

/**

 * Service model

 */

class ModelSmartBizServiceDetail extends Model {
	
	public function getAll() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "service_detail s LEFT JOIN " . DB_PREFIX . "service_detail_description sd ON s.service_detail_id=sd.service_detail_id WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT * FROM " . DB_PREFIX . "service_detail s LEFT JOIN " . DB_PREFIX . "service_detail_description sd ON s.service_detail_id=sd.service_detail_id WHERE s.service_detail_id = '".$id."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getFirst() {
		$sql = "SELECT * FROM " . DB_PREFIX . "service_detail sd LEFT JOIN " . DB_PREFIX . "service_detail_description sdd ON sd.service_detail_id=sdd.service_detail_id LEFT JOIN service s ON s.service_id = sd.service_id WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getByParentId($parentId = 0) {
		
		$data = array();
		$sql = "SELECT s.*, sd.*, sd2s.service_id FROM " . DB_PREFIX . "service_detail s LEFT JOIN " . DB_PREFIX . "service_detail_to_service sd2s ON s.service_detail_id = sd2s.service_detail_id LEFT JOIN " . DB_PREFIX . "service_detail_description sd ON s.service_detail_id=sd.service_detail_id WHERE sd2s.service_id = '".$parentId."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY s.sort_order";
		
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
}
?>