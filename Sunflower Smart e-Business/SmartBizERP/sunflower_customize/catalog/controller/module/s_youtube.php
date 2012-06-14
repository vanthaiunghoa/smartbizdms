<?php  
#############################################################################
#  Adpatations for OpenCart 1.5.0 from Hildebrando 28.4.2011
#  Adpatations for OpenCart 1.4.9 from Hildebrando 31.8.2010
#  Original developed by  Somsak2004, web: www.somsak2004.net email: sanma2001@hotmail.com
#  
#############################################################################
class ControllerModuleSyoutube  extends Controller {		 

	protected function index($module) {

		$this->language->load('module/s_youtube');

      	$this->data['heading_title'] = $this->language->get('heading_title');
      	$this->data['youtube_extension'] = $this->language->get('youtube_extension');
		
        $thematrix = $this->config->get('s_youtube_'. $module . '_code') ;

        $neo = explode(',', $thematrix);

        $theone = $neo[rand(0, count($neo) - 1)];
        
        $this->data['code']= html_entity_decode($theone, ENT_QUOTES);
    
		$this->id = 's_youtube';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/s_youtube.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/s_youtube.tpl';
		} else {
			$this->template = 'default/template/module/s_youtube.tpl';
		}
		$this->render();
	}
}
?>