<?php
class ControllerPaymentPaymenexDirect extends Controller {
	protected function index() {
		$this->language->load('payment/paymenex_direct');
		
		$this->data['text_gateway_title'] = $this->language->get('text_gateway_title');
		$this->data['text_wait'] = $this->language->get('text_wait');		

		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['button_back'] = $this->language->get('button_back');
		
		$this->data['error_warning'] = "";
		$this->data['error_serial_no'] = "";		
		$this->data['error_card_no'] = "";
	    $this->data['error_pin_one'] = "";
	    $this->data['error_pin_two'] = "";
	    $this->data['error_pac_one'] = "";
	    $this->data['error_pac_two'] = "";
	    $this->data['error_exp_date'] = "";
	  
		$this->data['p_serial_no'] = isset($_POST["p_serial_no"])?$_POST["p_serial_no"]:"";
		$step=isset($_POST["step"])?$_POST["step"]:0;
								
		if($_SERVER['REQUEST_METHOD'] == "POST") 
			{ $step=$this->gatewayProcess($step); }
		
		$this->data['text_serial_no'] 	= $this->language->get('text_serial_no');
		if($step==2) { 
		  $this->data['text_card_no'] 		= $this->language->get('text_card_no');
		  $this->data['text_pin_no']	    = $this->language->get('text_pin_no');
		  $this->data['text_pac_code']  	= $this->language->get('text_pac_code');
		  $this->data['text_card_exp'] 		= $this->language->get('text_card_exp');
		}
		
		if($step==2 && $this->request->get['route'] != 'checkout/guest_step_3') 
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/confirm';
		elseif($step!=2 && $this->request->get['route'] != 'checkout/guest_step_3') 
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/payment';
	    elseif($step==2)
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/guest_step_3';
	    else 
			$this->data['back'] = HTTPS_SERVER . 'index.php?route=checkout/guest_step_2';
			
		$this->data['step'] = $step;		
		$this->data['months'] = array();		
		for ($i = 1; $i <= 12; $i++) {
			$this->data['months'][] = array(
				'text'  => strftime('%B', mktime(0, 0, 0, $i, 1, 2000)), 
				'value' => sprintf('%02d', $i)
			);
		}
				
		$today = getdate();
		$this->data['year_expire'] = array();
		for ($i = $today['year']; $i < $today['year'] + 11; $i++) {
			$this->data['year_expire'][] = array(
				'text'  => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)),
				'value' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)) 
			);
		}
		
		/*----------------------------------------------------------------------*/
		if (isset($this->request->post['p_serial_no'])) {
			$this->data['p_serial_no'] = $this->request->post['p_serial_no'];
		} else {
			$this->data['p_serial_no'] = '';
		}
		if (isset($this->request->post['p_card_no'])) {
			$this->data['p_card_no'] = $this->request->post['p_card_no'];
		} else {
			$this->data['p_card_no'] = '';
		}
		if (isset($this->request->post['p_pin_one'])) {
			$this->data['p_pin_one'] = $this->request->post['p_pin_one'];
		} else {
			$this->data['p_pin_one'] = '';
		}
		if (isset($this->request->post['p_pin_two'])) {
			$this->data['p_pin_two'] = $this->request->post['p_pin_two'];
		} else {
			$this->data['p_pin_two'] = '';
		}
		if (isset($this->request->post['p_pac_code_one'])) {
			$this->data['p_pac_code_one'] = $this->request->post['p_pac_code_one'];
		} else {
			$this->data['p_pac_code_one'] = '';
		}
		if (isset($this->request->post['p_pac_code_two'])) {
			$this->data['p_pac_code_two'] = $this->request->post['p_pac_code_two'];
		} else {
			$this->data['p_pac_code_two'] = '';
		}
		if (isset($this->request->post['p_card_exp_month'])) {
			$this->data['p_card_exp_month'] = $this->request->post['p_card_exp_month'];
		} else {
			$this->data['p_card_exp_month'] = '';
		}
		if (isset($this->request->post['p_card_exp_year'])) {
			$this->data['p_card_exp_year'] = $this->request->post['p_card_exp_year'];
		} else {
			$this->data['p_card_exp_year'] = '';
		}
		/*----------------------------------------------------------------------*/
		$this->id = 'payment';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/paymenex_direct.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/paymenex_direct.tpl';
		} else {
			$this->template = 'default/template/payment/paymenex_direct.tpl';
		}	
		
		$this->render();		
	}
	
	protected function gatewayProcess($step) {  
			global $db, $arrParam;
			
			include_once(DIR_APPLICATION . "controller/payment/paymenex_direct_config/config.php");
			include_once(DIR_APPLICATION . "controller/payment/paymenex_direct_config/action_code.php");
			include_once(DIR_APPLICATION . "controller/payment/paymenex_direct_config/error.php");
			include_once(DIR_APPLICATION . "controller/payment/paymenex_direct_config/i_setting.php");
			
			if($_SERVER['REQUEST_METHOD'] == "POST" && $step==2) {
				$error = false; 
				if(empty($_POST["p_serial_no"])){
					$this->data['error_serial_no']=$this->language->get('error_serial_no');
					$error=true;
				}
				if(empty($_POST["p_merchant_id"])){
					$this->data['error_warning']=$this->language->get('error_merchant_id');
					$error=true;
				}
				if($error){
					$step=1;				
				}
				if(!$error){
					$this->data['error_warning']="";		
					/* Generate D-Voucher of the selected Denomination for agent */
					$_POST["p_act_id"]=$_ACTION_CODE["MTCON"];
					$strPostValues=GetRequestVariables();
					$arrDataXML = GetUrlData($strPostValues);
					if(trim($arrDataXML[3]["value"])=="001") {
						$isDataFetch=true;
					}else if(trim($arrDataXML[3]["value"])=="003"||trim($arrDataXML[3]["value"])=="002") {
						$arrErrors = GetTreeValues('ERROR',$arrDataXML);
						for($i=0;$i<count($arrErrors);$i++){
							$this->data['error_warning'].=($this->data['error_warning']?"<br />":"").$_RCODE[$arrErrors[$i]["ERROR_CODE"]];
							$error=true;
						}			
					}else{
						$this->data['error_warning']=$this->language->get('error_gateway');
						$error=true;
					}
					if($error){
						$step=1;				
					}
					if(isset($isDataFetch) && $isDataFetch){
						$arrOutPut = GetTreeValues('CARDDATA',$arrDataXML);					  
						$this->session->data['GET_LOCK']=$arrOutPut;
						$this->data['arrOutPut'] = $arrOutPut;
					}
				}				
			}
		
			if($_SERVER['REQUEST_METHOD'] == "POST" && $step==3) { 			
					$error=false;
					$arrOutPut=$this->session->data['GET_LOCK'];
					$this->data['arrOutPut'] = $arrOutPut;
					if(empty($arrOutPut)){
						$step=1;
						$this->data['error_warning']=$this->language->get('error_gateway');
						$error=true;						
					}
					if(empty($_POST["p_card_no"])){
						$this->data['error_card_no']=$this->language->get('error_card_no');
						$error=true;
					}
					if(!empty($arrOutPut[0]["P_PIN_ONE"])) {
						if($_POST["p_pin_one"]==""){ 
							$this->data['error_pin_one']=str_replace("#PIN#",$arrOutPut[0]["P_PIN_ONE"],$this->language->get('error_pin'));
							$error=true;							
						}
					}
					if(!empty($arrOutPut[0]["P_PIN_TWO"])) {
						if($_POST["p_pin_two"]==""){ 
							$this->data['error_pin_two']=str_replace("#PIN#",$arrOutPut[0]["P_PIN_TWO"],$this->language->get('error_pin'));
							$error=true;
						}
					}
					if(!empty($arrOutPut[0]["P_PAC_CODE_ONE"]) && empty($_POST["p_pac_code_one"])){
						$this->data['error_pac_one']=str_replace("#OPTION#",$arrOutPut[0]["P_PAC_CODE_ONE"],$this->language->get('error_pac_code'));
						$error=true;
					}
					if(!empty($arrOutPut[0]["P_PAC_CODE_TWO"]) && empty($_POST["p_pac_code_two"])){
						$this->data['error_pac_two']=str_replace("#OPTION#",$arrOutPut[0]["P_PAC_CODE_TWO"],$this->language->get('error_pac_code'));
						$error=true;
					}					
					if(!empty($arrOutPut[0]["VAL_CARD_EXP"]) && $arrOutPut[0]["VAL_CARD_EXP"]=="Y") {
						if(empty($_POST["p_card_exp_month"])){
							$this->data['error_exp_date']=$this->language->get('error_exp_month');
							$error=true;
						}		
						elseif(empty($_POST["p_card_exp_year"])){
							$this->data['error_exp_date']=$this->language->get('error_exp_year');
							$error=true;
						}
					}
					
					$this->load->model('checkout/order');
					$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

					$amt=$this->currency->format($order_info['total'], $order_info['currency'], 1.00000, FALSE);
					$remark=$this->config->get('config_name')."(".$_SERVER['HTTP_HOST'].") ". date('Y-m-d-h-i-s') ." ".$this->currency->getCode()." ".$amt;
				    $_POST["p_order_no"]=$this->session->data['order_id'];
					$_POST["p_trans_cur"]=$this->currency->getCode();
					$_POST["p_amount"]=$amt;
					$_POST["p_remark"]=$remark;
					
					if(empty($_POST["p_trans_cur"])){
						$this->data['error_warning']=$this->language->get('error_trans_cur');
						$error=true;
					}
					elseif(empty($_POST["p_amount"])){
						$this->data['error_warning']=$this->language->get('error_amount');
						$error=true;
					}elseif(!is_numeric($_POST["p_amount"])){
						$this->data['error_warning']=$this->language->get('error_amount');
						$error=true;
					}
					elseif(empty($_POST["p_order_no"])){
						$this->data['error_warning']=$this->language->get('error_order_no');
						$error=true;
					}
					
					if($error){ $step=2; }
					if(!$error) { 
						$this->data['error_warning']="";
						/* Generate D-Voucher of the selected Denomination for agent */
						$_POST["p_act_id"]=$_ACTION_CODE["MTPAY"];
						$strPostValues=GetRequestVariables();
						$arrDataXML = GetUrlData($strPostValues);
						if(trim($arrDataXML[3]["value"])=="001") {
							$isDataFetch=true;
						}else if(trim($arrDataXML[3]["value"])=="003"||trim($arrDataXML[3]["value"])=="002") {
							$arrErrors = GetTreeValues('ERROR',$arrDataXML);
							for($i=0;$i<count($arrErrors);$i++){
								$this->data['error_warning'].=($this->data['error_warning']?"<br />":"").$_RCODE[$arrErrors[$i]["ERROR_CODE"]];
								$error=true;
							}			
						}else{
							$this->data['error_warning']=$this->language->get('error_gateway');
							$error=true;
						}
						if($error){ $step=2; }
						if(isset($isDataFetch) && $isDataFetch) {
							$arrOnlineData = GetTreeValues('CARDDATA',$arrDataXML);
							
							$exactname=array("TRANS_ID"=>"Paymenex Transaction ID","TRANS_DATE"=>"Transaction Date","ORDER_NUMBER"=>"Order No","SERIAL_NO"=>"Serial No","PROCESS_CURR_CODE"=>"Processed Currency","PROCESS_AMT"=>"Processed Amount","TRANS_CURR_CODE"=>"Transaction Currency code","TRANS_AMT"=>"Transaction Amount","TRANS_TYPE"=>"Transaction Type","SHORTNAME"=>"Merchant","CARD_NO"=>"Card No","POST_TYPE"=>"Paymenex Gateway");
							$message = $this->language->get('text_title').' Transaction' . "\n\n" .
						    'Date: ' . strftime($order_info["date_added"]) . "\n" .
						    'IP Address: ' . $_SERVER['REMOTE_ADDR'];		
							$message .= "\n\n" . 'Gateway Response:' . "\n\n";					
							if (!empty($arrOnlineData[0])) {
							  foreach ($arrOnlineData[0] as $key => $value) {
								if($key=="MERCHANT_REF_NO") continue;
								$message .= $exactname[$key] . '=' . $value . "\n";
							  }
							} else {
							  $message .= '(empty)' . "\n";
							}
							clearfields();
							unset($this->session->data['GET_LOCK']);											
							$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('paymenex_direct_order_status_id'), $message, TRUE);
							
							$this->redirect(HTTPS_SERVER . 'index.php?route=checkout/success');
						}
					}
			}
			return $step;
	}
	
	public function callback() {
		
	}
}
?>