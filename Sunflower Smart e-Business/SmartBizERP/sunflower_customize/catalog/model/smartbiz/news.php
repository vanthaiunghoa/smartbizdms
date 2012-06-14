<?php
/**
 * News news model
 */
class ModelSmartBizNews extends Model {
	/**
	 * Get news description
	 * @param $news_id
	 */
	public function getNewsDescription($news_id) {		$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON n.news_id=nd.news_id WHERE n.news_id = '" . (int)$news_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";		$query = $this->db->query($sql);
		return $query->row;	}
	
	/**
	 * Get youtube by news id
	 * @param $news_id
	 */
	public function getYoutubes($news_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news_youtube WHERE news_id = '" . (int)$news_id . "' ";
		$youtube_description_data = array();		$query = $this->db->query($sql);		foreach ($query->rows as $result) {
			$youtube_description_data[] = array(				'youtube_id' => $result['youtube_id'],				'news_id'	 => $news_id,				'title' 	 => $result['title'],				'v'       	 => $result['v'],				'width'      => $result['width'],				'height'     => $result['height'],				'autoplay'   => $result['autoplay'],				//'description' => html_entity_decode($result['description'],ENT_QUOTES, 'UTF-8'),				'date_added' => date($this->language->get('news_date_format'), strtotime($result['date_added'])),				'time_added' => date($this->language->get('news_time_format'), strtotime($result['date_added'])) 			);		}		return $youtube_description_data;	}
	
	/**
	 * Get new relates
	 * @param $news_id
	 */
	public function getRelateds($news_id) {
		$sql = "SELECT nr.*, nd.title, nd.preview, n.author, n.date_added FROM " . DB_PREFIX . "news_related nr JOIN " . DB_PREFIX . "news_description nd ON nr.related_id=nd.news_id JOIN " . DB_PREFIX . "news n ON nr.related_id=n.news_id WHERE nr.news_id = '" . (int)$news_id . "' AND nr.related_id != '" . (int)$news_id . "' AND n.status = '1' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$related_description_data = array();		$query = $this->db->query($sql);		foreach ($query->rows as $result) {			$related_description_data[] = array(				'news_id'	  => $news_id,				'related_id'	  => $result['related_id'],				'title'       => $result['title'],				'preview' => html_entity_decode($result['preview'],ENT_QUOTES, 'UTF-8'),				'author' => $result['author'],				'date_added' => date($this->language->get('news_date_format'), strtotime($result['date_added'])),				'time_added' => date($this->language->get('news_time_format'), strtotime($result['date_added'])) 			);		}		return $related_description_data;	}
	/**	 * Get post description by news id	 * @param $news_id	 */
	public function getPostDescription($news_id){
		$post_description_data = array();		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_post WHERE news_id = '" . (int)$news_id . "' AND status = '1' ORDER BY date_added ASC");		foreach ($query->rows as $result) {			$post_description_data[] = array(				'news_id'	=> $news_id,				'post_id'	=> $result['post_id'],				'rating'	=> $result['rating'],				'author'	=> $result['author'],				'text'		=> html_entity_decode($result['text'],ENT_QUOTES, 'UTF-8'),				'ip'		=> $result['ip'],				'date_added'	=> date($this->language->get('news_date_format'), strtotime($result['date_added'])),				'time_added'	=> date($this->language->get('news_time_format'), strtotime($result['date_added']))			);		}
		return $post_description_data;	}
	public function setView($data = array()){
		$sql = "SELECT news_id FROM " . DB_PREFIX ."news_view WHERE news_id='" . (int)$data['news_id'] . "' AND ip = '" . $data['ip'] . "' AND DATE_FORMAT(date_added,'%Y-%m-%d') = CURDATE()";		$query = $this->db->query($sql);		$result = $query->rows;		if(!$result){			$sql = "INSERT INTO " . DB_PREFIX . "news_view SET news_id = '" . (int)$data['news_id'] . "', ip = '" . $data['ip'] . "', date_added = NOW()";			$this->db->query($sql);		}	}
	/**
	 * Add post with news id
	 * @param $news_id
	 * @param $data
	 */
	public function addPost($news_id, $data) {
		//(int)$this->customer->getId()
		$this->db->query("INSERT INTO " . DB_PREFIX . "news_post SET author = '" . $this->db->escape($data['name']) . "', ip = '" . $this->db->escape($data['myip']) . "', news_id = '" . (int)$news_id . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '0', date_added = NOW() , date_modified = NOW()");
	}
	
	/**
	 * Get total news
	 * @param $news_id
	 */
	public function getTotalNewsById($news_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_post");
		
		return $query->row['total'];
	}
	
	/**
	 * get news list
	 * @param $data
	 */
	public function getNews($data = array()) {
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
			$sql .= " ORDER BY n.sort_order ASC, n.date_added";	
		}
			
		if (isset($data['order']) && ($data['order'] == 'ASC')) {
			$sql .= " ASC";
		} else {
			$sql .= " DESC";
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
	
	/**
	 * Get news available
	 * @param $data
	 */
	public function getEnabledNews($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nid ON (n.news_id = nid.news_id) WHERE nid.language_id = '" . (int)$this->config->get('config_language_id') . "'" . " and `status` = 1 ";
		
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
			$sql .= " ORDER BY n.sort_order ASC, n.date_added";	
		}
			
		if (isset($data['order']) && ($data['order'] == 'ASC')) {
			$sql .= " ASC";
		} else {
			$sql .= " DESC";
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
	
	/**
	 * Get youtube description
	 * @param $youtube_id
	 */
	public function getYoutubeDescription($youtube_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news_youtube ny WHERE ny.youtube_id = '" . (int)$youtube_id . "'";
		
		$youtube_description_data = array();
		
		$query = $this->db->query($sql);
		

		foreach ($query->rows as $result) {
			$youtube_description_data = array(
				'youtube_id'	  => $youtube_id,
				'title'       => $result['title'],
				'v'       => $result['v'],
				'width' => $result['width'],
				'height' => $result['height'],
				'autoplay' => $result['autoplay']
			);
		}
		
		return $youtube_description_data;
	}
	
	/**
	 * Get total read of news
	 * @param $news_id
	 */
	public function getTotalRead($news_id) {
		$query = $this->db->query("SELECT COUNT(*) AS view FROM " . DB_PREFIX . "news_view WHERE news_id='" . $news_id . "'");
		
		return $query->row['view'];
	}
	
	/**
	 * Get total post of news
	 * @param $news_id
	 */
	public function getTotalPost($news_id) {
		$query = $this->db->query("SELECT COUNT(*) AS post FROM " . DB_PREFIX . "news_post WHERE news_id='" . $news_id . "'");
		
		return $query->row['post'];
	}
	
	/**
	 * Get total news
	 */
	public function getTotalNews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news");
		
		return $query->row['total'];
	}
	
	
	/*
	public function getForum($news_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		
		return $query->row;
	}
	
	public function addForum($languages, $data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news SET author = '" . $this->db->escape($data['name']) . "', status = '0', sort_order = '0'");
		$news_id = $this->db->getLastId(); 
		
		foreach ($languages as $language){
			$sql = "INSERT INTO " . DB_PREFIX . "news_description SET language_id = '" . (int)$language['id'] . "', title = '" . $this->db->escape($data['title']) . "', news_id = '" . (int)$news_id . "', description = '" . $this->db->escape(strip_tags($data['text'])) . "', date_added = NOW() , date_modified = NOW()";
			
			$this->db->query($sql);
		}
	}
	
	public function viewForum($news_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news SET sort_order = '" . (int)$data['sort_order'] . "', author = '" . $this->request->post['author'] . "', status = '" . (int)$data['status'] . "' WHERE news_id = '" . (int)$news_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
					
		foreach ($data['news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', preview = '" . $this->db->escape($value['preview']) . "', date_added = NOW()" . ", date_modified = NOW()");
			
		}
		
		$this->cache->delete('news');
	}
	*/
}
?>