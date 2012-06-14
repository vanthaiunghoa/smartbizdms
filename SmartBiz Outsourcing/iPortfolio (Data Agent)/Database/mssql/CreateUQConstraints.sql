 /*****************************************************************************************************************************
** iPortfolio - iPortfolio Project CONFIDENTIAL
** Unpublished Copyright © 2011 iPortfolio, All Rights Reserved. 
** 
** NOTICE: All information contained herein is, and remains the property of COMPANY. The intellectual and technical concepts 
** contained herein are proprietary to COMPANY and may be covered by patents in process, and are protected by trade secret or 
** copyright law.
** Dissemination of this information or reproduction of this material is strictly forbidden unless prior written permission 
** is obtained from COMPANY. Access to the source code contained herein is hereby forbidden to anyone except current COMPANY 
** employees, managers or contractors who have executed Confidentiality and Non-disclosure agreements explicitly covering
** such access.
** 
** The copyright notice above does not evidence any actual or intended publication or disclosure of this source code, 
** which includes information that is confidential and/or proprietary, and is a trade secret, of COMPANY. ANY REPRODUCTION, 
** MODIFICATION, DISTRIBUTION, PUBLIC PERFORMANCE, OR PUBLIC DISPLAY OF OR THROUGH USE OF THIS SOURCE CODE WITHOUT 
** THE EXPRESS WRITTEN CONSENT OF COMPANY IS STRICTLY PROHIBITED, AND IN VIOLATION OF APPLICABLE LAWS AND INTERNATIONAL
** TREATIES. THE RECEIPT OR POSSESSION OF THIS SOURCE CODE AND/OR RELATED INFORMATION DOES NOT CONVEY OR IMPLY ANY RIGHTS 
** TO REPRODUCE, DISCLOSE OR DISTRIBUTE ITS CONTENTS, OR TO MANUFACTURE, USE, OR SELL ANYTHING THAT IT MAY DESCRIBE, 
** IN WHOLE OR IN PART. 
**
** Description: Create table unique constraints
**
** Author: QuanPhan
** Email: quan@dataagent.com
**
******************************************************************************************************************************
** Change History
******************************************************************************************************************************
** Date			Author			Version		Description
** __________	____________	_______		__________________________________________________________________________________
** 07/21/2011	QuanPhan		 1.0			 Create the file
*****************************************************************************************************************************/	
IF DB_NAME() = 'master'
	USE iPortfolio;
GO

IF DB_NAME() = 'master'
BEGIN
	RAISERROR('<<FAIL: Please run this script in the correct database.>>', 10, 1) WITH NOWAIT;
	RETURN;
END;

ALTER TABLE Account_Holding
	ADD CONSTRAINT uq_Position_Record_ID UNIQUE (Position_Record_ID ASC)
go

ALTER TABLE Alternate_Issue
	ADD CONSTRAINT uq_Alternate_Type UNIQUE (Alternate_Type ASC)
go

ALTER TABLE Alternate_Issue
	ADD CONSTRAINT uq_Security_ID UNIQUE (Security_ID ASC)
go

ALTER TABLE Portfolio_Default
	ADD CONSTRAINT uq_Portfolio_Default_Info UNIQUE (Default_Set_ID ASC)
go

ALTER TABLE Price
	ADD CONSTRAINT uq_Price_Source UNIQUE (Price_ID ASC,Data_Source_ID ASC)
go

ALTER TABLE Price_Method
	ADD CONSTRAINT uq_Price_Method UNIQUE (Method_ID ASC)
go

ALTER TABLE Security_Analytic
	ADD CONSTRAINT uq_Sec_Analytic UNIQUE (Accounting_Date ASC,FieldTag ASC)
go

ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID ASC, Primary_Issue_Type ASC, Data_Source_ID ASC)
go

ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Account_Holding
	ADD CONSTRAINT idxPosRecordID UNIQUE (Position_Record_ID  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XAK1Alternate_Issue UNIQUE (Alternate_Type  ASC)
go





ALTER TABLE Alternate_Issue
	ADD CONSTRAINT XIF1Alternate_Issue UNIQUE (Security_ID  ASC)
go





ALTER TABLE Portfolio_Default
	ADD CONSTRAINT XPKPortfolio_Default_Info UNIQUE (Default_Set_ID  ASC)
go





ALTER TABLE Price
	ADD CONSTRAINT XPKPrice UNIQUE (Price_ID  ASC,Data_Source_ID  ASC)
go





ALTER TABLE Price_Method
	ADD CONSTRAINT XPKPrice_Method UNIQUE (Method_ID  ASC)
go





ALTER TABLE Security_Analytic
	ADD CONSTRAINT XPK_Sec_Analytic UNIQUE (Accounting_Date  ASC,FieldTag  ASC)
go





ALTER TABLE Security_Master
	ADD CONSTRAINT AKSecurity_Master UNIQUE (Primary_Issue_ID  ASC,Primary_Issue_Type  ASC,Data_Source_ID  ASC)
go





