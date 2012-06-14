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
** Description: Create database user defined type.
**
** Author: QuanPhan
** Email: quan@dataagent.com
**
******************************************************************************************************************************
** Change History
******************************************************************************************************************************
** Date			  Author		Version		Description
** __________	____________	_______		__________________________________________________________________________________
** 07/28/2011	QuanPhan		1.0			Change data type IPCharID from VARCHAR(30) to VARCHAR(64)
** 07/21/2011	QuanPhan		1.0			Create the file
*****************************************************************************************************************************/	
IF DB_NAME() = 'master'
	USE iPortfolio;
GO

IF DB_NAME() = 'master'
BEGIN
	RAISERROR('<<FAIL: Please run this script in the correct database.>>', 10, 1) WITH NOWAIT;
	RETURN;
END;

IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPDATE')
BEGIN
	CREATE TYPE IPDATE FROM DATETIME NULL;
	PRINT '<<SUCCESS: Created type IPDATE.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPBit')
BEGIN
	CREATE TYPE dbo.IPBit FROM SMALLINT NULL;
	PRINT '<<SUCCESS: Created type IPBit.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPID')
BEGIN
	CREATE TYPE dbo.IPID FROM INTEGER NOT NULL;
	PRINT '<<SUCCESS: Created type IPID.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPInt')
BEGIN
	CREATE TYPE dbo.IPInt FROM INTEGER NULL;
	PRINT '<<SUCCESS: Created type IPInt.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPNumber')
BEGIN
	CREATE TYPE dbo.IPNumber FROM DECIMAL(28,12) NULL;
	PRINT '<<SUCCESS: Created type IPNumber.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPCharID')
BEGIN
	CREATE TYPE dbo.IPCharID FROM CHAR(64) NOT NULL;
	PRINT '<<SUCCESS: Created type IPCharID.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPCode')
BEGIN
	CREATE TYPE dbo.IPCode FROM VARCHAR(15) NULL;
	PRINT '<<SUCCESS: Created type IPCode.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPDesc')
BEGIN
	CREATE TYPE dbo.IPDesc FROM VARCHAR(4096) NULL;
	PRINT '<<SUCCESS: Created type IPDesc.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPIndicator')
BEGIN
	CREATE TYPE dbo.IPIndicator FROM SMALLINT NULL;
	PRINT '<<SUCCESS: Created type IPIndicator.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPList')
BEGIN
	CREATE TYPE dbo.IPList FROM VARCHAR(15) NULL;
	PRINT '<<SUCCESS: Created type IPList.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPLongString')
BEGIN
	CREATE TYPE dbo.IPLongString FROM VARCHAR(256) NULL;
	PRINT '<<SUCCESS: Created type IPLongString.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPName')
BEGIN
	CREATE TYPE dbo.IPName FROM VARCHAR(128) NULL;
	PRINT '<<SUCCESS: Created type IPName.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPShortDesc')
BEGIN
	CREATE TYPE dbo.IPShortDesc FROM VARCHAR(256) NULL;
	PRINT '<<SUCCESS: Created type IPShortDesc.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPShortString')
BEGIN
	CREATE TYPE dbo.IPShortString FROM VARCHAR(25) NULL;
	PRINT '<<SUCCESS: Created type IPShortString.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPString')
BEGIN
	CREATE TYPE dbo.IPString FROM VARCHAR(50) NULL;
	PRINT '<<SUCCESS: Created type IPString.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPText')
BEGIN
	CREATE TYPE dbo.IPText FROM VARCHAR(MAX) NULL;
	PRINT '<<SUCCESS: Created type IPText.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPURL')
BEGIN
	CREATE TYPE dbo.IPURL FROM VARCHAR(512) NULL;
	PRINT '<<SUCCESS: Created type IPURL.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPMoney')
BEGIN
	CREATE TYPE dbo.IPMoney FROM MONEY NULL;
	PRINT '<<SUCCESS: Created type IPMoney.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPLongCode')
BEGIN
	CREATE TYPE dbo.IPLongCode FROM VARCHAR(30) NULL;
	PRINT '<<SUCCESS: Created type IPLongCode.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPMaxString')
BEGIN
	CREATE TYPE dbo.IPMaxString FROM VARCHAR(MAX) NULL;
	PRINT '<<SUCCESS: Created type IPMaxString.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPByte')
BEGIN
	CREATE TYPE dbo.IPByte FROM TINYINT NULL;
	PRINT '<<SUCCESS: Created type IPByte.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPGUID')
BEGIN
	CREATE TYPE dbo.IPGUID FROM UNIQUEIDENTIFIER NULL;
	PRINT '<<SUCCESS: Created type IPGUID.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPImage')
BEGIN
	CREATE TYPE dbo.IPImage FROM VARBINARY(MAX) NULL;
	PRINT '<<SUCCESS: Created type IPImage.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPShort')
BEGIN
	CREATE TYPE dbo.IPShort FROM SMALLINT NULL;
	PRINT '<<SUCCESS: Created type IPShort.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPVarBin')
BEGIN
	CREATE TYPE dbo.IPVarBin FROM VARBINARY(MAX) NULL;
	PRINT '<<SUCCESS: Created type IPVarBin.>>'
END;
IF NOT EXISTS(SELECT 1 FROM sys.types WHERE NAME='IPBin')
BEGIN
	CREATE TYPE dbo.IPBin FROM BINARY(4096) NULL;
	PRINT '<<SUCCESS: Created type IPBin.>>'
END;
GO

