<?php  

class ControllerModulesharethis extends Controller {
	protected function index() {
		$this->load->language('module/sharethis');
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
$this->data['social']["aim"]	=	"AIM";
$this->data['social']["bebo"]	=	"Bebo";
$this->data['social']["blinklist"]	=	"Blinklist";
$this->data['social']["blogger"]	=	"Blogger";
$this->data['social']["businessweek"]	=	"Busienss Week";
$this->data['social']["care2"]	=	"Care2";
$this->data['social']["current"]	=	"Current";
$this->data['social']["dealsplus"]	=	"Dealspl.us";
$this->data['social']["delicious"]	=	"Delicious";
$this->data['social']["digg"]	=	"Digg";
$this->data['social']["dilgo"]	=	"Diigo";
$this->data['social']["facebook"]	=	"Facebook";
$this->data['social']["fark"]	=	"Fark";
$this->data['social']["faves"]	=	"Faves";
$this->data['social']["fresqui"]	=	"Fresqui";
$this->data['social']["friendfeed"]	=	"FriendFeed";
$this->data['social']["funp"]	=	"Funp";
$this->data['social']["gbuzz"]	=	"Google Buzz";
$this->data['social']["google_bmarks"]	=	"Google Bookmark";
$this->data['social']["kirsty"]	=	"Kirsty";
$this->data['social']["linkedin"]	=	"Linkedin";
$this->data['social']["meaneame"]	=	"Meaneame";
$this->data['social']["messenger"]	=	"Messenger";
$this->data['social']["mister_wong"]	=	"Mr Wong";
$this->data['social']["mixx"]	=	"Mixx";
$this->data['social']["myspace"]	=	"MySpace";
$this->data['social']["n4g"]	=	"N4G";
$this->data['social']["newsvine"]	=	"Newsvine";
$this->data['social']["oknotizie"]	=	"Oknotizie";
$this->data['social']["propeller"]	=	"Propeller";
$this->data['social']["reddit"]	=	"Reddit";
$this->data['social']["simpy"]	=	"Simpy";
$this->data['social']["slashdot"]	=	"Slashdot";
$this->data['social']["sonico"]	=	"Sonico";
$this->data['social']["sphinn"]	=	"Spinn";
$this->data['social']["stumbleupon"]	=	"StumbleUpon";
$this->data['social']["technorati"]	=	"Technorati";
$this->data['social']["twackle"]	=	"Twackle";
$this->data['social']["twine"]	=	"Twine";
$this->data['social']["twitter"]	=	"Twitter";
$this->data['social']["windows_live"]	=	"Windows Live";
$this->data['social']["xanga"]	=	"Xanga";
$this->data['social']["yahoo_bmarks"]	=	"Y! Bookmarks";
$this->data['social']["ybuzz"]	=	"Yahoo!";
$this->data['social']["yigg"]	=	"Yigg";
$this->data['social']["email"]	=	"Email";
$this->data['social']["sharethis"]	=	"Share This";
$this->data['social']["plusone"]	=	"Google +";



		$this->id       = 'sharethis';
		$this->data['pub_id'] = html_entity_decode($this->config->get('pub_id'));
		
		$this->data['display_soption'] = html_entity_decode($this->config->get('display_soption'));
		
		
		$this->data['widget_option'] = html_entity_decode($this->config->get('widget_option'));
		
		$this->data['social_btnorder'] = html_entity_decode($this->config->get('social_btnorder'));
		
		$this->data['sharethiscode']	=	"";
		if($this->data['display_soption']=="classic") { 
			$this->data['sharethiscode']	=	"<span class='st_sharethis' displayText='ShareThis'></span>";
		} else {
		
			foreach(explode(",",$this->data['social_btnorder']) as $ico) {
			 
				if($this->data['display_soption']=="regnotext") {
					$display_text	=	"";
				} else if($this->data['display_soption']=="reg") {
					if(!isset($this->data['social'][$ico])) {
						$social_ico	=	$ico;
					} else {
						$social_ico	=	$this->data['social'][$ico];
					}
					$display_text	=	"displayText='".$social_ico."'";    	
				} else if($this->data['display_soption']=="buttons") {
					$display_text	=	"share";
				} else {
					$display_text	=	"";
				}
				
				if($this->data['display_soption']=="reg" || $this->data['display_soption']=="regnotext") {
					$dopt	=	"";
				} else {
					$dopt	=	"_".$this->data['display_soption'];	    
				}			
			
				$this->data['sharethiscode']	.=	"<span class='st_".$ico.$dopt."' ".$display_text."></span>";
			}
		} 

//		$this->data['sharethiscode']	.=	"<br /><br /><i>By <a href='http://www.creativeglance.com'>Creative Glance</a></i>";
		$this->template = $this->config->get('config_template') . '/template/module/sharethis.tpl';
		
		$this->render();
	}
}
?>