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

CREATE NONCLUSTERED INDEX idx_Security_ID ON Account_Holding
( 
	Security_ID           ASC
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

CREATE NONCLUSTERED INDEX idx_Lot_Date ON Lot
( 
	Accounting_Date       ASC,
	Adjusted_Date         ASC
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

CREATE NONCLUSTERED INDEX idx_Security_ID ON Position
( 
	Security_ID           ASC
)
go

CREATE NONCLUSTERED INDEX idx_Data_Source_ID ON Price
( 
	Data_Source_ID        ASC
)
go

CREATE NONCLUSTERED INDEX idx_Price_Date ON Price
( 
	Price_Date            ASC
)
go

CREATE NONCLUSTERED INDEX idx_Data_Source_ID ON Security_Analytic
( 
	Data_Source_ID        ASC
)
go

CREATE NONCLUSTERED INDEX fk_Accounting_Date ON Security_Analytic
( 
	Accounting_Date       ASC
)
go

CREATE NONCLUSTERED INDEX fk_Security_Name ON Security_Master
( 
	Security_Name         ASC
)
go

CREATE NONCLUSTERED INDEX XIF1Account ON Account
( 
	Customer_ID           ASC
)
go

