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
** Description: Create table [Portfolio_Default]
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

IF OBJECT_ID('dbo.Portfolio_Default', N'U') IS NULL
CREATE TABLE dbo.Portfolio_Default
( 
	Portfolio_ID         IPCharID  NOT NULL ,
	Manager_ID           IPID ,
	Enterprise_ID        IPID ,
	Cost_Basis_ID        IPID  NULL ,
	Default_Set_ID       IPID  NOT NULL ,
	Report_ID            IPID  NULL ,
	Valuation_Basis_ID   IPID  NOT NULL ,
	Last_Close_Business_Date datetime  NOT NULL ,
	Last_Month_End_Date  datetime  NOT NULL ,
	Last_Quarter_Business_Date datetime  NOT NULL ,
	Last_Year_End_Business_Date datetime  NOT NULL ,
	Last_Trading         datetime  NOT NULL ,
	Base_Currency_Code   IPCode  NOT NULL ,
	NLS_Code             IPCode  NULL ,
	Custody_Dimension_Set IPCharID  NULL ,
	Lot_Dimension_Set    IPCharID  NOT NULL ,
	Position_Dimension_Set IPCharID  NOT NULL ,
	Transaction_Dimension_Set IPCharID  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Portfolio_Default', N'U') IS NOT NULL
	PRINT '<<Success: Table Portfolio_Default is created.>>';
ELSE
	PRINT '<<Fail: Table Portfolio_Default is not created.>>';
GO

