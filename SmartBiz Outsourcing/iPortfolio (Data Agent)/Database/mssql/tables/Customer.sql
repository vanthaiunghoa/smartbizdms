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
** Description: Create table [Customer]
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

IF OBJECT_ID('dbo.Customer', N'U') IS NULL
CREATE TABLE dbo.Customer
( 
	Customer_ID          IPID  NOT NULL ,
	Customer_Role        IPCode  NULL ,
	Title                IPCode  NULL ,
	Salutation           IPString ,
	Customer_Name        IPName  NULL ,
	Customer_Name_2      IPName  NULL ,
	Customer_First_Name  IPString  NULL ,
	Customer_Last_Name   IPString  NULL ,
	Postal_Code          IPCode  NULL ,
	Country_Code         IPCode ,
	Email_Address        IPName  NOT NULL ,
	NLS_Code             IPCode  NULL ,
	Personal_Greeting    IPString  NULL ,
	Phonetic_Identifier  IPString  NULL ,
	Date_of_Birth        datetime  NULL ,
	Date_of_Death        datetime  NULL ,
	Sex                  IPCode  NULL ,
	Citizenship_Code     IPCode  NULL ,
	Country_of_Residence IPCode  NULL ,
	State_of_Residence   IPCode  NULL ,
	Legal_Identification_Number IPString  NULL ,
	Legal_Identification_Type IPCode  NULL ,
	Tax_ID               IPLongCode ,
	Investment_Industry  IPCode  NULL ,
	Sort_Key             IPName  NULL ,
	Start_Date           datetime  NULL ,
	End_Date             datetime  NULL ,
	UDF_Text_1           IPName  NULL ,
	UDF_Text_2           IPName  NULL ,
	UDF_Date_1           datetime  NULL ,
	UDF_Date_2           datetime  NULL ,
	User_ID              IPLongCode ,
	User_Key             IPID  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Customer', N'U') IS NOT NULL
	PRINT '<<Success: Table Customer is created.>>';
ELSE
	PRINT '<<Fail: Table Customer is not created.>>';
GO

