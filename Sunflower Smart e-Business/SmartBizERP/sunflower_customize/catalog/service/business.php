<?php
/** *  * Transfer data object from Model to view
 * wrapper business from controller to easy public as web service * */
class BusinessService {
	protected $registry;
	public function __construct($registry) {		$this->registry = $registry;	}
	public function __get($key) {		return $this->registry->get($key);	}
	public function __set($key, $value) {		$this->registry->set($key, $value);	}
	public function getLastedNews() {		$this->load->model('smartbiz/news');		$this->load->model('tool/image');		$newsList = $this->model_smartbiz_news->getNews(array('sort' => 'n.sort_order', 'order' => 'ASC'));		if (!isset($newsList[0])) {			return array(				'news_id' => 0,				'title'       => 'Promotion campaigns for Distribution and Retail',				'preview'       => html_entity_decode('Promotion is a strategic decision of business. It implements business strategy and emphasizes competitive advantages. SunflowerVN introduces Promotion Campaigns module from SmartBiz Suite which is most suitable to local market and most profitable to Retailers. A typical promotion campaign may include: Discounted Price; Customer loyalty Points; Free Gifts and Services; Gift Cards (vouchers, coupons, scratch cards, and lottery tickets), Buy X get Y.',ENT_QUOTES, 'UTF-8'),				'description' => html_entity_decode('Promotion is a strategic decision of business. It implements business strategy and emphasizes competitive advantages. SunflowerVN introduces Promotion Campaigns module from SmartBiz Suite which is most suitable to local market and most profitable to Retailers. A typical promotion campaign may include: Discounted Price; Customer loyalty Points; Free Gifts and Services; Gift Cards (vouchers, coupons, scratch cards, and lottery tickets), Buy X get Y.',ENT_QUOTES, 'UTF-8'),				'image'       	=> $this->model_tool_image->resize('data/news/img4.jpg', Common::NEWS_IMAGE_WIDTH, Common::NEWS_IMAGE_HEIGHT) ,			);		} else {			$firstNew = $newsList[0];			return array(				'news_id' => $firstNew['news_id'],				'title'       => $firstNew['title'],				'preview'       => html_entity_decode($firstNew['preview'],ENT_QUOTES, 'UTF-8'),				'description' => html_entity_decode($firstNew['description'],ENT_QUOTES, 'UTF-8'),				'image'       	=> $this->model_tool_image->resize($firstNew['image'], Common::NEWS_IMAGE_WIDTH, Common::NEWS_IMAGE_HEIGHT) ,			);		}	}
	public function getNewsList() {		$this->load->model('smartbiz/news');		$this->load->model('tool/image');		$news_list = array();		$results = $this->model_smartbiz_news->getNews(array('sort' => 'n.sort_order', 'order' => 'ASC'));		foreach($results as $result) {			$news_list[] = array (				'news_id' => $result['news_id'],				'title'       => $result['title'],				'preview'       => html_entity_decode($result['preview'],ENT_QUOTES, 'UTF-8'),				'description' => html_entity_decode($result['description'],ENT_QUOTES, 'UTF-8'),				'image' => $this->model_tool_image->resize($result['image'], Common::NEWS_IMAGE_WIDTH, Common::NEWS_IMAGE_HEIGHT),				'date_added' =>  $result['date_added']			);		}		return $news_list;	}
	public function getNews($new_id) {		$this->load->model('smartbiz/news');		$this->load->model('tool/image');		$result = $this->model_smartbiz_news->getNewsDescription($new_id);		return array(			'news_id' => $result['news_id'],			'title'       => $result['title'],			'preview'       => html_entity_decode($result['preview'],ENT_QUOTES, 'UTF-8'),			'description' => html_entity_decode($result['description'],ENT_QUOTES, 'UTF-8'),			'image' => $this->model_tool_image->resize($result['image'], Common::NEWS_IMAGE_WIDTH, Common::NEWS_IMAGE_HEIGHT),			'date_added' =>  $result['date_added']		);	}
	public function getPartners() {		$this->load->model('catalog/partner');		$this->load->model('tool/image');		$partners = array();		$results = $this->model_catalog_partner->getPartners();		foreach ($results as $result) {			$partners[] = array(				'partner_id' => $result['partner_id'],				'name'            => $result['name'],				'href'            => $result['url'],				'image'           => $this->model_tool_image->resize($result['image'], Common::PARTNER_IMAGE_WIDTH, Common::PARTNER_IMAGE_HEIGHT) ,			);		}		return $partners;	}/*
	public function getAttributeProducts() {
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$products = array();
		$results = $this->model_catalog_product->getAttributeProducts(7);
		for ($i=1;$i<7;$i++) {
			$products[] = array(
			'product_id' => $results[$i]['product_id'],
			'description'            => html_entity_decode($results[$i]['description'],ENT_QUOTES, 'UTF-8'),
			'name'            => $results[$i]['name'],
			'sku'=>$results[$i]['sku'],
			'image'           => $this->model_tool_image->resize($results[$i]['image'], Common::STANDARD_PRODUCUT_IMAGE_WIDTH, Common::STANDARD_PRODUCUT_IMAGE_HEIGHT) ,
		);
		}
		return $products;
	}
	public function getTopAttributeProducts() {
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$products = array();
		$results = $this->model_catalog_product->getAttributeProducts(1);
		$videos=array();
		$videos = explode('.',$results[0]['location']);
		$products[] = array(
		'product_id' => $results[0]['product_id'],
		'description'            => html_entity_decode($results[0]['description'],ENT_QUOTES, 'UTF-8'),
		'name'            => $results[0]['name'],
		'sku'=>$results[0]['sku'],
		'image'           => $this->model_tool_image->resize($results[0]['image'], 300, 195) ,
		'video' => $videos[0] . '_' . $_SESSION['language'] . '.' . $videos[1],
		'product_image'=> $this->getProductImage($results[0]['product_id']),
		);
		return $products;	}	*/	//*	public function getFeaturedProducts() {		$this->load->model('catalog/product');		$this->load->model('tool/image');		$products = array();		$results = $this->model_catalog_product->getFeaturedProducts(7);		if(!is_array($results) || sizeof($results) == 0) {			return array();		} 		for ($i=1;$i<7;$i++) {			$products[] = array(			'product_id' => $results[$i]['product_id'],			'description'            => html_entity_decode($results[$i]['description'],ENT_QUOTES, 'UTF-8'),			'name'            => $results[$i]['name'],			'sku'=>$results[$i]['sku'],			'image'           => $this->model_tool_image->resize($results[$i]['image'], Common::STANDARD_PRODUCUT_IMAGE_WIDTH, Common::STANDARD_PRODUCUT_IMAGE_HEIGHT) ,		);		}		return $products;	}	public function getTopFeaturedProducts() {		$this->load->model('catalog/product');		$this->load->model('tool/image');		$products = array();		$results = $this->model_catalog_product->getFeaturedProducts(1);		if(!is_array($results) || sizeof($results) == 0) {			return array();		}		$videos=array();		$videos = explode('.',$results[0]['location']);		$products[] = array(		'product_id' => $results[0]['product_id'],		'description'            => html_entity_decode($results[0]['description'],ENT_QUOTES, 'UTF-8'),		'name'            => $results[0]['name'],		'sku'=>$results[0]['sku'],		'image'           => $this->model_tool_image->resize($results[0]['image'], 300, 195) ,		'video' => $videos[0] . '_' . $_SESSION['language'] . '.' . $videos[1],		'product_image'=> $this->getProductImage($results[0]['product_id']),		);		return $products;			}	//*/
	public function getProductImage($productID){
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$results = $this->model_catalog_product->getProductImages($productID);
		
		return $this->model_tool_image->resize($results[0]['image'], Common::FEATURED_PRODUCUT_IMAGE_WIDTH, Common::FEATURED_PRODUCUT_IMAGE_HEIGHT);
	}
}

?>