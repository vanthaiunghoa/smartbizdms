<?php

/**

 * Download Category model

 */

class ModelSmartBizDownloadCategory extends Model {
	
	public function getAll() {
		$data = array();
		$sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "download_category dc LEFT JOIN " . DB_PREFIX . "download_category_description dcd ON dc.download_category_id=dcd.download_category_id WHERE dcd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "download_category dc LEFT JOIN " . DB_PREFIX . "download_category_description dcd ON dc.download_category_id=dcd.download_category_id WHERE dc.download_category_id = ".$id." dcd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
}
?>