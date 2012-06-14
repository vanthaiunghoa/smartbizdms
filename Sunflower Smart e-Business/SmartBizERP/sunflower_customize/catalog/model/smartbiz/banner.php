<?php
class ModelSmartBizBanner extends Model {	
	public function getBanner($banner_pos) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner b LEFT JOIN " . DB_PREFIX . "banner_image bi ON b.banner_id = bi.banner_id LEFT JOIN " . DB_PREFIX . "banner_image_description bid ON (bi.banner_image_id  = bid.banner_image_id) WHERE bid.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.position = '".$banner_pos."'");
		
		return $query->rows;
	}
}
?>