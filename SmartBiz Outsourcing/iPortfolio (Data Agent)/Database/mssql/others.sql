CREATE TYPE IPDATE
	FROM DATETIME NULL
go




CREATE TYPE IPBit
	FROM SMALLINT NULL
go




CREATE TYPE IPID
	FROM INTEGER NOT NULL
go




CREATE TYPE IPInt
	FROM INTEGER NULL
go




CREATE TYPE IPNumber
	FROM DECIMAL(28,12) NULL
go




CREATE TYPE IPCharID
	FROM CHAR(30) NOT NULL
go




CREATE TYPE IPCode
	FROM VARCHAR(15) NULL
go




CREATE TYPE IPDesc
	FROM VARCHAR(4096) NULL
go




CREATE TYPE IPIndicator
	FROM SMALLINT NULL
go




CREATE TYPE IPList
	FROM VARCHAR(15) NULL
go




CREATE TYPE IPLongString
	FROM VARCHAR(256) NULL
go




CREATE TYPE IPName
	FROM VARCHAR(128) NULL
go




CREATE TYPE IPShortDesc
	FROM VARCHAR(256) NULL
go




CREATE TYPE IPShortString
	FROM VARCHAR(25) NULL
go




CREATE TYPE IPString
	FROM VARCHAR(50) NULL
go




CREATE TYPE IPText
	FROM VARCHAR NULL
go




CREATE TYPE IPURL
	FROM VARCHAR(512) NULL
go




CREATE TYPE IPMoney
	FROM MONEY NULL
go




CREATE TYPE IPLongCode
	FROM VARCHAR(30) NULL
go




CREATE TYPE IPMaxString
	FROM VARCHAR() NULL
go




CREATE TYPE IPByte
	FROM TINYINT NULL
go




CREATE TYPE IPGUID
	FROM UNIQUEIDENTIFIER NULL
go




CREATE TYPE IPImage
	FROM VARBINARY NULL
go




CREATE TYPE IPShort
	FROM SMALLINT NULL
go




CREATE TYPE IPVarBin
	FROM VARBINARY() NULL
go




CREATE TYPE IPBin
	FROM BINARY(4096) NULL
go




CREATE DEFAULT DABitZero
	AS 0
go




CREATE DEFAULT DADelimiter
	AS ','
go




CREATE DEFAULT DAMetaEntity
	AS 0
go




CREATE DEFAULT getdate
	AS getdate()
go




CREATE DEFAULT getusername
	AS suser_sname()
go




CREATE NONCLUSTERED INDEX XIF1Account ON Account
( 
	Customer_ID           ASC
)
go




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




ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
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




ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go




ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
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




ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
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




ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
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




ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
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




ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
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




ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
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




exec sp_bindefault 'DABitZero', 'Security_Master.Prev_SMF_Indicator'
go




exec sp_bindefault 'getdate', 'Security_Master.Start_Date'
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

