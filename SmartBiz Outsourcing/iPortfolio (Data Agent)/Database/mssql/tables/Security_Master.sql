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
** Description: Create table [Security_Master]
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

IF OBJECT_ID('dbo.Security_Master', N'U') IS NULL
CREATE TABLE dbo.Security_Master
( 
	Security_ID          IPID  NOT NULL ,
	Data_Source_ID       IPID  NOT NULL ,
	Primary_Issue_ID     IPLongString  NOT NULL ,
	Primary_Issue_Type   IPCode  NOT NULL ,
	CUSIP                IPCharID  NULL ,
	SEDOL                IPCharID  NULL ,
	ISIN                 IPCharID  NULL ,
	Ticker               IPLongCode ,
	Ref_Primary_Issue_ID IPCharID  NULL ,
	Ref_Primary_Issue_Type IPCode  NULL ,
	Security_Map_Rule_ID IPID  NULL ,
	Contra_Security_ID   IPID  NULL ,
	Contra_Primary_Issue_ID IPCharID  NULL ,
	Contra_Issue_Type    IPCode  NULL ,
	Contract_ID          IPID  NULL ,
	Exchange_ID          IPID  NOT NULL ,
	Issuer_ID            IPCharID  NULL ,
	Default_Pricing_Source_ID IPID  NULL ,
	Underly_Issue_ID     IPCharID  NULL ,
	Underly_Issue_Type   IPCode ,
	Issuer_Code          IPString ,
	Security_Name        IPName  NOT NULL ,
	Security_Type_Code   IPLongCode  NOT NULL ,
	Security_Class_Code  IPString  NOT NULL ,
	Security_Desc        IPDesc  NOT NULL ,
	Accounting_Type_Code IPCode  NULL ,
	Accounting_Class_Code IPCode  NULL ,
	Performance_Type_Code IPCode  NULL ,
	Performance_Class_Code IPCode  NULL ,
	Risk_Type_Code       IPCode  NULL ,
	Risk_Class_Code      IPCode  NULL ,
	Region_Code          IPCode  NULL ,
	State_Code           IPCode ,
	Country_Code         IPCode  NULL ,
	Tax_Country_Code     IPCode  NULL ,
	Issue_Tax_Code       IPCode  NULL ,
	Currency_Code        IPCode  NOT NULL ,
	Legal_Country_Code   IPCode  NULL ,
	Legal_Currency_Code  IPCode  NULL ,
	Payable_Currency_Code IPCode  NULL ,
	Receivable_Currency_Code IPCode  NULL ,
	Income_Currency_Code IPCode  NULL ,
	Redemption_Currency_Code IPCode  NULL ,
	Settlement_Currency_Code IPCode  NULL ,
	Share_Available_Amount IPNumber  NULL ,
	Total_Outstanding_Shares IPNumber ,
	Issue_ID_Change_Indicator IPIndicator ,
	Issue_ID_Type_Change IPCode  NOT NULL ,
	New_Ticker           IPCharID  NOT NULL ,
	New_Exchange_Code    IPCode  NULL ,
	New_Security_ID      IPID  NULL ,
	New_Issue_ID         IPCharID  NULL ,
	Cusip_Change_Indicator IPIndicator ,
	Closed_End_Fund_Indicator IPIndicator ,
	Composite_Security_Indicator IPIndicator ,
	Delist_Indicator     IPIndicator ,
	Delist_Date          datetime  NULL ,
	DTC_Eligible_Indicator IPIndicator ,
	DTC_Registration     IPName  NULL ,
	Affiliated_Company_Indicator IPIndicator ,
	BankLoan_Indicator   IPIndicator ,
	CDS_Indicator        IPIndicator ,
	Convertible_Indicator IPIndicator  NULL ,
	Currency_Indicator   IPIndicator ,
	Equity_Indicator     IPIndicator ,
	EquitySwap_Indicator IPIndicator ,
	Fixed_Income_Indicator IPIndicator ,
	Foreign_Share_Indicator IPIndicator ,
	Forward_Indicator    IPIndicator ,
	Future_Indicator     IPIndicator ,
	Hedge_Fund_Indicator IPIndicator ,
	Index_Indicator      IPIndicator ,
	InterestSwap_Indicator IPIndicator ,
	MBS_Indicator        IPIndicator  NULL ,
	Muni_Indicator       IPIndicator ,
	Mutual_Fund_Indicator IPIndicator  NOT NULL ,
	Option_Indicator     IPIndicator ,
	Pos_Indicator        IPIndicator ,
	Preferred_Equity_Indicator IPIndicator ,
	Prev_SMF_Indicator   IPIndicator ,
	PrivateLoan_Indicator IPIndicator ,
	Private_Placement_Indicator IPIndicator ,
	Registered_Indicator IPIndicator ,
	SEC_144a_Compliance_Indicator IPIndicator ,
	SEC_Related_Company_Indicator IPIndicator ,
	Swap_Indicator       IPIndicator ,
	TReturnSwap_Indicator IPIndicator ,
	VarianceSwap_Indicator IPIndicator ,
	Analyst_Code         IPCode  NULL ,
	Price_Multiplier     IPNumber  NULL ,
	Trading_Unit_Value   IPNumber  NULL ,
	GICS_Code            IPCode  NULL ,
	GICS_Sector_Code     IPCode  NULL ,
	GICS_Sector_Code_2   IPCode  NULL ,
	GICS_Sector_Code_3   IPCode  NULL ,
	GICS_Sector_Code_4   IPCode  NULL ,
	Issue_Date           datetime  NULL ,
	Maturity_Date        datetime  NULL ,
	Start_Date           datetime  NULL ,
	Strike_Date          datetime  NULL ,
	Settle_Date          datetime  NULL ,
	Last_Price_Date      datetime  NULL ,
	Last_Price_Source    IPID  NULL ,
	Last_Price           IPNumber  NULL ,
	Coupon_Rate          IPNumber  NULL ,
	Trading_Factor       IPNumber ,
	Current_Yield        IPNumber  NULL ,
	Price_High_52_Week   IPNumber  NULL ,
	Price_Low_52_Week    IPNumber  NULL ,
	Fwd_Broker_Code      IPCode  NULL ,
	Settle_Broker_Code   IPCode  NULL ,
	Broker_Code          IPCode  NULL ,
	Broker_Code_2        IPCode  NULL ,
	Warrant_Issue_ID     IPCharID  NULL ,
	Warrant_Indicator    IPIndicator  NULL ,
	Warrant_Underlying_CUSIP IPCharID  NULL ,
	Warrant_Currency_Code IPCode  NULL ,
	Warrant_Underlying_Currency_Code IPCode  NULL ,
	Warrant_Ticker       IPCode  NULL ,
	Warrant_Name         IPName  NULL ,
	UDF_Amt_1            IPNumber  NULL ,
	UDF_Amt_2            IPNumber  NULL ,
	UDF_Amt_3            IPNumber  NULL ,
	UDF_Amt_4            IPNumber  NULL ,
	UDF_Amt_5            IPNumber  NULL ,
	UDF_Amt_6            IPNumber  NULL ,
	UDF_Amt_7            IPNumber  NULL ,
	UDF_Amt_8            IPNumber  NULL ,
	UDF_Amt_9            IPNumber  NULL ,
	UDF_Amt_10           IPNumber  NULL ,
	UDF_Date_1           datetime  NULL ,
	UDF_Date_2           datetime  NULL ,
	UDF_Date_3           datetime  NULL ,
	UDF_Date_4           datetime  NULL ,
	UDF_Date_5           datetime  NULL ,
	UDF_Int_1            IPInt  NULL ,
	UDF_Int_2            IPInt  NULL ,
	UDF_Int_3            IPInt  NULL ,
	UDF_Int_4            IPInt  NULL ,
	UDF_Int_5            IPInt  NULL ,
	UDF_Sector_1         IPLongCode ,
	UDF_Sector_2         IPLongCode ,
	UDF_Sector_3         IPLongCode ,
	UDF_Sector_4         IPLongCode ,
	UDF_Sector_5         IPLongCode ,
	UDF_Text_1           IPName  NULL ,
	UDF_Text_2           IPName  NULL ,
	UDF_Text_3           IPName  NULL ,
	CRC                  IPInt  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Security_Master', N'U') IS NOT NULL
	PRINT '<<Success: Table Security_Master is created.>>';
ELSE
	PRINT '<<Fail: Table Security_Master is not created.>>';
GO

