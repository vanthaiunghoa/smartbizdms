<?php
class ModelModuleVisitorCounter extends Model {
	
	public function createVisitorTable() {
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "visitor_counter (prodid int, word char(25), count int, PRIMARY KEY (prodid, word))");
	}

}
?>