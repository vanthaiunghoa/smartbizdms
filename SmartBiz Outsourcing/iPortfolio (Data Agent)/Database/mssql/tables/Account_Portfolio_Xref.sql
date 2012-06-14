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
** Description: Create table [Account_Portfolio_Xref]
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

IF OBJECT_ID('dbo.Account_Portfolio_Xref', N'U') IS NULL
CREATE TABLE dbo.Account_Portfolio_Xref
( 
	Customer_Account_Invest_ID IPID  NOT NULL ,
	Account_ID           IPCharID  NOT NULL ,
	Customer_ID          IPID  NOT NULL ,
	Portfolio_ID         IPCharID  NOT NULL ,
	Customer_Mapping_Account_Rule IPString  NULL ,
	Mapping_Rule         IPCode ,
	Mapping_Rule_Type    IPString  NULL ,
	Rule_System_Identifier IPString  NULL ,
	Rule_Description     IPLongString  NULL ,
	Start_Date           datetime  NULL ,
	End_Date             datetime  NULL ,
	UDF_ID_Field_1       IPString  NULL ,
	UDF_ID_Field_2       IPString  NULL ,
	UDF_Money_Field_1    IPNumber  NULL ,
	UDF_Money_Field_2    IPNumber  NULL ,
	UDF_Money_Field_3    IPNumber  NULL ,
	UDF_Money_Field_4    IPNumber  NULL ,
	UDF_Money_Field_5    IPNumber  NULL ,
	Last_Update          datetime  NULL ,
	Update_Source        IPName  NULL ,
	Manager_ID           IPID ,
	Enterprise_ID        IPID 
)
go




IF OBJECT_ID('Account_Portfolio_Xref', N'U') IS NOT NULL
	PRINT '<<Success: Table Account_Portfolio_Xref is created.>>';
ELSE
	PRINT '<<Fail: Table Account_Portfolio_Xref is not created.>>';
GO

