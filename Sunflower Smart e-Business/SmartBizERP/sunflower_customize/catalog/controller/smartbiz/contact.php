<?php  
class ControllerSmartBizContact extends SmartBizController {
	
	const CONTACT_US_EMAIL_SUBJECT = "contact-us-email-subject.txt";
	const CONTACT_US_EMAIL_BODY = "contact-us-email-body.txt";
	const CONTACT_US_TO_ADMIN_EMAIL_BODY = "contact-us-to-admin-email-body.txt";
	
	public function index() {
		$this->updateStatusMenuNavigation('contact');
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->contactUs();
		} 
		$this->display('/template/common/contact.tpl');
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
		
		$email_content = $this->getTemplate(self::CONTACT_US_TO_ADMIN_EMAIL_BODY);
		
		$search = array('[comment]', '[phone]', '[address]');
		$replace = array($message,$phone,$address);
		
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
		
		$this->redirect($this->getContactPage());
	}
	
	private function getTemplate($template) {
		$text = file_get_contents(RESOURCE_PATH . '/template/mail/' . $template);
		return $text;
	}
}
?>