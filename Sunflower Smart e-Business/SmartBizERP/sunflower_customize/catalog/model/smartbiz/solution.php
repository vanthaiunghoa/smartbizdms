<?php

/**

 * Solution model

 */

class ModelSmartBizSolution extends Model {
	
	public function getAll() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "solution s LEFT JOIN " . DB_PREFIX . "solution_description sd ON s.solution_id=sd.solution_id WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT *, ss.* FROM " . DB_PREFIX . "solution s LEFT JOIN " . DB_PREFIX . "solution_description sd ON s.solution_id=sd.solution_id LEFT JOIN solution_special ss ON s.solution_id = ss.solution_id WHERE s.solution_id = '".$id."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order, priority limit 0,1";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getFirst() {
		$sql = "SELECT *, ss.* FROM " . DB_PREFIX . "solution s LEFT JOIN " . DB_PREFIX . "solution_description sd ON s.solution_id=sd.solution_id LEFT JOIN solution_special ss ON s.solution_id = ss.solution_id WHERE s.solution_id = '".$id."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order, priority limit 0,1";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getFirstId() {
		$sql = "SELECT * FROM " . DB_PREFIX . "solution s ORDER BY sort_order ASC LIMIT 0,1";
		$query = $this->db->query($sql);
		return $query->row;
	}
}
?>