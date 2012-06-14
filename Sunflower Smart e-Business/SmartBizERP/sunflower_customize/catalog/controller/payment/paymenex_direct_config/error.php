<?php

/* Response Code coming from gateway */

$_RESPONSE["001"] = "Approved Transaction or Operation Successfully";

$_RESPONSE["002"] = "Declined Transaction or Operation Failed";

$_RESPONSE["003"] = "Error Transaction or Error in Operation";



/* Error code Coming from Gateway */

$_RCODE["100"]="Transaction successful";

$_RCODE["001"]="This transaction has been approved";

$_RCODE["002"]="This transaction has been declined";	

$_RCODE["500"]="izen ID is Missing";

$_RCODE["501"]="Invalide Izen Id for This Merchant";

$_RCODE["502"]="Invalide IV key or Secret Key";

$_RCODE["503"]="Cant't process transaction as PAC value Should Be Numeric.";

$_RCODE["504"]="Invalid Transaction Action Type.";

$_RCODE["505"]="This Merchant ID doesnt Match With Merchant id Provided with izen id.";

$_RCODE["506"]="Merchant ID Should Be Numeric.";

$_RCODE["507"]="Card/D-Voucher No length should be 16 digits.";

$_RCODE["508"]="Invalide Serial No or length should be 10 digits.";

$_RCODE["509"]="Serial No should be numeric value";

$_RCODE["510"]="Transaction mode is not set.";

$_RCODE["511"]="Invalid Transaction Mode specified, please specify [L-Live or T-Test]";

$_RCODE["512"]="Can not process this transaction as Merchant Account has been temporarily suspended, cancelled";

$_RCODE["513"]="Can not process this transaction as Aquirer Account of this Merchant has been temporarily suspended, cancelled";

$_RCODE["514"]="Can not process this transaction as Merchant Account does not exist for this Merchand id.";

$_RCODE["515"]="Unknown Error Occurred.";

$_RCODE["516"]="Merchant Id is missing.";

$_RCODE["517"]="Unable to Authenticate Merchant, check Merchant Id.";

$_RCODE["518"]="Card/D-Voucher Serial No is Missing.";

$_RCODE["519"]="Invalid Card Serial No.";

$_RCODE["520"]="Card/D-voucher is expired.";

$_RCODE["521"]="Card/D-voucher is cancelled.";

$_RCODE["522"]="Transaction session id is missing";

$_RCODE["523"]="CardNo/D-Voucher No is missing";

$_RCODE["524"]="Unable to validate Card/D-Voucher, please check the serial no/card no";

$_RCODE["525"]="Card/D-Voucher can not be used for online Payments.";

$_RCODE["526"]="The Card has No Permission for this Operation.";

$_RCODE["527"]="Card/D-Voucher Expiry Month is missing";

$_RCODE["528"]="Card/D-Voucher Expiry Year is missing";

$_RCODE["529"]="Transaction Mode supplied for Transaction session ID doesn't match";

$_RCODE["530"]="Transaction session ID is Expired";

$_RCODE["531"]="Transaction session ID is already used";

$_RCODE["532"]="Card/D-Voucher WebKey is missing for pin sequence random digit one";

$_RCODE["533"]="Card/D-Voucher WebKey is missing for pin sequence random digit two";

$_RCODE["534"]="Transaction session ID validation failed, please cross check the parameters supplied";

$_RCODE["535"]="Can not process this transaction as Customer Account is invalid";

$_RCODE["536"]="Card/D-Voucher Expiry Date Doesn't Match with there cords";

$_RCODE["537"]="Can't Proceed Transaction, Card is Sleeping.";

$_RCODE["538"]="Can't Proceed, Country Access Permission Denied.";

$_RCODE["539"]="Pin Authentication Failed.";

$_RCODE["540"]="PAC value not supplied for First Co-ordinate";

$_RCODE["541"]="PAC value not supplied for Secound Co-ordinate";

$_RCODE["542"]="Only numeric data is allowed for First PAC Co-ordinate";

$_RCODE["543"]="PAC Authentication Failed.";

$_RCODE["544"]="Invalid Transaction amount provided";

$_RCODE["545"]="Transaction amount should be greater than zero.";

$_RCODE["546"]="Transaction currency code is missing.";

$_RCODE["547"]="Invalid Transaction currency code.	";

$_RCODE["548"]="You are not authorized for the given Transaction currency.";

$_RCODE["549"]="In sufficient fund available in Card/D-voucher.";

$_RCODE["550"]="Unknown error occurred.please try again later."; 

?>