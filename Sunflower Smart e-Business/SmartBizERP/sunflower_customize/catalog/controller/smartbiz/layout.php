<?php
class ControllerSmartBizLayout extends SmartBizController {
	public function index() {		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/layout.tpl')) {			$this->template = $this->config->get('config_template') . '/template/common/layout.tpl';		} else {			$this->template = 'default/template/common/layout.tpl';		}
		$this->children = array(			'smartbiz/footer',			'smartbiz/header'		);
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));	}}?>