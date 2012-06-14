<?php
class ModelCatalogNews extends Model {
	public function checkTable() {
		$sql = "SHOW TABLES WHERE Tables_in_" . DB_DATABASE ." = '" . DB_PREFIX ."news'";
		$query = $this->db->query($sql);
		$results =$query->num_rows;
		
		if($results==0){
			$this->genTable();
			//$this->upgradeTable();
		}else{
			return true;
		}
	}
	
	public function genTable(){						  
		$this->db->query("CREATE TABLE  `" . DB_DATABASE . "`.`" . DB_PREFIX . "news` (
						  `news_id` int(11) NOT NULL AUTO_INCREMENT,
						  `sort_order` int(3) NOT NULL DEFAULT '0',
						  `author` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `status` int(1) NOT NULL DEFAULT '1',
						  `image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `publish_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  `publish_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  PRIMARY KEY (`news_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin");	
									  
		$this->db->query("CREATE TABLE  `" . DB_DATABASE . "`.`" . DB_PREFIX . "news_description` (
						  `news_id` int(11) NOT NULL,
						  `language_id` int(11) NOT NULL,
						  `title` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `preview` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  						  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `description` text COLLATE utf8_bin NOT NULL,
						  `related_product_url_text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
						  PRIMARY KEY (`news_id`,`language_id`)
						) ENGINE=MyISAM CHARSET=utf8 COLLATE=utf8_bin");
						
		$this->db->query("CREATE TABLE  `" . DB_DATABASE . "`.`" . DB_PREFIX . "news_youtube` (
						  `youtube_id` int(11) NOT NULL AUTO_INCREMENT,
						  `news_id` int(11) NOT NULL,
						  `v` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `width` DECIMAL(5,0) NOT NULL DEFAULT '0',
						  `height` DECIMAL(5,0) NOT NULL DEFAULT '0',
						  `autoplay` int(1) NOT NULL DEFAULT '0',
						  `title` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `preview` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `status` int(1) NOT NULL DEFAULT '1',
						  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  PRIMARY KEY (`youtube_id`,`news_id`)
						) ENGINE=MyISAM CHARSET=utf8 COLLATE=utf8_bin");
						
		$this->db->query("CREATE TABLE  `" . DB_DATABASE . "`.`" . DB_PREFIX . "news_post` (
						  `post_id` int(11) NOT NULL AUTO_INCREMENT,
						  `news_id` int(11) NOT NULL,
						  `author` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `text` text COLLATE utf8_bin NOT NULL,
						  `ip` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `rating` int(1) NOT NULL DEFAULT '0',
						  `status` int(1) NOT NULL DEFAULT '0',
						  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  PRIMARY KEY (`post_id`,`news_id`)
						) ENGINE=MyISAM CHARSET=utf8 COLLATE=utf8_bin");
						
		$this->db->query("CREATE TABLE  `" . DB_DATABASE . "`.`" . DB_PREFIX . "news_view` (
						  `view_id` int(11) NOT NULL AUTO_INCREMENT,
						  `news_id` int(11) NOT NULL,
						  `ip` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
						  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
						  PRIMARY KEY (`view_id`,`news_id`)
						) ENGINE=MyISAM CHARSET=utf8 COLLATE=utf8_bin");
						
		$this->db->query("CREATE TABLE  `" . DB_DATABASE . "`.`" . DB_PREFIX . "news_related` (
						  `news_id` int(11) NOT NULL,
						  `related_id` int(11) NOT NULL,
						  PRIMARY KEY (`news_id`,`related_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin");
		
	}
	
	public function getArrNews($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nid ON (n.news_id = nid.news_id) WHERE nid.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		$sort_data = array(
			'nid.title',
			'n.author',
			'n.sort_order',
			'n.status',
			'n.date_added'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY n.date_added";	
		}
			
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}																																							  
																																							  
		$query = $this->db->query($sql);																																				
		
		return $query->rows;	
	}
	
	public function getTotalNews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news");
		
		return $query->row['total'];
	}
	
	public function getTotalPost($news_id) {
		$query = $this->db->query("SELECT COUNT(*) AS post FROM " . DB_PREFIX . "news_post WHERE news_id='" . $news_id . "'");
		
		return $query->row['post'];
	}
	
	public function getTotalRead($news_id) {
		$query = $this->db->query("SELECT COUNT(*) AS view FROM " . DB_PREFIX . "news_view WHERE news_id='" . $news_id . "'");
		
		return $query->row['view'];
	}
	
	public function getYoutube($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_youtube WHERE news_id = '" . (int)$news_id . "'");
		
		return $query->rows;
	}
	
	public function getNewsList() {
		//$news_data = $this->cache->get('news.' . $this->config->get('config_language_id'));
	
		//if (!$news_data) {
			$news_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) WHERE  nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY nd.title ASC");
		
			foreach ($query->rows as $result) {
				$news_data[] = array(
					'news_id' => $result['news_id'],
					'name'        => $result['title'],
					'status'  	  => $result['status'],
					'sort_order'  => $result['sort_order']
				);
			
				//$news_data = array_merge($news_data, $news_data);
			}	
	
			//$this->cache->set('news.' . $this->config->get('config_language_id'), $news_data);
		//}
		
		return $news_data;
	}
	
	public function getNewsRelated($news_id) {
		$news_related_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_related WHERE news_id = '" . (int)$news_id . "'");
		
		foreach ($query->rows as $result) {
			$news_related_data[] = $result['related_id'];
		}
		
		return $news_related_data;
	}
	
	public function getNews($news_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		
		return $query->row;
	}
	
	public function addNews($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news SET sort_order = '" . (int)$data['sort_order'] . "', author = '" .  $this->db->escape($data['author']) . "', status = '" . (int)$data['status'] . "', publish_start = '" . $this->db->escape($data['start_date']) . "', publish_end = '" .  $this->db->escape($data['end_date']) . "', image = '" .  $this->db->escape($data['image']) . "', date_added = NOW()" . ", date_modified = NOW()");

		$news_id = $this->db->getLastId(); 
			
		foreach ($data['news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_keyword = '" . $this->db->escape($value['metakeyword']) . "', meta_description = '" . $this->db->escape($value['metadescription']) . "', preview = '" . $this->db->escape($value['preview']) . "'");
		}
		
		if (isset($data['youtube'])) {
			foreach ($data['youtube'] as $value) {
				if(($value['width'])){
					$width = (float)$value['width'];
				}else{
					$width = '640';
				}
				
				if(($value['height'])){
					$height = (float)$value['height'];
				}else{
					$height = '385';
				}
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_youtube SET news_id = '" . (int)$news_id . "', title = '" . $this->db->escape($value['title']) . "', v = '" . $this->db->escape($value['v']) . "', width = '" . $width . "', height = '" . $height . "', autoplay = '" . (int)$value['autoplay'] . "', date_added = NOW()" . ", date_modified = NOW()");
			}
		}
		
		if (isset($data['news_related'])) {
			foreach ($data['news_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related SET news_id = '" . (int)$news_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related SET news_id = '" . (int)$related_id . "', related_id = '" . (int)$news_id . "'");
			}
		}
		
		$this->cache->delete('news');
	}
	
	public function deleteNews($news_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_youtube WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_related WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_post WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_view WHERE news_id = '" . (int)$news_id . "'");
		
		$this->cache->delete('news');
	}
	
	public function getNewsDescriptions($news_id) {
		$news_description_data = array();
		$author = $this->getNews($news_id);
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");

		foreach ($query->rows as $result) {
			$news_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'preview'       => $result['preview'],
				'description' => $result['description'],
				'metakeyword' => $result['meta_keyword'],
				'metadescription' => $result['meta_description'],
				'author' => $author['author'],
				'related_product_url_text' => $result['related_product_url_text']
			);
		}
		
		return $news_description_data;
	}
	
	public function editNews($news_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news SET sort_order = '" . (int)$data['sort_order'] . "', author = '" .  $this->db->escape($data['author']) . "', status = '" . (int)$data['status'] . "', publish_start = '" . $this->db->escape($data['start_date']) . "', publish_end = '" .  $this->db->escape($data['end_date']) . "', image = '" .  $this->db->escape($data['image']) . "', date_added = NOW()" . ", date_modified = NOW() WHERE news_id = '" . (int)$news_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
					
		foreach ($data['news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_description = '" . $this->db->escape($value['metadescription']) . "', meta_keyword = '" . $this->db->escape($value['metakeyword']) . "', preview = '" . $this->db->escape($value['preview']) . "'");
			
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_youtube WHERE news_id = '" . (int)$news_id . "'");
		
		if (isset($data['youtube'])) {
			foreach ($data['youtube'] as $value) {
				if(($value['width'])){
					$width = (float)$value['width'];
				}else{
					$width = '640';
				}
				
				if(($value['height'])){
					$height = (float)$value['height'];
				}else{
					$height = '385';
				}
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_youtube SET news_id = '" . (int)$news_id . "', title = '" . $this->db->escape($value['title']) . "', v = '" . $this->db->escape($value['v']) . "', width = '" . $width . "', height = '" . $height . "', autoplay = '" . (int)$value['autoplay'] . "', date_added = NOW()" . ", date_modified = NOW()");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_related WHERE news_id = '" . (int)$news_id . "'");
		
		if (isset($data['news_related'])) {
			foreach ($data['news_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related SET news_id = '" . (int)$news_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "news_related WHERE news_id = '" . (int)$related_id . "' AND related_id = '" . (int)$news_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_related SET news_id = '" . (int)$related_id . "', related_id = '" . (int)$news_id . "'");
			}
		}
		
		$this->cache->delete('news');
	}
	
	public function getPosts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news_post np WHERE np.news_id = '" . (int)$data['news_id']. "'";
		
		$sort_data = array(
			'np.text',
			'np.author',
			'np.rating',
			'np.status',
			'np.date_added'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY np.date_added";	
		}
			
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}																																							  
																																							  
		$query = $this->db->query($sql);																																				
		
		return $query->rows;	
	}
	
	public function getNewsDescription($news_id) {		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
	
	public function deletePost($post_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_post WHERE post_id = '" . (int)$post_id . "'");
		
		$this->cache->delete('forum');
	}
	
	public function addPost($news_id, $data) {
		if(isset($data['rating'])){
			$rating = (int)$data['rating'];
		}else{
			$rating = 0;
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "news_post SET news_id = '" . (int)$news_id ."', author = '" . $this->db->escape($data['author']) . "', text = '" . $this->db->escape(strip_tags($data['description'])) . "', rating = '" . $rating . "', ip = '" . $this->db->escape($data['myip']) . "', status = '" . (int)$data['status'] . "', date_added = NOW(), date_modified = NOW()");
		
		$this->cache->delete('news');
	}
	
	public function getPost($post_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "news_post WHERE post_id = '" . (int)$post_id . "'");
		
		return $query->row;
	}
	
	public function editNewsPost($post_id, $data) {
		if(isset($data['rating'])){
			$rating = (int)$data['rating'];
		}else{
			$rating = 0;
		}
		$this->db->query("UPDATE " . DB_PREFIX . "news_post SET text = '" . $this->db->escape($data['description']) . "', author = '" . $this->db->escape($data['author']) . "', rating = '" . $rating . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE post_id = '" . (int)$post_id . "'");
		
		$this->cache->delete('news');
	}
	
	
}
?>