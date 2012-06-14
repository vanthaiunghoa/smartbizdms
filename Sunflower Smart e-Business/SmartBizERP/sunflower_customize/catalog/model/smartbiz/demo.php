<?php

/**

 * Service model

 */

class ModelSmartBizDemo extends Model {
	
	public function getAll() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "demo s LEFT JOIN " . DB_PREFIX . "demo_description sd ON s.demo_id=sd.demo_id WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT * FROM " . DB_PREFIX . "demo d LEFT JOIN " . DB_PREFIX . "demo_description dd ON d.demo_id=dd.demo_id WHERE d.demo_id = '".$id."' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		//$data = $this->getDemoLink($id)
		//$query->row['demo_links'] = $data;
		return $query->row;
	}
	
	public function getFirstId() {
		$sql = "SELECT * FROM " . DB_PREFIX . "demo ORDER BY sort_order ASC LIMIT 0,1";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getFirstDemo() {
		$sql = "SELECT * FROM " . DB_PREFIX . "demo s LEFT JOIN " . DB_PREFIX . "demo_description sd ON s.demo_id=sd.demo_id WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row[0];
	}
	
	public function getDemoLink($demo_id = 0) {
		$sql = "SELECT * FROM " . DB_PREFIX . "demo_link WHERE demo_id = '".(int)$demo_id."' AND language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY name";
		$query = $this->db->query($sql);
		return $query->rows;
	}
	public function getByParentId($parentId = 0) {
		
		$data = array();
		$sql = "SELECT s.*, sd.*, sd2s.service_id FROM " . DB_PREFIX . "demo s LEFT JOIN " . DB_PREFIX . "demo_to_service sd2s ON s.demo_id = sd2s.demo_id LEFT JOIN " . DB_PREFIX . "demo_description sd ON s.demo_id=sd.demo_id WHERE sd2s.service_id = '".$parentId."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY s.sort_order";
		
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
}
?>