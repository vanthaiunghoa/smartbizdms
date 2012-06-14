<?php  
class ControllerSmartBizRequestProposal extends SmartBizController {
	
	const CONTACT_US_EMAIL_SUBJECT = "contact-us-email-subject.txt";
	const CONTACT_US_EMAIL_BODY = "contact-us-email-body.txt";
	const REQUEST_PROPOSAL_EMAIL_BODY = "request-proposal-email-body.txt";
	
	public function index() {
		$this->updateStatusMenuNavigation('contact');
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->contactUs();
		} 
		$this->display('/template/common/request_proposal.tpl');
	}
	
	private function contactUs() {
		$sender = $this->postParam('txtname');
		$from = $this->postParam('txtemail');
		$message = $this->postParam('txtcomment');
		$phone = $this->postParam('txtphone');
		$address = $this->postParam('txtaddress');
		$to = $this->config->get('config_email');
		
		if ($sender ==  null) {
			$sender = $from;
		}
		$industry = $this->postParam('industry');
		$product = $this->postParam('product');
		$company_size = $this->postParam('company_size');
		$budget = $this->postParam('project_budget');
		$role = $this->postParam('role');
		
		$email_content = $this->getTemplate(self::REQUEST_PROPOSAL_EMAIL_BODY);
		
		$search = array('[comment]', '[phone]', '[address]', '[industry]', '[product]', '[company_size]',
			'[budget]','[role]');
		$replace = array($message,$phone,$address, $industry, $product, $company_size, $budget, $role);
		
		$email_content = str_replace($search, $replace, $email_content);
		
		$this->send($sender, $from, $to, "Email from Customer", $email_content);
		
		// reply automatic for customer
		$search = array("[sender]");
		$replace = array($sender);
					
		$subject = $this->getTemplate(self::CONTACT_US_EMAIL_SUBJECT);
		$body = $this->getTemplate(self::CONTACT_US_EMAIL_BODY);
		
		$subject = str_replace($search, $replace, $subject);
		$body = str_replace($search, $replace, $body);
		
		$this->send($to,$to,$from,$subject, $body);
		
		$this->redirect($this->getServicePage());
	}
	
	private function getTemplate($template) {
		$text = file_get_contents(RESOURCE_PATH . '/template/mail/' . $template);
		return $text;
	}
}
?>