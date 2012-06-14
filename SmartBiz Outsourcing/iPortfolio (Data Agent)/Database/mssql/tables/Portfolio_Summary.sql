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
** Description: Create table [Portfolio_Summary]
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

IF OBJECT_ID('dbo.Portfolio_Summary', N'U') IS NULL
CREATE TABLE dbo.Portfolio_Summary
( 
	Summary_ID           IPID  NOT NULL ,
	Portfolio_ID         IPCharID  NOT NULL ,
	Manager_ID           IPID  NULL ,
	Enterprise_ID        IPID  NULL ,
	Valuation_Type       IPCode  NULL ,
	Valuation_Basis      IPCode  NULL ,
	Base_Currency_Code   IPCode  NOT NULL ,
	Cost_Basis_Code      IPCode  NULL ,
	Cost_Value_Basis_ID  IPCode  NULL ,
	ETL_Control_ID       IPCharID  NOT NULL ,
	Parameter_Set_ID     IPID  NOT NULL ,
	Reference_ID         IPCharID  NOT NULL ,
	Extract_Control_ID   IPCharID  NULL ,
	Summary_Reference_ID IPCharID  NULL ,
	Cost_Value_Component_ID IPCode ,
	Created_Date         datetime  NULL ,
	Load_Completion_Date datetime  NULL ,
	Summary_Data_Type    IPCode  NOT NULL ,
	Accounting_Date      datetime  NOT NULL ,
	Adjusted_Date        datetime  NOT NULL ,
	Effective_Date       datetime  NULL ,
	Trade_Date           datetime  NULL ,
	NLS_Code             IPCode  NULL ,
	Row_Count            IPInt  NULL ,
	Load_Status          IPCode  NULL ,
	Audit_Status         IPCode  NULL ,
	Quality_Rating_Source IPCode  NULL ,
	Security_Characteristics_Source IPCode  NULL ,
	Description_Source_Type IPCode ,
	Carrying_Value_Base  IPNumber  NULL ,
	Cash_Value_Base      IPNumber  NULL ,
	Cost_Value_Base      IPNumber  NULL ,
	Currency_Unrealized_Gain_Loss IPNumber  NULL ,
	Equity_Market_Value_Base IPNumber  NULL ,
	Estimate_Annual_Income_Base IPNumber  NULL ,
	Fixed_Income_Market_Value_Base IPNumber  NULL ,
	Investment_Unrealized_Gain_Loss_Base IPNumber  NULL ,
	Net_Payable_Receivable_Base IPNumber  NULL ,
	Other_Asset_Value_Base IPNumber  NULL ,
	TCur_Base            IPNumber  NULL ,
	TCurEqv_Base         IPNumber  NULL ,
	TFixed_Base          IPNumber  NULL ,
	Total_Market_Value_Base IPNumber  NULL ,
	TOther_Base          IPNumber  NULL ,
	Unrealized_Gain_Loss_Base IPNumber  NULL ,
	Last_Update          datetime  NULL ,
	Update_Source        IPName  NULL ,
	Account_ID           IPCharID  NULL ,
	Customer_ID          IPID  NULL 
)
go




IF OBJECT_ID('Portfolio_Summary', N'U') IS NOT NULL
	PRINT '<<Success: Table Portfolio_Summary is created.>>';
ELSE
	PRINT '<<Fail: Table Portfolio_Summary is not created.>>';
GO

