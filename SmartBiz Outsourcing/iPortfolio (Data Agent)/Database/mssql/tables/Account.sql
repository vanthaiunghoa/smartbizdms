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
** Description: Create table [Account]
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

IF OBJECT_ID('dbo.Account', N'U') IS NULL
CREATE TABLE dbo.Account
( 
	Account_ID           IPCharID  NOT NULL ,
	Customer_ID          IPID  NOT NULL ,
	Enterprise_ID        IPID ,
	Request_Name         IPLongCode ,
	Request_URL          IPLongCode ,
	Account_login        IPLongCode ,
	Account_Pin          IPLongCode ,
	Account_New_Pin      IPLongCode ,
	Account_Second_Pin   IPLongCode ,
	Account_Login_2      IPLongCode ,
	Effective_Date       datetime  NULL ,
	Account_System_Identifier IPCharID  NULL ,
	Account_Name         IPName  NOT NULL ,
	Account_Type         IPCode  NULL ,
	Subaccount_ID        IPCharID  NOT NULL ,
	Inactive_Indicator   IPIndicator  NULL ,
	TaxID                IPLongCode ,
	Beneficiary_Tax_ID   IPLongCode ,
	Bene_Indicator       IPIndicator ,
	Start_Date           datetime  NULL ,
	IPorfolio_StartDate  datetime  NULL ,
	Taxable_Ind          IPIndicator ,
	Online_Access_Ind    IPIndicator ,
	Update_By            IPName  NULL ,
	Last_Update          datetime  NULL ,
	BA_Portfolio_ID      IPLongCode ,
	Account_Number       IPLongCode ,
	Account_Number_2     IPLongCode ,
	Basis                IPCode ,
	Captive_Ind          IPIndicator ,
	Update_Status_Info   IPLongCode ,
	Update_Status_Errcode IPCode ,
	Last_Update_Attemp   datetime  NULL 
)
go




IF OBJECT_ID('Account', N'U') IS NOT NULL
	PRINT '<<Success: Table Account is created.>>';
ELSE
	PRINT '<<Fail: Table Account is not created.>>';
GO

