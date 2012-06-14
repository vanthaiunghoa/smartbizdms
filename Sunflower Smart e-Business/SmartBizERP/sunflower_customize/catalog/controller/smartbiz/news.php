<?php  
class ControllerSmartBizNews extends SmartBizController {
	public function index() {
		
		$this->data['link_news'] = $this->getNewsPage();
		
		if ($this->getParam('news_id')) {
			$this->getNews($this->getParam('news_id'));
		} else {
			$this->getList();
		}
	}
	
	private function getList() {
		$this->data['news_list'] = $this->business->getNewsList();
		$this->display('/template/common/news_list.tpl');
	}
	
	private function getNews($news_id) {
		$this->data['news'] = $this->business->getNews($news_id);
		$this->display('/template/common/news.tpl');
	}
}
?>