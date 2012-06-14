<?php  
class ControllerSmartBizStatement extends SmartBizController {
	public function index() {
		$this->display('/template/common/statement.tpl');
	}
}
?>