<?php

/**

 * Solution model

 */

class ModelSmartBizSolutionDetail extends Model {
	
	public function getAll() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "solution_detail s LEFT JOIN " . DB_PREFIX . "solution_detail_description sd ON s.solution_detail_id=sd.solution_detail_id WHERE sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT * FROM " . DB_PREFIX . "solution_detail s LEFT JOIN " . DB_PREFIX . "solution_detail_description sd ON s.solution_detail_id=sd.solution_detail_id WHERE s.solution_detail_id = '".$id."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getFirst() {
		$sql = "SELECT * FROM " . DB_PREFIX . "solution_detail s LEFT JOIN " . DB_PREFIX . "solution_detail_description sd ON s.solution_detail_id=sd.solution_detail_id LEFT JOIN " . DB_PREFIX . "solution s ON s.solution_id = sd.solution_id  WHERE  sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row[0];
	}
	
	public function getByParentId($parentId = 0) {
		
		$data = array();
		$sql = "SELECT s.*, sd.*, sd2s.solution_id FROM " . DB_PREFIX . "solution_detail s LEFT JOIN " . DB_PREFIX . "solution_detail_to_solution sd2s ON s.solution_detail_id = sd2s.solution_detail_id LEFT JOIN " . DB_PREFIX . "solution_detail_description sd ON s.solution_detail_id=sd.solution_detail_id WHERE sd2s.solution_id = '".$parentId."' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
}
?>