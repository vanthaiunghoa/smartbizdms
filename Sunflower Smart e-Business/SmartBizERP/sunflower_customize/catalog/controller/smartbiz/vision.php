<?php  
class ControllerSmartBizVision extends SmartBizController {
	public function index() {
		$this->updateStatusMenuNavigation('about');
		$this->display('/template/common/vision.tpl');
	}
}
?>