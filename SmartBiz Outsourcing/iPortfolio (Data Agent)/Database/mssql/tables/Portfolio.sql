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
** Description: Create table [Portfolio]
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

IF OBJECT_ID('dbo.Portfolio', N'U') IS NULL
CREATE TABLE dbo.Portfolio
( 
	Portfolio_ID         IPCharID  NOT NULL ,
	Manager_ID           IPID ,
	Enterprise_ID        IPID ,
	Portfolio_Name       IPName  NOT NULL ,
	Security_ID          IPID  NOT NULL ,
	Data_Source_ID       IPID  NOT NULL ,
	Collateral_Account_ID IPCharID  NOT NULL ,
	Manager_Name         IPName  NULL ,
	Source_ID            IPID  NULL ,
	Product_ID           IPCharID  NOT NULL ,
	Product_Name         IPName  NULL ,
	SubCustodian_ID      IPID  NOT NULL ,
	URL_ID               IPURL  NOT NULL ,
	Reference_ID         IPCharID  NULL ,
	Portfolio_Second_Name IPName  NULL ,
	Portfolio_Type       IPCode  NOT NULL ,
	Portfolio_Purpose    IPName  NULL ,
	Portfolio_Description IPDesc  NOT NULL ,
	Composite_Indicator  IPIndicator ,
	Depository_Affirm_Indicator IPIndicator  NULL ,
	Lending_Indicator    IPIndicator ,
	Lending_Service_Indicator IPIndicator ,
	Margin_Delinquency_Indicator IPIndicator ,
	Model_Indicator      IPIndicator ,
	Mutual_Fund_Indicator IPIndicator ,
	Restriction_Indicator IPIndicator ,
	Performance_Indicator IPIndicator  NULL ,
	Performance_Start_Date datetime  NULL ,
	Performance_Period   IPIndicator  NULL ,
	Sort_Key             IPCode ,
	Base_Currency_Code   IPCode  NOT NULL ,
	Service_Level_Code   IPCode  NULL ,
	Third_Party_Affirm_Code IPCode  NULL ,
	Third_Party_Affirm_Inst IPName ,
	CostVal_Basis        IPCode  NULL ,
	Val_Basis            IPCode ,
	Cost_Basis           IPCode ,
	Lot_Method           IPCode  NULL ,
	Business_Type_Name   IPName  NULL ,
	Business_Type        IPCode  NULL ,
	Open_Date            datetime  NOT NULL ,
	Open_Reason          IPShortDesc ,
	Close_of_Business_Date datetime  NULL ,
	Close_Date           datetime  NULL ,
	Close_Reason         IPShortDesc ,
	Trading_Date         datetime  NULL ,
	Termination_Date     datetime  NULL ,
	Corrected_Date       datetime  NULL ,
	Status               IPName  NULL ,
	Fiscal_Year_End      datetime  NULL ,
	Reference_Account_Info IPName  NULL ,
	Proxy_Handling_Name  IPName  NULL ,
	Proxy_Powers_Name    IPName  NULL ,
	UDF_Amount_1         IPNumber  NULL ,
	UDF_Amount_2         IPNumber  NULL ,
	UDF_Customer_ID_1    IPID  NULL ,
	UDF_Customer_ID_2    IPID  NULL ,
	UDF_Customer_ID_3    IPID  NULL ,
	UDF_Customer_ID_4    IPID  NULL ,
	UDF_Date_Field_1     datetime  NULL ,
	UDF_Date_Field_2     datetime  NULL ,
	UDF_Date_Field_3     datetime  NULL ,
	UDF_Date_Field_4     datetime  NULL ,
	UDF_Description_Field_1 IPShortDesc ,
	UDF_Description_Field_2 IPShortDesc ,
	UDF_Description_Field_3 IPShortDesc ,
	UDF_Description_Field_4 IPShortDesc ,
	UDF_Text_Field_1     IPName  NULL ,
	UDF_Text_Field_2     IPName  NULL ,
	UDF_Text_Field_3     IPName  NULL ,
	UDF_Text_Field_4     IPName  NULL ,
	UDF_Text_Field_5     IPName  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Portfolio', N'U') IS NOT NULL
	PRINT '<<Success: Table Portfolio is created.>>';
ELSE
	PRINT '<<Fail: Table Portfolio is not created.>>';
GO

