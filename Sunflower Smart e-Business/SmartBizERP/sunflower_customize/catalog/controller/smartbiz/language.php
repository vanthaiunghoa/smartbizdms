<?php  
class ControllerSmartBizLanguage extends SmartBizController {
	public function index() {
		//$this->updateStatusMenuNavigation('home');
		if ($this->getParam("lang") != null) {
			$this->session->data['language'] = $this->getParam("lang");
		} else {
			if (!isset($this->session->data['language'])) {
				$this->session->data['language'] = "en";
			}
		}
		$this->redirect($this->returnCurrentPage());
	}
	
	private function returnCurrentPage() {
		return isset($this->session->data['current_page']) ? $this->session->data['current_page'] : $this->getHomePage();
	}
}
?>