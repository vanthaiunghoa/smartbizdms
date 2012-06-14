<?php  
class ControllerSmartBizError extends SmartBizController {
	public function index() {
		$this->data['page_title'] = "404 Not Found";
		$this->display('/template/common/error.tpl');
		
	}
}
?>