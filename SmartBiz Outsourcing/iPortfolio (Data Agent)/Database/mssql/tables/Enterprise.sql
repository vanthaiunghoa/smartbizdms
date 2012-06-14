/*****************************************************************************************************************************
** iPortfolio - iPortfolio Project CONFIDENTIAL
** Unpublished Copyright © 2011 iPortfolio, All Rights Reserved. 
** 
** NOTICE:  All information contained herein is, and remains the property of COMPANY. The intellectual and technical concepts 
** contained herein are proprietary to COMPANY and may be covered by patents in process, and are protected by trade secret or 
** copyright law.
** Dissemination of this information or reproduction of this material is strictly forbidden unless prior written permission 
** is obtained from COMPANY. Access to the source code contained herein is hereby forbidden to anyone except current COMPANY 
** employees, managers or contractors who have executed Confidentiality and Non-disclosure agreements explicitly covering
** such access.
** 
** The copyright notice above does not evidence any actual or intended publication or disclosure  of  this source code, 
** which includes information that is confidential and/or proprietary, and is a trade secret, of  COMPANY. ANY REPRODUCTION, 
** MODIFICATION, DISTRIBUTION, PUBLIC  PERFORMANCE, OR PUBLIC DISPLAY OF OR THROUGH USE  OF THIS  SOURCE CODE WITHOUT  
** THE EXPRESS WRITTEN CONSENT OF COMPANY IS STRICTLY PROHIBITED, AND IN VIOLATION OF APPLICABLE LAWS AND INTERNATIONAL
** TREATIES. THE RECEIPT OR POSSESSION OF  THIS SOURCE CODE AND/OR RELATED INFORMATION DOES NOT CONVEY OR IMPLY ANY RIGHTS   
** TO REPRODUCE, DISCLOSE OR DISTRIBUTE ITS CONTENTS, OR TO MANUFACTURE, USE, OR SELL ANYTHING THAT IT  MAY DESCRIBE, 
** IN WHOLE OR IN PART.   
**
** Description: Create table [Enterprise]
**
** Author: QuanPhan
** Email: quan@dataagent.com
**
******************************************************************************************************************************
** Change History
******************************************************************************************************************************
** Date			  Author		Version		Description
** __________	____________	_______		__________________________________________________________________________________
** 07/21/2011	QuanPhan		  1.0			  Create the file
*****************************************************************************************************************************/	
IF DB_NAME() = 'master'
	USE iPortfolio;
GO

IF DB_NAME() = 'master'
BEGIN
	RAISERROR('<<FAIL: Please run this script in the correct database.>>', 10, 1) WITH NOWAIT;
	RETURN;
END;

IF OBJECT_ID('dbo.Enterprise', N'U') IS NULL
CREATE TABLE dbo.Enterprise
( 
	Enterprise_ID        IPID  NOT NULL ,
	Enterprise_Type      IPCode  NULL ,
	Enterprise_Name      IPName  NULL ,
	Enterprise_Name2     IPName  NULL ,
	Registration_ID      IPCode  NULL ,
	Registration_Name    IPName  NULL ,
	Registration_Type    IPCode  NULL ,
	Custodian_Code       IPCode  NULL ,
	Custodian_Name       IPName  NULL ,
	Customer_Account_Code IPCode  NULL ,
	Customer_Code        IPCode  NULL ,
	Domicile_Code        IPCode  NULL ,
	Domicile_Name        IPName  NULL ,
	UDF_Money_Field_2    IPNumber  NULL ,
	UDF_Money_Field_3    IPNumber  NULL ,
	UDF_Money_Field_4    IPNumber  NULL ,
	UDF_Money_Field_5    IPNumber  NULL ,
	UDF_Money_Field_6    IPNumber  NULL ,
	UDF_Money_Field_7    IPNumber  NULL ,
	UDF_Money_Field_8    IPNumber  NULL ,
	UDF_Rate_Field_1     IPNumber  NULL ,
	UDF_Rate_Field_2     IPNumber  NULL ,
	UDF_Rate_Field_3     IPNumber  NULL ,
	UDF_Rate_Field_4     IPNumber  NULL ,
	UDF_Date_Field_1     datetime  NULL ,
	UDF_Date_Field_2     datetime  NULL ,
	UserLogin_URL        IPName  NULL ,
	REQ_ChangePW         IPIndicator ,
	REQ_SecondPW         IPIndicator ,
	REQ_Multi_Account    IPIndicator ,
	REQ_Download_Login   IPIndicator ,
	REQ_Initial_Login    IPIndicator ,
	Service_Category     IPCode ,
	REQ_SQA              IPIndicator ,
	SUP_Account_discovery IPIndicator ,
	Access_Instructions  IPLongString ,
	Account_Number_Details IPLongString ,
	Account_Login_Term   IPLongCode ,
	Account_Pin_term     IPLongCode ,
	Account_Pin_Details  IPLongString ,
	Account_Second_Pin_term IPLongCode ,
	Account_Second_Pin_Details IPLongString ,
	Account_Number_2_terms IPMaxString ,
	Account_Number_2_Details IPLongString ,
	Account_Login_2_term IPLongCode ,
	Account_Login_2_Details IPMaxString ,
	SQA_Question_term    IPLongCode ,
	SQA_Answer_term      IPLongCode ,
	SQA_Instructions     IPLongString ,
	Last_Update          datetime  NULL ,
	Update_By            IPLongCode 
)
go




IF OBJECT_ID('Enterprise', N'U') IS NOT NULL
	PRINT '<<Success: Table Enterprise is created.>>';
ELSE
	PRINT '<<Fail: Table Enterprise is not created.>>';
GO

