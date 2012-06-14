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
** Description: Create table [Perf_Rule]
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

IF OBJECT_ID('dbo.Perf_Rule', N'U') IS NULL
CREATE TABLE dbo.Perf_Rule
( 
	Rule_ID              IPID IDENTITY ,
	Rule_Code            IPCode  NOT NULL ,
	Rule_Name            IPName  NULL ,
	Calc_Method          IPCode  NOT NULL ,
	Calc_Interval_Code   IPCode  NOT NULL ,
	Calc_Interval_Num    IPInt  NULL ,
	Begin_Weigh_Ind      IPIndicator  NULL ,
	Flow_Weigh_Rule      IPCode  NOT NULL ,
	Accrual_Ind          IPIndicator  NOT NULL ,
	Accrual_Base_Field   IPID  NULL ,
	Accrual_Local_Field  IPID  NULL ,
	Netfee_Ind           IPIndicator  NOT NULL ,
	Fee_Base_Field       IPID  NULL ,
	Fee_Local_Field      IPID  NULL ,
	Netcomm_Ind          IPIndicator  NOT NULL ,
	Comm_Base_Field      IPID  NULL ,
	Comm_Local_Field     IPID  NULL ,
	Aftertax_Ind         IPIndicator  NOT NULL ,
	Tax_Base_Field       IPID  NULL ,
	Tax_Local_Field      IPID  NULL ,
	Liability_Ind        IPIndicator  NOT NULL ,
	Contract_Ind         IPIndicator  NOT NULL ,
	Strategy_Ind         IPIndicator  NOT NULL ,
	Last_Update          datetime  NULL ,
	Update_Source        IPName  NULL 
)
go




IF OBJECT_ID('Perf_Rule', N'U') IS NOT NULL
	PRINT '<<Success: Table Perf_Rule is created.>>';
ELSE
	PRINT '<<Fail: Table Perf_Rule is not created.>>';
GO

