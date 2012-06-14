<?php  
class ControllerSmartBizSitemap extends SmartBizController {
	public function index() {
		$this->display('/template/common/sitemap.tpl');
	}
}
?>