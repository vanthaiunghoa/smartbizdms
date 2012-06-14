<?php 
	/* GetRequestVariables :: method Returns the String of Key and Value from POST Request */
	function GetRequestVariables() {
		global $HTTP_POST_VARS,$_POST;		
		//if(empty($HTTP_POST_VARS))
		$HTTP_POST_VARS=$_POST;
		$request="";
		if ($HTTP_POST_VARS)
				{
					for(reset($HTTP_POST_VARS); $key = key($HTTP_POST_VARS); next
					($HTTP_POST_VARS))
						{
						if (is_array($HTTP_POST_VARS[$key]))
								{
								$num=count($HTTP_POST_VARS[$key]);
								for ($i=0; $i<$num; $i++)
										if(!empty($request))
											$request.="&";
										$request.="$key"."[$i] =".$HTTP_POST_VARS[$key][$i];
								}
						else
								{
									if(!empty($request))
										$request.="&";
							$request.="$key=".$HTTP_POST_VARS[$key];
								}
						}
			}
		return $request;
	}
	
	/* Clear all post fields */
	function clearfields(){
		unset($_POST);
	}
	
	/* GetUrlData :: Method Post the Parameter String to Paymenex and Bring the Response XML
	   Method also encrypt the Parameter String before posting it to Paymenex	
	 */
	 
	 
	 function GetUrlData($strVariables){
		global $arrParam;
		
		if (!function_exists('curl_init')) die("Curl is not installed.");
		if (!function_exists('mcrypt_module_open')) die("mcrypt_module_open function is unknown.");
		if (!function_exists('xml_parser_create')) die("xml_parser_create function is unknown.");
		if (!function_exists('bin2hex')) die("bin2hex function is unknown.");
		
		$cipher     = $arrParam["merchant"]["cipher"];
		$mode       = $arrParam["merchant"]["mode"];	
		$izenid 	= $arrParam["merchant"]["izenid"];
		$iv		 	= $arrParam["merchant"]["iv_key"];
		$secret_key = $arrParam["merchant"]["secret_key"];		
		$strUrl     = $arrParam["merchant"]["urlPath"];
		
		$td = mcrypt_module_open($cipher, "", $mode, $iv);
		mcrypt_generic_init($td, trim($secret_key), $iv);
		$cyper_text = mcrypt_generic($td, $strVariables);
		$szReturn = bin2hex($cyper_text);
		mcrypt_generic_deinit($td);
		mcrypt_module_close($td);	
		$encRequest="izenid=".$izenid."&enc=".$szReturn;
		$chObject =curl_init();
		curl_setopt($chObject, CURLOPT_URL, $strUrl);
		curl_setopt($chObject, CURLOPT_POST, 1);
		curl_setopt($chObject, CURLOPT_POSTFIELDS,$encRequest);
		curl_setopt($chObject, CURLOPT_VERBOSE, 1);
		curl_setopt ($chObject, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($chObject, CURLOPT_RETURNTRANSFER , 1);
		curl_setopt($chObject, CURLOPT_TIMEOUT, 500);
		$rsOutPut=curl_exec($chObject);
		$rsOutPut=trim($rsOutPut);				
		$objXML = xml_parser_create();
		xml_parse_into_struct($objXML,$rsOutPut, $vals, $index);
		xml_parser_free($objXML);
		return $vals;
	}
	    
	/* GetTreeValues :: This method Retrive  Childs[Keys amd values ] of a specific node into array From the Return XML */
	function GetTreeValues($szkey,$arrXML){
		$arrReturn = array(); 
		$x=0;
		$blnIsPresent =false;
		$isSkip= false;
		for($p=0;$p<count($arrXML);$p++){						
			if(strtoupper($arrXML[$p]["tag"])==$szkey && strtolower($arrXML[$p]["type"])=="open"){													
				$blnIsPresent=true;
				$isSkip=true;	
			}else if(strtoupper($arrXML[$p]["tag"])==$szkey && strtolower($arrXML[$p]["type"])=="close"){													
				$blnIsPresent=false;
				$isSkip=false;
				if($szkey!="ERROR")
					$x++;
			}
						
			if($blnIsPresent && !$isSkip){
				$arrReturn[$x][strtoupper($arrXML[$p]["tag"])]=$arrXML[$p]["value"];
				if($szkey=="ERROR")
					$x++;
			}
			$isSkip=false;
			
		}
		return $arrReturn;
	}
	
	function isValidDate($dt,$dtFormat){
		$isDateFlag =false;
		$arr=split("/",$dt); // splitting the array		
		if($dtFormat=="MM/DD/YYYY"){
			$mm=$arr[0]; 
			$dd=$arr[1]; 
			$yy=$arr[2]; 
		}else if($dtFormat=="DD/MM/YYYY"){
			$mm=$arr[1]; 
			$dd=$arr[0]; 
			$yy=$arr[2]; 
		}else if($dtFormat=="YYYY/MM/DD"){
			$mm=$arr[1]; 
			$dd=$arr[2]; 
			$yy=$arr[0]; 
		}		
		If(checkdate($mm,$dd,$yy))
			$isDateFlag=true;
		return $isDateFlag;	
	} 
		
?>