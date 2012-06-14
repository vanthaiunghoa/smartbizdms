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
** Description: Create database defaults
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

IF DB_NAME() = 'master'
	USE iPortfolio;
GO

IF DB_NAME() = 'master'
BEGIN
	RAISERROR('<<FAIL: Please run this script in the correct database.>>', 10, 1) WITH NOWAIT;
	RETURN;
END;

IF OBJECT_ID('DABitZero', N'D') IS NULL
BEGIN
	EXEC('CREATE DEFAULT DABitZero AS 0');
	IF OBJECT_ID('DABitZero', N'D') IS NOT NULL
		PRINT '<<SUCCESS: Created default DABitZero.>>';
END;

IF OBJECT_ID('DADelimiter', N'D') IS NULL
BEGIN
	EXEC('CREATE DEFAULT DADelimiter AS '',''');
	IF OBJECT_ID('DADelimiter', N'D') IS NOT NULL
		PRINT '<<SUCCESS: Created default DADelimiter.>>';
END;

IF OBJECT_ID('DAMetaEntity', N'D') IS NULL
BEGIN
	EXEC('CREATE DEFAULT DAMetaEntity AS 0');
	IF OBJECT_ID('DAMetaEntity', N'D') IS NOT NULL
		PRINT '<<SUCCESS: Created default DAMetaEntity.>>';
END;

IF OBJECT_ID('getusername', N'D') IS NULL
BEGIN
	EXEC('CREATE DEFAULT getusername AS suser_sname()');
	IF OBJECT_ID('getusername', N'D') IS NOT NULL
		PRINT '<<SUCCESS: Created default getusername.>>';
END;

GO

IF OBJECT_ID('GETDATE', N'D') IS NULL
BEGIN
	EXEC('CREATE DEFAULT getdate AS getdate()');
	IF OBJECT_ID('getdate', N'D') IS NOT NULL
		PRINT '<<SUCCESS: Created default getdate.>>';
END;

GO
