<?php
class ModelModuleVisitorCounter extends Model {
	
	public function addVisitor($ip_address) {
		$query = $this->db->query("INSERT INTO " . DB_PREFIX . "visitor_counter (prodid,word,count) VALUES (1,'" . $this->db->escape($ip_address) . "',1) ON DUPLICATE KEY UPDATE count=count+1");
	}

	public function getVisitors() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "visitor_counter");
	
		return $query->rows;	
	}
}
?>
