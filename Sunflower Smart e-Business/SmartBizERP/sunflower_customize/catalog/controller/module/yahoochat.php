<?php  
class ControllerModuleYahooChat extends Controller {
	protected function index() {
		$this->language->load('module/yahoochat');

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$code = explode(';',html_entity_decode($this->config->get('yahoochat_code')));
		$dat='';
		foreach ($code as $codes){
			$str = explode(':', $codes);
			$dat .='<a href="ymsgr:sendim?'.$str[0].'"><img src="http://opi.yahoo.com/online?u='.$str[0].'&amp;m=g&amp;t=2"></a></br><b>'.$str[1].'</b></br>';
		}
		$this->data['code'] = $dat;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/yahoochat.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/yahoochat.tpl';
		} else {
			$this->template = 'default/template/module/yahoochat.tpl';
		}
		
		$this->render();
	}
}
?>