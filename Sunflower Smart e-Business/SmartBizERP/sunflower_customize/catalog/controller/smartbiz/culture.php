<?php  
class ControllerSmartBizCulture extends SmartBizController {
	public function index() {
		$this->updateStatusMenuNavigation('about');
		$this->display('/template/common/culture.tpl');
	}
}
?>