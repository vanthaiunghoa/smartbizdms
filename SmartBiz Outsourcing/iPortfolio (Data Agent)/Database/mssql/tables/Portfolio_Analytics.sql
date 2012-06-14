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
** Description: Create table [Portfolio_Analytics]
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

IF OBJECT_ID('dbo.Portfolio_Analytics', N'U') IS NULL
CREATE TABLE dbo.Portfolio_Analytics
( 
	Portfolio_Analytic_ID IPID IDENTITY ,
	Portfolio_Summary    IPID  NOT NULL ,
	Benchmark_Summary_ID IPID  NOT NULL ,
	Bechmark_Summary     IPID  NOT NULL ,
	Summary_ID           IPID  NOT NULL ,
	Effective_Date       datetime  NULL ,
	Accounting_Date      datetime  NULL ,
	Adjusted_Date        datetime  NULL ,
	Trade_Date           datetime  NOT NULL ,
	DataSet_Code         IPCode  NULL ,
	Money_001            IPMoney  NULL ,
	Money_002            IPMoney  NULL ,
	Money_003            IPMoney  NULL ,
	Money_004            IPMoney  NULL ,
	Money_005            IPMoney  NULL ,
	Money_006            IPMoney  NULL ,
	Money_007            IPMoney  NULL ,
	Money_008            IPMoney  NULL ,
	Money_009            IPMoney  NULL ,
	Money_010            IPMoney  NULL ,
	Money_011            IPMoney  NULL ,
	Money_012            IPMoney  NULL ,
	Money_013            IPMoney  NULL ,
	Money_014            IPMoney  NULL ,
	Money_015            IPMoney  NULL ,
	Money_016            IPMoney  NULL ,
	Money_017            IPMoney  NULL ,
	Money_018            IPMoney  NULL ,
	Money_019            IPMoney  NULL ,
	Money_020            IPMoney  NULL ,
	Decimal_001_Value    IPNumber  NULL ,
	Decimal_002_Value    IPNumber  NULL ,
	Decimal_003_Value    IPNumber  NULL ,
	Decimal_004_Value    IPNumber  NULL ,
	Decimal_005_Value    IPNumber  NULL ,
	Decimal_006_Value    IPNumber  NULL ,
	Decimal_007_Value    IPNumber  NULL ,
	Decimal_008_Value    IPNumber  NULL ,
	Decimal_009_Value    IPNumber  NULL ,
	Decimal_010_Value    IPNumber  NULL ,
	Decimal_011_Value    IPNumber  NULL ,
	Decimal_012_Value    IPNumber  NULL ,
	Decimal_013_Value    IPNumber  NULL ,
	Decimal_014_Value    IPNumber  NULL ,
	Decimal_015_Value    IPNumber  NULL ,
	Decimal_016_Value    IPNumber  NULL ,
	Decimal_017_Value    IPNumber  NULL ,
	Decimal_018_Value    IPNumber  NULL ,
	Decimal_019_Value    IPNumber  NULL ,
	Decimal_020_Value    IPNumber  NULL ,
	Decimal_021_Value    IPNumber  NULL ,
	Decimal_022_Value    IPNumber  NULL ,
	Decimal_023_Value    IPNumber  NULL ,
	Decimal_024_Value    IPNumber  NULL ,
	Decimal_025_Value    IPNumber  NULL ,
	Integer_001_Value    IPInt  NULL ,
	Integer_002_Value    IPInt  NULL ,
	Integer_003_Value    IPInt  NULL ,
	Integer_004_Value    IPInt  NULL ,
	Integer_005_Value    IPInt  NULL ,
	Integer_006_Value    IPInt  NULL ,
	Integer_007_Value    IPInt  NULL ,
	Integer_008_Value    IPInt  NULL ,
	Integer_009_Value    IPInt  NULL ,
	Integer_010_Value    IPInt  NULL ,
	Integer_011_Value    IPInt  NULL ,
	Integer_012_Value    IPInt  NULL ,
	Integer_013_Value    IPInt  NULL ,
	Integer_014_Value    IPInt  NULL ,
	Integer_015_Value    IPInt  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Portfolio_Analytics', N'U') IS NOT NULL
	PRINT '<<Success: Table Portfolio_Analytics is created.>>';
ELSE
	PRINT '<<Fail: Table Portfolio_Analytics is not created.>>';
GO

