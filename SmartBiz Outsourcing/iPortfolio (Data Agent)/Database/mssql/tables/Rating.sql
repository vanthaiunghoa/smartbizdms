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
** Description: Create table [Rating]
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

IF OBJECT_ID('dbo.Rating', N'U') IS NULL
CREATE TABLE dbo.Rating
( 
	Rating_ID            IPID ,
	Security_ID          IPID  NOT NULL ,
	Data_Source_ID       IPID  NOT NULL ,
	Effective_Date       datetime  NOT NULL ,
	AlphaRating          IPCode  NOT NULL ,
	AuditAlphaRating     IPCode  NULL ,
	AuditDate            datetime  NULL ,
	Rating_Code          IPName  NULL ,
	Rating_Type_Indicator IPCharID  NOT NULL ,
	NumericalRating      IPNumber  NULL ,
	Rating_Enhancement   IPName  NULL ,
	AnalystCode          IPCode  NULL ,
	Reason               IPName  NULL ,
	ApprovedBy           IPName  NULL ,
	SubmittedBy          IPName  NULL ,
	SubmittedDate        datetime  NULL ,
	WatchList_Indicator  IPIndicator  NULL ,
	WatchList_OnDate     datetime  NULL ,
	IPO_Indicator        IPIndicator  NULL ,
	IPO_Verify_Indicator IPIndicator  NULL ,
	WatchList_OffDate    datetime  NULL ,
	RatingComments       IPShortDesc  NULL ,
	ApprovalComments     IPShortDesc  NULL ,
	OfferingPrice        IPNumber  NULL ,
	Provider             IPName  NOT NULL ,
	Program              IPName  NOT NULL ,
	UserChar1            IPName  NULL ,
	UserChar2            IPName  NULL ,
	UserChar3            IPName  NULL ,
	UserChar4            IPName  NULL ,
	UserChar5            IPName  NULL ,
	UserChar6            IPName  NULL ,
	UserChar7            IPName  NULL ,
	UserChar8            IPName  NULL ,
	UserChar9            IPName  NULL ,
	UserChar10           IPName  NULL ,
	UserDate1            datetime  NULL ,
	UserDate2            datetime  NULL ,
	UserDate3            datetime  NULL ,
	UserNum1             IPNumber  NULL ,
	UserNum2             IPNumber  NULL ,
	UserNum3             IPNumber  NULL ,
	Last_Update          datetime  NULL ,
	Update_By            IPName  NULL 
)
go




IF OBJECT_ID('Rating', N'U') IS NOT NULL
	PRINT '<<Success: Table Rating is created.>>';
ELSE
	PRINT '<<Fail: Table Rating is not created.>>';
GO

