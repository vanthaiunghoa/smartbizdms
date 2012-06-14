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
** Description: Create table [Perf_Summary]
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

IF OBJECT_ID('dbo.Perf_Summary', N'U') IS NULL
CREATE TABLE dbo.Perf_Summary
( 
	Perf_Summary_ID      IPID IDENTITY ,
	Summary_ID_End_Date  IPID  NOT NULL ,
	Summary_ID_Start_Date IPID  NOT NULL ,
	Perf_Rule_ID         IPID  NOT NULL ,
	Data_Source_ID       IPID  NOT NULL ,
	Start_Date           datetime  NOT NULL ,
	End_Date             datetime  NOT NULL ,
	Created_Date         datetime  NULL ,
	Base_Currency_Code   IPCode  NOT NULL ,
	Ror_Base             IPNumber  NULL ,
	Cur_Ror_Base         IPNumber  NULL ,
	Inv_Ror_Base         IPNumber  NULL ,
	Ror_Local            IPNumber  NULL ,
	Cur_Ror_Local        IPNumber  NULL ,
	Inv_Ror_Local        IPNumber  NULL ,
	Perf_Inflow          IPNumber  NULL ,
	Perf_Outflow         IPNumber  NULL ,
	Mv_Begin             IPNumber  NULL ,
	Mv_End               IPNumber  NULL ,
	Row_Count            IPInt  NULL ,
	Load_Status          IPCode  NOT NULL ,
	Load_Completion_Date datetime  NULL ,
	Last_Update          datetime  NULL ,
	Update_Source        IPName  NULL 
)
go




IF OBJECT_ID('Perf_Summary', N'U') IS NOT NULL
	PRINT '<<Success: Table Perf_Summary is created.>>';
ELSE
	PRINT '<<Fail: Table Perf_Summary is not created.>>';
GO

