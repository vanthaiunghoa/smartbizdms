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
** Description: Create table [Bench_Index]
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

IF OBJECT_ID('dbo.Bench_Index', N'U') IS NULL
CREATE TABLE dbo.Bench_Index
( 
	Bench_Index_ID       IPID IDENTITY ,
	Benchmark_ID         IPCharID ,
	Security_ID          IPID  NOT NULL ,
	Primary_Issue_ID     IPCharID  NOT NULL ,
	Primary_Issue_Type   IPCode  NOT NULL ,
	Calc_Method          IPCode  NULL ,
	Indx_Weigh           IPNumber  NOT NULL ,
	Inv_Purpose          IPCode  NULL ,
	Sort_Number          IPInt  NULL ,
	Active_Indicator     IPIndicator  NULL ,
	Start_Date           datetime  NULL ,
	End_Date             datetime  NULL ,
	Last_Update          datetime  NULL ,
	Update_Source        IPName  NULL 
)
go




IF OBJECT_ID('Bench_Index', N'U') IS NOT NULL
	PRINT '<<Success: Table Bench_Index is created.>>';
ELSE
	PRINT '<<Fail: Table Bench_Index is not created.>>';
GO

