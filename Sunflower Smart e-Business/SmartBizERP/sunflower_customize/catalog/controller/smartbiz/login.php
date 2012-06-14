<?php  
class ControllerSmartBizLogin extends SmartBizController {
	public function index() {
		//$this->updateStatusMenuNavigation('contact');
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			// check email and password
			$this->redirect($this->getHomePage());
		}
		$this->display('/template/account/login.tpl');
	}
}
?>