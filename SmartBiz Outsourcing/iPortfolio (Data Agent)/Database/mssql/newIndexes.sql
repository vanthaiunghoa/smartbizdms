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
** Description: Create table indexes
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

CREATE NONCLUSTERED INDEX XIF3Account ON Account
( 
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Account_Credential ON Account_Credential
( 
	Account_ID            ASC,
	Customer_ID           ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX idxSecurityID ON Account_Holding
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF3Account_Holding ON Account_Holding
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF4Account_Holding ON Account_Holding
( 
	Summary_ID            ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Account_Portfolio_Xref ON Account_Portfolio_Xref
( 
	Portfolio_ID          ASC,
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Account_Portfolio_Xref ON Account_Portfolio_Xref
( 
	Account_ID            ASC,
	Customer_ID           ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransAcctDate ON Accounting_Events
( 
	Accounting_Date       ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransTradeDate ON Accounting_Events
( 
	Trade_Date            ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransPostDate ON Accounting_Events
( 
	Posting_Date          ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransPayDate ON Accounting_Events
( 
	Payable_Date          ASC
)
go

CREATE NONCLUSTERED INDEX XIF4Accounting_Events ON Accounting_Events
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF5Accounting_Events ON Accounting_Events
( 
	Account_ID            ASC,
	Customer_ID           ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Address ON Address
( 
	Customer_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Bench_Index ON Bench_Index
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF3Bench_Index ON Bench_Index
( 
	Benchmark_ID          ASC
)
go

CREATE NONCLUSTERED INDEX XIF3Biz_Calendar ON Biz_Calendar
( 
	Exchange_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Customer ON Customer
( 
	User_ID               ASC,
	User_Key              ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Customer_Portfolio_Monitor ON Customer_Portfolio_Monitor
( 
	Customer_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Customer_Portfolio_Monitor ON Customer_Portfolio_Monitor
( 
	Portfolio_ID          ASC,
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX idx_Lot_Date ON Lot
( 
	Accounting_Date       ASC,
	Adjusted_Date         ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Lot ON Lot
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF3Lot ON Lot
( 
	Account_ID            ASC,
	Customer_ID           ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Manager ON Manager
( 
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Perf_Summary ON Perf_Summary
( 
	Perf_Rule_ID          ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Perf_Summary ON Perf_Summary
( 
	Summary_ID_Start_Date  ASC
)
go

CREATE NONCLUSTERED INDEX XIF3Perf_Summary ON Perf_Summary
( 
	Summary_ID_End_Date   ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Policies ON Policies
( 
	Strategy_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Policies ON Policies
( 
	Customer_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF3Portfolio ON Portfolio
( 
	Product_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF5Portfolio ON Portfolio
( 
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Portfolio_Analytics ON Portfolio_Analytics
( 
	Portfolio_Summary     ASC
)
go

CREATE NONCLUSTERED INDEX XIF3Portfolio_Analytics ON Portfolio_Analytics
( 
	Bechmark_Summary      ASC
)
go

CREATE UNIQUE NONCLUSTERED INDEX XIF1Portfolio_Benchmark_Xref ON Portfolio_Benchmark_Xref
( 
	Portfolio_ID          ASC,
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Portfolio_Benchmark_Xref ON Portfolio_Benchmark_Xref
( 
	Benchmark_ID          ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Portfolio_Default ON Portfolio_Default
( 
	Portfolio_ID          ASC,
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Portfolio_ROR ON Portfolio_ROR
( 
	ROR_Summary_ID        ASC
)
go

CREATE NONCLUSTERED INDEX XIF5Portfolio_Summary ON Portfolio_Summary
( 
	Portfolio_ID          ASC,
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF6Portfolio_Summary ON Portfolio_Summary
( 
	Account_ID            ASC,
	Customer_ID           ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransAcctDate ON Portfolio_Transaction
( 
	Accounting_Date       ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransTradeDate ON Portfolio_Transaction
( 
	Trade_Date            ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransPostDate ON Portfolio_Transaction
( 
	Posting_Date          ASC
)
go

CREATE NONCLUSTERED INDEX fk_TransPayDate ON Portfolio_Transaction
( 
	Payable_Date          ASC
)
go

CREATE NONCLUSTERED INDEX XIF6Portfolio_Transaction ON Portfolio_Transaction
( 
	Portfolio_ID          ASC,
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF8Portfolio_Transaction ON Portfolio_Transaction
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX idxSecurityID ON Position
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Position ON Position
( 
	Summary_ID            ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Position ON Position
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Position_ROR ON Position_ROR
( 
	ROR_Summary_ID        ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Position_ROR ON Position_ROR
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Price ON Price
( 
	Data_Source_ID        ASC
)
go

CREATE NONCLUSTERED INDEX idxprice_date ON Price
( 
	Price_Date            ASC
)
go

CREATE NONCLUSTERED INDEX XIF5Price ON Price
( 
	Method_ID             ASC,
	Data_Source_ID        ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Price ON Price
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Price_Method ON Price_Method
( 
	Exchange_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Price_Method ON Price_Method
( 
	Data_Source_ID        ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Product ON Product
( 
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF4Projected_Event ON Projected_Event
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF5Projected_Event ON Projected_Event
( 
	Portfolio_ID          ASC,
	Manager_ID            ASC,
	Enterprise_ID         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Rating ON Rating
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Report_ROR ON Report_ROR
( 
	ROR_Summary_ID        ASC
)
go

CREATE NONCLUSTERED INDEX XIF2Security_Characteristics_Mapping ON Security_Analytic
( 
	Data_Source_ID        ASC
)
go

CREATE NONCLUSTERED INDEX XFK_Sec_Analytic_Date ON Security_Analytic
( 
	Accounting_Date       ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Security_Analytic ON Security_Analytic
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX fk_security_name ON Security_Master
( 
	Security_Name         ASC
)
go

CREATE NONCLUSTERED INDEX XIF4Security_Master ON Security_Master
( 
	Data_Source_ID        ASC
)
go

CREATE NONCLUSTERED INDEX XIF5Security_Master ON Security_Master
( 
	Security_ID           ASC
)
go

