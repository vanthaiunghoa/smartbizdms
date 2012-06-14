<?php  
class ControllerSmartBizFooter extends SmartBizController {
	protected function index() {
		$this->language->load('common/footer');
		$this->data['link_sitemap'] = $this->getSitemapPage();
		$this->data['link_contact'] = $this->getContactPage();
		$this->data['link_use'] = $this->getUsePage();
		$this->data['link_statement'] = $this->getStatementPage();
		$this->data['text_powered_by'] = sprintf($this->language->get('text_powered_by'), $this->config->get('config_name'), date('Y', time()));
		
		$this->id = 'footer';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}
		
		if ($this->config->get('google_analytics_status')) {
			$this->data['google_analytics'] = html_entity_decode($this->config->get('google_analytics_code'), ENT_QUOTES, 'UTF-8');
		} else {
			$this->data['google_analytics'] = '';
		}
		
		$this->render();
	}
}
?>