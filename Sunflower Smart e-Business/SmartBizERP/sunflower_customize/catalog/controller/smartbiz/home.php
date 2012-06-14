<?php

class ControllerSmartBizHome extends SmartBizController {

	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		$this->updateStatusMenuNavigation('home');

		$this->data['link_product_detail'] = $this->getDetailPage();

		$this->data['link_news'] = $this->getNewsPage();

		$this->data['link_contact'] = $this->getContactPage();

		$this->data['lasted_news'] = $this->business->getLastedNews();

		$this->data['partners'] = $this->business->getPartners(); 

		$this->data['featuredProducts']= $this->business->getFeaturedProducts();
		
		$this->data['topFeaturedProducts']= $this->business->getTopFeaturedProducts();
		
		$this->display('/template/common/home.tpl');
	}
}
?>