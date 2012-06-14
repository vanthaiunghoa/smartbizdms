<?php

/**

 * QuickLink Category model

 */

class ModelSmartBizQuickLinkCategory extends Model {
	
	public function getAll() {
		$data = array();
		$sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "quick_link_category qc LEFT JOIN " . DB_PREFIX . "quick_link_category_description qcd ON qc.quick_link_category_id=qcd.quick_link_category_id WHERE qcd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "quick_link_category qc LEFT JOIN " . DB_PREFIX . "quick_link_category_description qcd ON dc.quick_link_category_id=qcd.quick_link_category_id WHERE qc.quick_link_category_id = ".$id." qcd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
}
?>