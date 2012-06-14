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
** Description: Create table [Account_Holding]
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

IF OBJECT_ID('dbo.Account_Holding', N'U') IS NULL
CREATE TABLE dbo.Account_Holding
( 
	Position_Record_ID   IPID  NOT NULL ,
	Security_ID          IPID  NULL ,
	Primary_Issue_ID     IPCharID  NULL ,
	Primary_Issue_Type   IPCode  NULL ,
	Price_Source_ID      IPID  NOT NULL ,
	Ref_Portfolio_ID     IPID  NULL ,
	Settlement_Date      datetime  NULL ,
	Local_Currency_Code  IPCode  NOT NULL ,
	Local_Cur            IPCode  NOT NULL ,
	Base_Currency        IPCode  NOT NULL ,
	Reporting_Currency_Code IPCode  NULL ,
	Rep_Cur              IPCode  NULL ,
	Alternate_Currency_Code IPCode  NULL ,
	Alt_Cur              IPCode  NULL ,
	Accrued_Value_Local  IPNumber  NULL ,
	Accrued_Value_Base   IPNumber  NULL ,
	Accrued_Value_Reporting IPNumber  NULL ,
	Accrued_Value_Alternate IPNumber  NULL ,
	Book_Value_Local     IPNumber  NULL ,
	Book_Value_Base      IPNumber  NULL ,
	Cost_Value_Base      IPNumber  NULL ,
	Cost_Value_Local     IPNumber  NULL ,
	Cost_Value_2         IPNumber  NULL ,
	Cost_Value_3         IPNumber  NULL ,
	Cost_Value_4         IPNumber  NULL ,
	Cost_Basis_Code      IPCode  NULL ,
	Cost_Basis_Code_2    IPCode  NULL ,
	Cost_Basis_Code_3    IPCode  NULL ,
	Cost_Basis_Code_4    IPCode  NULL ,
	Estimated_Income_Local IPNumber  NULL ,
	Estimated_Income_Base IPNumber  NULL ,
	Market_Value_Base    IPNumber  NULL ,
	Market_Value_Local   IPNumber  NULL ,
	Market_Value_Reporting IPNumber  NULL ,
	Market_Value_Alternate IPNumber  NULL ,
	Original_Carrying_Value IPNumber  NULL ,
	Original_Carrying_Value_Base IPNumber  NULL ,
	Price_Base_Currency  IPNumber  NULL ,
	Price_Local_Currency IPNumber  NULL ,
	Unit_Price_Local     IPNumber  NULL ,
	Unit_Price_Base      IPNumber  NULL ,
	FX_Rate_Base         IPNumber  NULL ,
	FX_Rate_2            IPNumber  NULL ,
	Currency_Unrealized_Gain_Loss_Base IPNumber  NULL ,
	Unrealized_Gain_Loss_Local IPNumber  NULL ,
	Unrealized_Gain_Loss_Base IPNumber  NULL ,
	Investment_Unrealized_Gain_Loss_Base IPNumber  NULL ,
	Coupon_Receivable_Local IPNumber  NULL ,
	Coupon_Receivable_Base IPNumber  NULL ,
	Income_Local         IPNumber  NULL ,
	Income_Base          IPNumber  NULL ,
	Dividend_Receivable_Local IPNumber  NULL ,
	Dividend_Receivable_Base IPNumber  NULL ,
	Interest_Purchased_Base IPNumber  NULL ,
	Interest_Earned_Base IPNumber  NULL ,
	Interest_Sold_Base   IPNumber  NULL ,
	Interest_Purchased_Local IPNumber  NULL ,
	Interest_Sold_Local  IPNumber  NULL ,
	Interest_Earned_Local IPNumber  NULL ,
	Reclaim_Receivable_Local IPNumber  NULL ,
	Reclaim_Receivable_Base_Currency IPNumber  NULL ,
	Currency_ROR         IPNumber  NULL ,
	Income_ROR           IPNumber  NULL ,
	Price_ROR            IPNumber  NULL ,
	Principal_ROR        IPNumber  NULL ,
	Total_ROR            IPNumber  NULL ,
	Income_Projection_Rate IPNumber  NULL ,
	Encumbrance_Type     IPCode ,
	FX_Date              datetime  NULL ,
	Trade_FX_Rate        IPNumber  NULL ,
	Ledger_Code          IPCode  NULL ,
	Ledger_Name          IPName  NULL ,
	Long_or_Short        IPIndicator  NULL ,
	Principal_or_Income  IPIndicator  NULL ,
	Original_Quantity    IPNumber  NULL ,
	Par_Share_Value      IPNumber  NULL ,
	Performance_Discretionary IPBit  NULL ,
	Pre_Tax_Adjusted_Yield IPNumber  NULL ,
	Price_Type           IPCode  NULL ,
	Price_Date_Time      datetime  NULL ,
	Quantity             IPNumber  NULL ,
	AIMR_Discretionary_Indicator IPIndicator  NULL ,
	UDF_Date_Field_1     datetime  NULL ,
	UDF_Date_Field_2     datetime  NULL ,
	UDF_Money_Field_1    IPNumber  NULL ,
	UDF_Money_Field_2    IPNumber  NULL ,
	UDF_Money_Field_3    IPNumber  NULL ,
	UDF_Money_Field_4    IPNumber  NULL ,
	UDF_Money_Field_5    IPNumber  NULL ,
	UDF_Money_Field_6    IPNumber  NULL ,
	UDF_Money_Field_7    IPNumber  NULL ,
	UDF_Money_Field_8    IPNumber  NULL ,
	UDF_Quantity_Field_1 IPNumber  NULL ,
	UDF_Quantity_Field_2 IPNumber  NULL ,
	UDF_Rate_Field_1     IPNumber  NULL ,
	UDF_Rate_Field_2     IPNumber  NULL ,
	UDF_Rate_Field_3     IPNumber  NULL ,
	UDF_Rate_Field_4     IPNumber  NULL ,
	UDF_Text_Field_1     IPName ,
	UDF_Text_2           IPName ,
	UDF_Text_3           IPName ,
	UDF_Text_4           IPName ,
	UDF_Text_5           IPName ,
	UDF_Text_6           IPName ,
	Last_Update          datetime  NULL ,
	Summary_ID           IPID  NULL 
)
go




IF OBJECT_ID('Account_Holding', N'U') IS NOT NULL
	PRINT '<<Success: Table Account_Holding is created.>>';
ELSE
	PRINT '<<Fail: Table Account_Holding is not created.>>';
GO

