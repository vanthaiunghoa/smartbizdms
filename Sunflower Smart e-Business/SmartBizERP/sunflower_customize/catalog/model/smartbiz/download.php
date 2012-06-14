<?php

/**

 * Download model

 */

class ModelSmartBizDownload extends Model {
	
	public function getAllDownloads() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "download d LEFT JOIN " . DB_PREFIX . "download_description dd ON d.download_id=dd.download_id LEFT JOIN ".DB_PREFIX."download_to_download_category dtdc ON d.download_id = dtdc.download_id WHERE  dd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getDownloadImages($download_id = 0) {
		$where = "";
		if($download_id != 0) {
			$where .= "  WHERE download_id = '" . (int)$download_id . "'";
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "download_image ".$where);

		return $query->rows;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "download d LEFT JOIN " . DB_PREFIX . "download_description dd ON d.download_id=dd.download_id LEFT JOIN ".DB_PREFIX."download_image di ON d.download_id = di.download_id LEFT JOIN ".DB_PREFIX."download_to_download_category dtdc ON d.download_id = dtdc.download_id WHERE d.download_id = ".(int)$id." dd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
}
?>