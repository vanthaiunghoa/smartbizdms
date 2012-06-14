<?php  
class ControllerSmartBizYahooPingbox extends SmartBizController {
	public function index() {
		$this->display('/template/common/yahoo_pingbox.tpl', false, false);	
	}
}
?>