<?php

/**

 * Company model

 */

class ModelSmartBizCompany extends Model {
	
	public function getAllCompanies() {
		$data = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "company c LEFT JOIN " . DB_PREFIX . "company_description cd ON c.company_id=cd.company_id WHERE  cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		
		$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$data[] = $result;
		}
		return $data;
	}
	
	public function getCompanyImages($company_id = 0) {
		$where = "";
		if($company_id != 0) {
			$where .= "  WHERE company_id = '" . (int)$company_id . "'";
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "company_image ".$where);

		return $query->rows;
	}
	
	public function getById($id = 0) {
		$sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "company c LEFT JOIN " . DB_PREFIX . "company_description cd ON c.company_id=cd.company_id LEFT JOIN ".DB_PREFIX."company_image ci ON c.company_id = ci.company_id WHERE c.company_id = ".(int)$id." AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY sort_order";
		$query = $this->db->query($sql);
		return $query->row;
	}
}
?>