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
** Description: Create table [Price]
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

IF OBJECT_ID('dbo.Price', N'U') IS NULL
CREATE TABLE dbo.Price
( 
	Price_ID             IPID IDENTITY ,
	Data_Source_ID       IPID  NOT NULL ,
	Method_ID            IPID  NULL ,
	Security_ID          IPID  NOT NULL ,
	Ex_Dividend_Indicator IPIndicator ,
	Price                IPNumber  NULL ,
	From_FX_Security_ID  IPID  NULL ,
	From_Currency_Code   IPCode  NOT NULL ,
	Price_Currency_Code  IPCode  NOT NULL ,
	Price_Date           datetime  NOT NULL ,
	Ask_Price            IPNumber  NULL ,
	Bid_Price            IPNumber  NULL ,
	Price_Day_Open       IPNumber ,
	Price_Day_Low        IPNumber  NULL ,
	Price_Day_Mid        IPNumber  NULL ,
	Price_Day_High       IPNumber  NULL ,
	Price_Day_Last       IPNumber  NULL ,
	Price_Multiplier     IPNumber  NULL ,
	NAIC_Price           IPNumber  NULL ,
	Factor               IPNumber  NULL ,
	Volume               IPNumber  NULL ,
	Yield                IPCode  NULL ,
	Yield_Type           IPCode  NULL ,
	UDF_Price_1          IPNumber  NULL ,
	UDF_Price_2          IPNumber  NULL ,
	UDF_Price_3          IPNumber  NULL ,
	UDF_Price_4          IPNumber  NULL ,
	UDF_Price_5          IPNumber  NULL ,
	UDF_Price_6          IPNumber ,
	UDF_Price_7          IPNumber ,
	UDF_Date_1           datetime  NULL ,
	UDF_Date_2           datetime  NULL ,
	UDF_Date_3           datetime  NULL ,
	UDF_Field_1          IPString  NULL ,
	UDF_Field_2          IPString  NULL ,
	UDF_Field_3          IPString ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Price', N'U') IS NOT NULL
	PRINT '<<Success: Table Price is created.>>';
ELSE
	PRINT '<<Fail: Table Price is not created.>>';
GO

