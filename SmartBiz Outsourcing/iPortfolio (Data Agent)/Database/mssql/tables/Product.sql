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
** Description: Create table [Product]
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

IF OBJECT_ID('dbo.Product', N'U') IS NULL
CREATE TABLE dbo.Product
( 
	Product_ID           IPID  NOT NULL ,
	Enterprise_ID        IPID ,
	Product_Char_ID      IPCharID  NOT NULL ,
	Product_Code         IPCode  NULL ,
	Product_Name         IPName  NULL ,
	Inactive_Indicator   IPIndicator  NULL ,
	Start_Date           datetime  NULL ,
	End_Date             datetime  NULL ,
	UDF_Amt1             IPNumber  NULL ,
	UDF_Amt2             IPNumber  NULL ,
	UDF_Amt3             IPNumber  NULL ,
	UDF_Amt4             IPNumber  NULL ,
	UDF_Amt5             IPNumber  NULL ,
	UDF_Code1            IPCode  NULL ,
	UDF_Code2            IPCode  NULL ,
	UDF_Code3            IPCode  NULL ,
	UDF_Code4            IPCode  NULL ,
	UDF_Code5            IPCode  NULL ,
	UDF_Date1            datetime  NULL ,
	UDF_Date2            datetime  NULL ,
	UDF_Date3            datetime  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Product', N'U') IS NOT NULL
	PRINT '<<Success: Table Product is created.>>';
ELSE
	PRINT '<<Fail: Table Product is not created.>>';
GO

