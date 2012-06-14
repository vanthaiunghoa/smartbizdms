<?php

/**

 * QuickLink model

 */

class ModelSmartBizQuickLink extends Model {
	
	public function getAllQuickLinks() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "quick_link ql LEFT JOIN " . DB_PREFIX . "quick_link_description qld ON ql.quick_link_id=qld.quick_link_id LEFT JOIN ".DB_PREFIX."quick_link_to_quick_link_category qltqlc ON ql.quick_link_id = qltqlc.quick_link_id WHERE  qld.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getQuickLinkImages($quick_link_id = 0) {
		$where = "";
		if($quick_link_id != 0) {
			$where .= "  WHERE quick_link_id = '" . (int)$quick_link_id . "'";
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quick_link_image ".$where);

		return $query->rows;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "quick_link ql LEFT JOIN " . DB_PREFIX . "quick_link_description qld ON ql.quick_link_id=qld.quick_link_id LEFT JOIN ".DB_PREFIX."quick_link_image qli ON ql.quick_link_id = qli.quick_link_id LEFT JOIN ".DB_PREFIX."quick_link_to_quick_link_category qltqlc ON ql.quick_link_id = qltqlc.quick_link_id WHERE ql.quick_link_id = ".(int)$id." qld.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
}
?>