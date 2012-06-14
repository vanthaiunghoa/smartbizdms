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
** Description: Create table primary keys
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

ALTER TABLE Account
	ADD CONSTRAINT PK_Account PRIMARY KEY  CLUSTERED (Account_ID ASC,Customer_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Account_Credential
	ADD CONSTRAINT PK_Account_Credential PRIMARY KEY  CLUSTERED (Credential_ID ASC)
go

ALTER TABLE Account_Holding
	ADD CONSTRAINT PK_Account_Holding PRIMARY KEY  CLUSTERED (Position_Record_ID ASC)
go

ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT PK_Account_Portfolio_Xref PRIMARY KEY  CLUSTERED (Customer_Account_Invest_ID ASC)
go

ALTER TABLE Accounting_Events
	ADD CONSTRAINT PK_Accounting_Events PRIMARY KEY  CLUSTERED (Event_Record_ID ASC,Account_ID ASC,Customer_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Address
	ADD CONSTRAINT PK_Address PRIMARY KEY  CLUSTERED (Address_ID ASC)
go

ALTER TABLE Alternate_Issue
	ADD CONSTRAINT PK_Alternate_Issue PRIMARY KEY  CLUSTERED (Alternate_ID ASC,Security_ID ASC,Alternate_Type ASC)
go

ALTER TABLE App_User
	ADD CONSTRAINT PK_App_User PRIMARY KEY  CLUSTERED (User_ID ASC,User_Key ASC)
go

ALTER TABLE Bench_Index
	ADD CONSTRAINT PK_Bench_Index PRIMARY KEY  CLUSTERED (Bench_Index_ID ASC,Benchmark_ID ASC)
go

ALTER TABLE Benchmark
	ADD CONSTRAINT PK_Benchmark PRIMARY KEY  CLUSTERED (Benchmark_ID ASC)
go

ALTER TABLE Biz_Calendar
	ADD CONSTRAINT PK_Biz_Calendar PRIMARY KEY  CLUSTERED (Calendar_ID ASC)
go

ALTER TABLE Customer
	ADD CONSTRAINT PK_Customer PRIMARY KEY  CLUSTERED (Customer_ID ASC)
go

ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT PK_Customer_Portfolio_Monitor PRIMARY KEY  CLUSTERED (Customer_Role_ID ASC,Customer_ID ASC)
go

ALTER TABLE Enterprise
	ADD CONSTRAINT PK_Enterprise PRIMARY KEY  CLUSTERED (Enterprise_ID ASC)
go

ALTER TABLE Exchange
	ADD CONSTRAINT PK_Exchange PRIMARY KEY  CLUSTERED (Exchange_ID ASC)
go

ALTER TABLE Financial_Data_Source
	ADD CONSTRAINT PK_Financial_Data_Source PRIMARY KEY  CLUSTERED (Data_Source_ID ASC)
go

ALTER TABLE Lot
	ADD CONSTRAINT PK_Lot PRIMARY KEY  CLUSTERED (Lot_Record_ID ASC,Account_ID ASC,Customer_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Manager
	ADD CONSTRAINT PK_Manager PRIMARY KEY  CLUSTERED (Manager_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Perf_Rule
	ADD CONSTRAINT PK_Perf_Rule PRIMARY KEY  CLUSTERED (Rule_ID ASC)
go

ALTER TABLE Perf_Summary
	ADD CONSTRAINT PK_Perf_Summary PRIMARY KEY  CLUSTERED (Perf_Summary_ID ASC)
go

ALTER TABLE Policies
	ADD CONSTRAINT PK_Policies PRIMARY KEY  CLUSTERED (PolicyID ASC,Strategy_ID ASC,Customer_ID ASC)
go

ALTER TABLE Portfolio
	ADD CONSTRAINT PK_Portfolio PRIMARY KEY  CLUSTERED (Portfolio_ID ASC,Manager_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT PK_Portfolio_Analytics PRIMARY KEY  CLUSTERED (Portfolio_Analytic_ID ASC)
go

ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT PK_Portfolio_Benchmark_Xref PRIMARY KEY  CLUSTERED (Benchmark_ID ASC,Portfolio_ID ASC,Manager_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default PRIMARY KEY  CLUSTERED (Portfolio_ID ASC,Manager_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT PK_Portfolio_ROR PRIMARY KEY  CLUSTERED (ROR_ID ASC)
go

ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT PK_Portfolio_Summary PRIMARY KEY  CLUSTERED (Summary_ID ASC)
go

ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT PK_Portfolio_Transaction PRIMARY KEY  CLUSTERED (Event_Record_ID ASC,Portfolio_ID ASC,Manager_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Position
	ADD CONSTRAINT PK_Position PRIMARY KEY  CLUSTERED (Position_Record_ID ASC,Summary_ID ASC)
go

ALTER TABLE Position_ROR
	ADD CONSTRAINT PK_Position_ROR PRIMARY KEY  CLUSTERED (Pos_ROR_ID ASC)
go

ALTER TABLE Price
	ADD CONSTRAINT PK_Price PRIMARY KEY  CLUSTERED (Price_ID ASC)
go

ALTER TABLE Price_Method
	ADD CONSTRAINT PK_Price_Method PRIMARY KEY  CLUSTERED (Method_ID ASC,Data_Source_ID ASC)
go

ALTER TABLE Product
	ADD CONSTRAINT PK_Product PRIMARY KEY  CLUSTERED (Product_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Projected_Event
	ADD CONSTRAINT PK_Projected_Event PRIMARY KEY  CLUSTERED (Projected_Event_Record_ID ASC,Portfolio_ID ASC,Manager_ID ASC,Enterprise_ID ASC)
go

ALTER TABLE Rating
	ADD CONSTRAINT PK_Rating PRIMARY KEY  CLUSTERED (Rating_ID ASC,Security_ID ASC,Data_Source_ID ASC)
go

ALTER TABLE Report_ROR
	ADD CONSTRAINT PK_Report_ROR PRIMARY KEY  CLUSTERED (ROR_ID ASC)
go

ALTER TABLE Security_Analytic
	ADD CONSTRAINT PK_Security_Analytic PRIMARY KEY  CLUSTERED (Sec_Analytic_ID ASC)
go

ALTER TABLE Security_Master
	ADD CONSTRAINT PK_Security_Master PRIMARY KEY  CLUSTERED (Security_ID ASC)
go

ALTER TABLE Strategy
	ADD CONSTRAINT PK_Strategy PRIMARY KEY  CLUSTERED (Strategy_ID ASC)
go

