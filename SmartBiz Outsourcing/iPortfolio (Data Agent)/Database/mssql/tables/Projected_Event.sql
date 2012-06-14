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
** Description: Create table [Projected_Event]
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

IF OBJECT_ID('dbo.Projected_Event', N'U') IS NULL
CREATE TABLE dbo.Projected_Event
( 
	Projected_Event_Record_ID IPID  NOT NULL ,
	Portfolio_ID         IPCharID ,
	Manager_ID           IPID ,
	Enterprise_ID        IPID ,
	Summary_ID           IPID  NOT NULL ,
	Security_ID          IPID  NOT NULL ,
	Classification_ID    IPID  NOT NULL ,
	Customer_Acct_ID     IPCharID  NOT NULL ,
	Dimension_Set_ID     IPCharID  NOT NULL ,
	Customer_ID          IPCharID  NULL ,
	Custody_Record_ID    IPID  NULL ,
	Event_ID             IPCharID  NOT NULL ,
	Event_Class          IPCode  NULL ,
	Event_Code           IPCode  NULL ,
	Transaction_ID       IPCharID  NOT NULL ,
	Transaction_Amount   IPNumber  NOT NULL ,
	Transaction_Amount_Base IPNumber  NOT NULL ,
	Transaction_Class    IPCode  NULL ,
	Transaction_Code     IPCode  NULL ,
	Transaction_Type     IPCode  NULL ,
	Trans_Description    IPDesc  NULL ,
	Effective_Date       datetime  NOT NULL ,
	Accounting_Date      datetime  NOT NULL ,
	Payable_Date         datetime  NOT NULL ,
	Posting_Date         datetime  NOT NULL ,
	Trade_Date           datetime  NOT NULL ,
	Local_Currency_Code  IPCode  NOT NULL ,
	Performance_Value    IPNumber  NULL ,
	Quantity             IPNumber  NULL ,
	FX_Currency_1        IPCode  NULL ,
	FX_Currency_2        IPCode  NULL ,
	FX_Rate              IPNumber  NULL ,
	FX_Rate_Base_Currency IPNumber  NULL ,
	Income_Cash          IPNumber  NULL ,
	Income_Cash_Base     IPNumber  NULL ,
	Income_Earned        IPNumber  NULL ,
	Income_Earned_Base   IPNumber  NULL ,
	Income_Rate          IPNumber  NULL ,
	Income_Payable       IPNumber  NULL ,
	Income_Payable_Base  IPNumber  NULL ,
	Income_Quantity      IPNumber  NULL ,
	Income_PurchasedSold IPNumber  NULL ,
	Income_PurchasedSold_Base IPNumber  NULL ,
	Income_Receivable    IPNumber  NULL ,
	Income_Receivable_Base IPNumber  NULL ,
	Principal_Cash       IPNumber  NULL ,
	Principal_Cash_Base  IPNumber  NULL ,
	Principal_Rate       IPNumber  NULL ,
	Principal_Payable    IPNumber  NULL ,
	Principal_Payable_Base IPNumber  NULL ,
	Principal_Quantity   IPNumber  NULL ,
	Principal_Receivable IPNumber  NULL ,
	Principal_Receivable_Base IPNumber  NULL ,
	Unit_Price           IPNumber  NULL ,
	Unit_Price_Base_Currency IPNumber  NULL ,
	Accounting_Event_ID  IPCharID  NULL ,
	Accounting_Transaction_ID IPCharID  NULL ,
	Accrued_Expense      IPNumber  NULL ,
	Accrued_Expense_Base IPNumber  NULL ,
	Accrued_Income       IPNumber  NULL ,
	Accrued_Income_Base  IPNumber  NULL ,
	Base_Currency_Code   IPCode  NULL ,
	Cost_Value           IPNumber  NULL ,
	Cost_Value_Base      IPNumber  NULL ,
	Cost_Value_Type      IPCode  NULL ,
	Cost_Basis_Code      IPCode  NULL ,
	Client_Reference     IPCharID  NULL ,
	Depository_Reference_Number IPCode  NULL ,
	Description_1        IPShortDesc  NULL ,
	Description_2        IPShortDesc  NULL ,
	Description_3        IPShortDesc  NULL ,
	Description_4        IPShortDesc  NULL ,
	Exchange_Code        IPShortDesc  NULL ,
	Executed_Trade_ID    IPCharID  NULL ,
	Gain_Loss_Type       IPCode  NULL ,
	Issue_ID             IPCharID  NULL ,
	Lot_ID               IPCharID  NULL ,
	NLS_Code             IPCode  NULL ,
	Other_Fees           IPNumber  NULL ,
	Other_Fees_Base_Currency IPNumber  NULL ,
	SEC_Fees             IPNumber  NULL ,
	SEC_Fees_Alternate_Currency IPNumber  NULL ,
	Domicile_Code        IPCode  NULL ,
	Other_Expense        IPNumber  NULL ,
	Other_Expense_Base   IPNumber  NULL ,
	Realized_Currency_Gain_Loss_Base_Currency IPNumber  NULL ,
	Realized_Currency_Gain_Loss IPNumber  NULL ,
	Realized_Gain_Loss_Base IPNumber  NULL ,
	Realized_Investment_Gain_Loss_Base_Currency IPNumber  NULL ,
	Reclaimable_Tax      IPNumber  NULL ,
	Reclaimable_Tax_Base_Currency IPNumber  NULL ,
	Reference_Portfolio_ID IPCharID  NULL ,
	Related_Event_ID     IPCharID  NULL ,
	Sub_Custodian_ID     IPCharID  NULL ,
	Tax_Code             IPCode  NULL ,
	Tax_Description      IPCode  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Projected_Event', N'U') IS NOT NULL
	PRINT '<<Success: Table Projected_Event is created.>>';
ELSE
	PRINT '<<Fail: Table Projected_Event is not created.>>';
GO

