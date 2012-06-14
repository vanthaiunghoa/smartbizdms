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
** Description: Create table [Portfolio_ROR]
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

IF OBJECT_ID('dbo.Portfolio_ROR', N'U') IS NULL
CREATE TABLE dbo.Portfolio_ROR
( 
	ROR_ID               IPID IDENTITY ,
	ROR_Summary_ID       IPID  NOT NULL ,
	Effective_Date       datetime  NULL ,
	Trade_Date           datetime  NULL ,
	Quantity             IPNumber  NULL ,
	Book_Value           IPNumber  NULL ,
	Base_Currency_Code   IPCode  NOT NULL ,
	NLS_Code             IPCode  NULL ,
	Cost_Basis           IPCode  NULL ,
	Beg_MV               IPNumber  NULL ,
	End_MV               IPNumber  NULL ,
	Period_Inflow        IPNumber  NULL ,
	Period_Outflow       IPNumber  NULL ,
	Purch_Total          IPNumber  NULL ,
	Sales_Total          IPNumber  NULL ,
	Turn_Over_Purch      IPNumber  NULL ,
	Turnover_Sales       IPNumber  NULL ,
	Market_Cap_Change    IPNumber  NULL ,
	Internal_Transfer    IPNumber  NULL ,
	External_Transfer    IPNumber  NULL ,
	Income_Earn          IPNumber  NULL ,
	Income_Collected     IPNumber  NULL ,
	Fees                 IPNumber  NULL ,
	Taxes                IPNumber  NULL ,
	Trans_Cost           IPNumber  NULL ,
	Capital_Appreciation IPNumber  NULL ,
	Total_ROR            IPNumber  NULL ,
	Currency_ROR         IPNumber  NULL ,
	Income_ROR           IPNumber  NULL ,
	Cum_Total_ROR        IPNumber  NULL ,
	Cum_Currency_ROR     IPNumber  NULL ,
	Cum_Inc_Ror          IPNumber  NULL ,
	Cum_Status           IPCode  NULL ,
	ROR_Status           IPCode  NULL ,
	Last_Update          datetime  NULL ,
	Update_Source        IPName  NULL 
)
go




IF OBJECT_ID('Portfolio_ROR', N'U') IS NOT NULL
	PRINT '<<Success: Table Portfolio_ROR is created.>>';
ELSE
	PRINT '<<Fail: Table Portfolio_ROR is not created.>>';
GO

