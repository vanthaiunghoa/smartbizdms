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
** Description: Create table reference keys
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
	ADD CONSTRAINT FK_Account_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Account
	ADD CONSTRAINT FK_Account_Enterprise FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Account_Credential
	ADD CONSTRAINT FK_Account_Credential_Account FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Account_Holding
	ADD CONSTRAINT FK_Account_Holding_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Account_Holding
	ADD CONSTRAINT FK_Account_Holding_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Account_Portfolio_Xref_Portfolio FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go

ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Account_Portfolio_Xref_Account FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go

ALTER TABLE Accounting_Events
	ADD CONSTRAINT FK_Accounting_Events_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Accounting_Events
	ADD CONSTRAINT FK_Accounting_Events_Account FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Address
	ADD CONSTRAINT FK_Address_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go

ALTER TABLE Bench_Index
	ADD CONSTRAINT FK_Bench_Index_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Bench_Index
	ADD CONSTRAINT FK_Bench_Index_Benchmark FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Biz_Calendar
	ADD CONSTRAINT FK_Biz_Calendar_Exchange FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Customer
	ADD CONSTRAINT FK_Customer_App_User FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK_Customer_Portfolio_Monitor_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK_Customer_Portfolio_Monitor_Portfolio FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go

ALTER TABLE Lot
	ADD CONSTRAINT FK_Lot_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Lot
	ADD CONSTRAINT FK_Lot_Account FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Manager
	ADD CONSTRAINT FK_Manager_Enterprise FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary_Start_Date FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary_End_Date FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Policies
	ADD CONSTRAINT FK_Policies_Strategy FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Policies
	ADD CONSTRAINT FK_Policies_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go

ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Manager FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go

ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary_Bench FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark_Xref_Portfolio FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go

ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark_Xref_Benchmark FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio_Default
	ADD CONSTRAINT FK_Portfolio_Default_Portfolio FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT FK_Portfolio_Summary_Portfolio FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT FK_Portfolio_Summary_Account FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT FK_Portfolio_Transaction_Portfolio FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT FK_Portfolio_Transaction_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE Price_Method
	ADD CONSTRAINT FK_Price_Method_Exchange FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Price_Method
	ADD CONSTRAINT FK_Price_Method_Financial_Data_Source FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Product
	ADD CONSTRAINT FK_Product_Enterprise FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Projected_Event
	ADD CONSTRAINT FK_Projected_Event_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Projected_Event
	ADD CONSTRAINT FK_Projected_Event_Portfolio FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Security_Master
	ADD CONSTRAINT FK_Security_Master_Financial_Data_Source FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_351 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go





ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_351 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go





ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_351 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_351 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go





ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_351 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_351 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT FK_Customer_Acct FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account
	ADD CONSTRAINT custodies FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Credential
	ADD CONSTRAINT is_secured_with FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_280 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Holding
	ADD CONSTRAINT R_203 FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Portfolio_XRef FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Account_Portfolio_Xref
	ADD CONSTRAINT FK_Customer_Acct_Map_XREF FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_282 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Accounting_Events
	ADD CONSTRAINT R_197 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Address
	ADD CONSTRAINT R_95 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_357 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Bench_Index
	ADD CONSTRAINT R_186 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Biz_Calendar
	ADD CONSTRAINT R_288 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer
	ADD CONSTRAINT R_211 FOREIGN KEY (User_ID,User_Key) REFERENCES App_User(User_ID,User_Key)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Custo__70C8B53F FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Customer_Portfolio_Monitor
	ADD CONSTRAINT FK__Portfolio__Portf__6FD49106 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_170 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Lot
	ADD CONSTRAINT R_201 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Manager
	ADD CONSTRAINT R_190 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Perf_Rule FOREIGN KEY (Perf_Rule_ID) REFERENCES Perf_Rule(Rule_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary FOREIGN KEY (Summary_ID_Start_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Perf_Summary
	ADD CONSTRAINT FK_Perf_Summary_Portfolio_Summary1 FOREIGN KEY (Summary_ID_End_Date) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_207 FOREIGN KEY (Strategy_ID) REFERENCES Strategy(Strategy_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Policies
	ADD CONSTRAINT R_208 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio
	ADD CONSTRAINT FK_Portfolio_Product FOREIGN KEY (Product_ID,Enterprise_ID) REFERENCES Product(Product_ID,Enterprise_ID)
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio
	ADD CONSTRAINT R_177 FOREIGN KEY (Manager_ID,Enterprise_ID) REFERENCES Manager(Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT FK_Portfolio_Analytics_Portfolio_Summary FOREIGN KEY (Portfolio_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Analytics
	ADD CONSTRAINT R_294 FOREIGN KEY (Bechmark_Summary) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT FK_Portfolio_Benchmark FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
go






ALTER TABLE Portfolio_Benchmark_Xref
	ADD CONSTRAINT R_174 FOREIGN KEY (Benchmark_ID) REFERENCES Benchmark(Benchmark_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Default
	ADD CONSTRAINT R_199 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_ROR
	ADD CONSTRAINT FK_Portfolio_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_270 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Summary
	ADD CONSTRAINT R_202 FOREIGN KEY (Account_ID,Customer_ID,Enterprise_ID) REFERENCES Account(Account_ID,Customer_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_253 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Portfolio_Transaction
	ADD CONSTRAINT R_267 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position
	ADD CONSTRAINT FK_Position_Portfolio_Summary FOREIGN KEY (Summary_ID) REFERENCES Portfolio_Summary(Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position
	ADD CONSTRAINT R_268 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT FK_Position_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Position_ROR
	ADD CONSTRAINT R_203 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Price_Method FOREIGN KEY (Method_ID,Data_Source_ID) REFERENCES Price_Method(Method_ID,Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price
	ADD CONSTRAINT FK_Price_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_194 FOREIGN KEY (Exchange_ID) REFERENCES Exchange(Exchange_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Price_Method
	ADD CONSTRAINT R_196 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Product
	ADD CONSTRAINT R_187 FOREIGN KEY (Enterprise_ID) REFERENCES Enterprise(Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_297 FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Projected_Event
	ADD CONSTRAINT R_182 FOREIGN KEY (Portfolio_ID,Manager_ID,Enterprise_ID) REFERENCES Portfolio(Portfolio_ID,Manager_ID,Enterprise_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Rating
	ADD CONSTRAINT FK_Rating_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Report_ROR
	ADD CONSTRAINT FK_Report_ROR_Perf_Summary FOREIGN KEY (ROR_Summary_ID) REFERENCES Perf_Summary(Perf_Summary_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
go






ALTER TABLE Security_Analytic
	ADD CONSTRAINT FK_Security_Analytic_Security_Master FOREIGN KEY (Security_ID) REFERENCES Security_Master(Security_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






ALTER TABLE Security_Master
	ADD CONSTRAINT R_305 FOREIGN KEY (Data_Source_ID) REFERENCES Financial_Data_Source(Data_Source_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go






