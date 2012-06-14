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
** Description: Create table [Portfolio_Transaction]
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

IF OBJECT_ID('dbo.Portfolio_Transaction', N'U') IS NULL
CREATE TABLE dbo.Portfolio_Transaction
( 
	Event_Record_ID      IPID IDENTITY ,
	Portfolio_ID         IPCharID  NOT NULL ,
	Manager_ID           IPID ,
	Enterprise_ID        IPID ,
	Security_ID          IPID  NOT NULL ,
	Acct_Trans_ID        IPCharID  NULL ,
	Accounting_Date      datetime  NOT NULL ,
	Broker_Order_ID      IPCharID  NOT NULL ,
	Canceled_Event_ID    IPCharID  NULL ,
	Canceled_Transaction_ID IPCharID  NULL ,
	Canceled_Date        datetime  NULL ,
	Canceled_Indicator   IPIndicator  NULL ,
	Customer_ID          IPCharID  NOT NULL ,
	Event_ID             IPCharID  NOT NULL ,
	Event_Class          IPCode  NULL ,
	Event_Code           IPCode  NULL ,
	Executed_Trade_ID    IPCharID  NOT NULL ,
	Issue_ID             IPCharID  NULL ,
	Lot_ID               IPCharID  NULL ,
	Lot_Number           IPInt  NULL ,
	Offset_Event_ID      IPCharID  NOT NULL ,
	Rebook_Event_ID      IPCharID  NOT NULL ,
	Rebook_Transaction_ID IPCharID  NOT NULL ,
	Reference_Portfolio_ID IPCharID  NULL ,
	Acct_Event_ID        IPCharID  NULL ,
	NLS_Code             IPCode  NULL ,
	Registrar_ID         IPCharID  NULL ,
	Related_Event_ID     IPCharID  NULL ,
	Custody_Rcd_ID       IPInt  NULL ,
	Sub_Custodian_ID     IPCharID  NULL ,
	Report_Parameter_ID  IPID  NULL ,
	Transaction_ID       IPCharID  NOT NULL ,
	Transaction_Amount   IPNumber  NOT NULL ,
	Transaction_Amount_Base IPNumber  NOT NULL ,
	Transaction_Class    IPCode  NOT NULL ,
	Transaction_Code     IPCode  NOT NULL ,
	Trans_Description    IPDesc  NOT NULL ,
	Transaction_Type     IPCode  NOT NULL ,
	Accrued_Expense      IPNumber  NULL ,
	Accrued_Expense_Base IPNumber  NULL ,
	Accrued_Income       IPNumber  NULL ,
	Accrued_Income_Base  IPNumber  NULL ,
	Broker_Commission_Base IPNumber  NULL ,
	Broker_Com           IPNumber  NULL ,
	Cost_Value           IPNumber  NULL ,
	Cost_Value_Base      IPNumber  NULL ,
	Cost_Value_Type      IPCode  NULL ,
	Cost_Basis_Code      IPCode  NULL ,
	Clearing_Broker_Code IPCode  NULL ,
	Clearing_Broker_Name IPName  NULL ,
	Client_Reference     IPCharID  NULL ,
	Depository_Reference IPCode  NULL ,
	Description_1        IPDesc  NULL ,
	Description_2        IPDesc  NULL ,
	Description_3        IPDesc  NULL ,
	Description_4        IPDesc  NULL ,
	Domicile_Code        IPCode ,
	Exchange_Code        IPCode  NULL ,
	FX_Currency_1        IPCode  NULL ,
	FX_Currency_2        IPCode  NULL ,
	FX_Rate              IPNumber  NULL ,
	FX_Rate_Base_Currency IPNumber  NULL ,
	GainLoss_Type        IPCode  NULL ,
	Income_Cash          IPNumber  NULL ,
	Income_Cash_Base     IPNumber  NULL ,
	Income_Earned        IPNumber  NULL ,
	Income_Earned_Base   IPNumber  NULL ,
	Income_Rate          IPNumber  NULL ,
	Income_Payable       IPNumber  NULL ,
	Income_Payable_Base  IPNumber  NULL ,
	Income_Quantity      IPNumber  NULL ,
	Income_PurchSold     IPNumber  NULL ,
	Income_PurchSold_Base IPNumber  NULL ,
	Income_Receivable    IPNumber  NULL ,
	Income_Receivable_Base IPNumber  NULL ,
	Local_Currency_Code  IPCode  NOT NULL ,
	Other_Fees           IPNumber  NULL ,
	Other_Fees_Base      IPNumber  NULL ,
	Other_Expense        IPNumber  NULL ,
	Other_Expense_Base   IPNumber  NULL ,
	Payable_Date         datetime  NOT NULL ,
	Posting_Date         datetime  NOT NULL ,
	Trade_Date           datetime  NOT NULL ,
	Performance_Value    IPNumber  NULL ,
	Principal_Cash       IPNumber  NULL ,
	Principal_Cash_Base  IPNumber  NULL ,
	Principal_Rate       IPNumber  NULL ,
	Principal_Payable    IPNumber  NULL ,
	Principal_Payable_Base IPNumber  NULL ,
	Principal_Quantity   IPNumber  NULL ,
	Principal_Receivable IPNumber  NULL ,
	Principal_Receivable_Base IPNumber  NULL ,
	Quantity             IPNumber  NULL ,
	Base_Cur_Code        IPCode  NULL ,
	Realized_Currency_GainLoss_Base IPNumber  NULL ,
	Realized_Currency_GainLoss IPNumber  NULL ,
	Realized_GainLoss_Base IPNumber  NULL ,
	Realized_Investment_GainLoss_Base IPNumber  NULL ,
	Rebook_Date          datetime  NULL ,
	Reclaimable_Tax      IPNumber  NULL ,
	Reclaimable_Tax_Base IPNumber  NULL ,
	Registration_Name    IPName  NULL ,
	SEC_Fees             IPNumber  NULL ,
	SEC_Fees_Base        IPNumber  NULL ,
	Tax_Withheld         IPNumber  NULL ,
	Tax_Withheld_Base    IPNumber  NULL ,
	Tax_Amount           IPNumber  NULL ,
	Tax_Amount_Base      IPNumber  NULL ,
	Tax_Code             IPCode  NULL ,
	Tax_Description      IPDesc  NULL ,
	Trading_Broker_Code  IPCode  NULL ,
	Trading_Broker_Name  IPName  NULL ,
	Unit_Price           IPNumber  NULL ,
	Unit_Price_Base_Currency IPNumber  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Portfolio_Transaction', N'U') IS NOT NULL
	PRINT '<<Success: Table Portfolio_Transaction is created.>>';
ELSE
	PRINT '<<Fail: Table Portfolio_Transaction is not created.>>';
GO

