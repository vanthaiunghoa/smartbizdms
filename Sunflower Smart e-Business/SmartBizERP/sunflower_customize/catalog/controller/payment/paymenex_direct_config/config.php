<?php	
	/*secret_key,iv key , izenid, p_termnal_id ,p_termnal_key are the parameters of a Terminal
	and can be obtained from Paymenex Agent Module .These values are specific to Terminal
	and differs for every terminal*/
	$_POST["p_merchant_id"]  		    = $this->config->get('paymenex_direct_merchant');
	$arrParam["merchant"]["cipher"]     = "rijndael-128";
	$arrParam["merchant"]["mode"]       = "cbc";
	$arrParam["merchant"]["secret_key"] = $this->config->get('paymenex_direct_secret_key');
	$arrParam["merchant"]["iv_key"]     = $this->config->get('paymenex_direct_iv_key');
	$arrParam["merchant"]["izenid"]     = $this->config->get('paymenex_direct_izen_id');
	
	$query = $db->query("SELECT * FROM " . DB_PREFIX . "country where country_id=".$this->config->get('config_country_id'));
		
	$_POST["p_mode"]                 	= "L";	
	$_POST["p_local_curr_code"]      	= $this->config->get('config_currency');
	$_POST["p_country_name"]      		= $query->row["name"];
	$arrParam["merchant"]["urlPath"] 	= "https://www.paymenex.com/vt_x/apiMerchantTransNet.do";
?>