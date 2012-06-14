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
** Description: Create table [Lot]
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

IF OBJECT_ID('dbo.Lot', N'U') IS NULL
CREATE TABLE dbo.Lot
( 
	Lot_Record_ID        IPID  NOT NULL ,
	Account_ID           IPCharID ,
	Customer_ID          IPID ,
	Enterprise_ID        IPID ,
	Security_ID          IPID  NULL ,
	Issue_ID             IPCharID  NULL ,
	Lot_ID               IPCharID  NOT NULL ,
	Lot_Number           IPID  NOT NULL ,
	Lot_Date_Time        datetime  NOT NULL ,
	Lot_Settlement_Date  datetime  NULL ,
	Close_Lot_Indicator  IPIndicator  NULL ,
	Original_Lot_ID      IPCharID  NOT NULL ,
	Original_Lot_Number  IPNumber  NULL ,
	Original_Lot_Date    datetime  NULL ,
	Valuation_Basis_ID   IPID  NULL ,
	Accounting_Date      datetime  NOT NULL ,
	Adjusted_Date        datetime  NOT NULL ,
	Last_Open_Date       datetime  NULL ,
	Last_Close_Date      datetime  NULL ,
	Last_Loss_Date       datetime  NULL ,
	Earn_Through_Date    datetime  NULL ,
	Base_Currency_Code   IPCode  NOT NULL ,
	Local_Currency_Code  IPCode  NOT NULL ,
	Base_Market_Value    IPNumber  NULL ,
	Local_Market_Value   IPNumber  NULL ,
	Cost_Value_Base      IPNumber  NULL ,
	Cost_Value_Local     IPNumber  NULL ,
	Quantity             IPNumber  NULL ,
	Original_Quantity    IPNumber  NULL ,
	Original_Carrying_Value IPNumber  NULL ,
	Original_Carrying_Value_Base IPNumber  NULL ,
	Par_Share_Value_Local IPNumber  NULL ,
	Accrued_Value_Base   IPNumber  NULL ,
	Accrued_Value_Local  IPNumber  NULL ,
	Book_Base            IPNumber  NULL ,
	Book_Local           IPNumber  NULL ,
	Commission_Base      IPNumber  NULL ,
	Commission_Local     IPNumber  NULL ,
	Estimated_Income_Base IPNumber  NULL ,
	Estimated_Income_Local IPNumber  NULL ,
	Expense_Base         IPNumber  NULL ,
	Expense_Local        IPNumber  NULL ,
	Interest_Earned_Local IPNumber  NULL ,
	Interest_Sold_Local  IPNumber  NULL ,
	Price_Base           IPNumber  NULL ,
	Price_Local          IPNumber  NULL ,
	Price_DateTime       datetime  NULL ,
	Price_Source_Code    IPCode  NULL ,
	Price_Type           IPCode  NULL ,
	UGL_Base             IPNumber  NULL ,
	UGL_Local            IPNumber  NULL ,
	Unit_Price           IPNumber  NULL ,
	Unit_Price_Base      IPNumber  NULL ,
	Unit_Price_Local     IPNumber  NULL ,
	PreTax_Adjusted_Yield IPNumber  NULL ,
	Project_Income_Rate  IPNumber  NULL ,
	FX_Date              datetime  NULL ,
	FX_Rate_Base         IPNumber  NULL ,
	FX_Rate_Counter      IPNumber  NOT NULL ,
	FX_Rate_Trade        IPNumber  NULL ,
	Long_or_Short        IPIndicator  NULL ,
	Principal_or_Income  IPIndicator  NULL ,
	Purchased_Quantity   IPNumber  NULL ,
	Broker_Code          IPCode  NULL ,
	Execution_Broker_Code IPCode  NULL ,
	Clearing_Broker_Code IPCode  NULL ,
	Broker_Fees_Local    IPNumber  NULL ,
	Execution_Broker_Fees_Local IPNumber  NULL ,
	Clearing_Broker_Fees_Local IPNumber  NULL ,
	Ledger_Code          IPCode  NULL ,
	Ledger_Name          IPName  NULL ,
	GAAP_Book_Value_Base IPNumber  NULL ,
	GAAP_Unit_Book_Value_Base IPNumber  NULL ,
	GAAP_Code_Value_Base IPNumber  NULL ,
	GAAP_Unit_Cost_Base  IPNumber  NULL ,
	GAAP_Trade_Date      datetime  NULL ,
	GAAP_Local_Book_Value IPNumber  NULL ,
	GAAP_Local_Unit_Book_Value IPNumber  NULL ,
	GAAP_Local_Cost_Value IPNumber  NULL ,
	GAAP_Local_Unit_Cost IPNumber  NULL ,
	STAT_Book_Value_Base IPNumber  NULL ,
	STAT_Unit_Book_Value_Base IPNumber  NULL ,
	STAT_BV_Date         datetime  NULL ,
	STAT_BV_Trade        IPNumber  NULL ,
	STAT_BV_Price_Trade  IPNumber  NULL ,
	STAT_Cost_Value_Base IPNumber  NULL ,
	STAT_Unit_Cost_Base  IPNumber  NULL ,
	STAT_Local_Book_Value IPNumber  NULL ,
	STAT_Local_Unit_Book_Value IPNumber  NULL ,
	STAT_Local_Cost_Value IPNumber  NULL ,
	STAT_Local_Unit_Cost IPNumber  NULL ,
	Tax_Status           IPCode  NULL ,
	Tax_Book_Value_Base  IPNumber  NULL ,
	TAX_Unit_Book_Value_Base IPNumber  NULL ,
	Tax_Cost_Value_Base  IPNumber  NULL ,
	TAX_Unit_Cost_Base   IPNumber  NULL ,
	Tax_Local_Book_Value IPNumber  NULL ,
	Tax_Local_Unit_Book_Value IPNumber  NULL ,
	Tax_Local_Cost_Value IPNumber  NULL ,
	Tax_Local_Unit_Cost  IPNumber  NULL ,
	Short_Term_Indicator IPIndicator  NULL ,
	UDF_Date_Field_1     datetime  NULL ,
	UDF_Date_Field_2     datetime  NULL ,
	UDF_Money_Field_1    IPNumber  NULL ,
	UDF_Money_Field_2    IPNumber  NULL ,
	UDF_Money_Field_3    IPNumber  NULL ,
	UDF_Money_Field_4    IPNumber  NULL ,
	UDF_Money_Field_5    IPNumber  NULL ,
	UDF_Rate_Field_1     IPNumber  NULL ,
	UDF_Rate_Field_2     IPNumber  NULL ,
	UDF_Rate_Field_3     IPNumber  NULL ,
	UDF_Rate_Field_4     IPNumber  NULL ,
	UDF_Quantity_Field_1 IPNumber  NULL ,
	UDF_Quantity_Field_2 IPNumber  NULL ,
	UDF_Text_Field_1     IPName  NULL ,
	UDF_Text_Field_2     IPName  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Lot', N'U') IS NOT NULL
	PRINT '<<Success: Table Lot is created.>>';
ELSE
	PRINT '<<Fail: Table Lot is not created.>>';
GO

