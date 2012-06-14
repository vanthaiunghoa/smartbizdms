@ECHO OFF
@ECHO OFF

REM ****************************************************************
REM * Parameters
REM *	%1:	Server name
REM *	%2: Database name
REM *	%3:	Log File Path
REM ****************************************************************

SET DBSERVER=%1
SET DBName=%2
IF a%DBSERVER%==a SET /P DBSERVER=Please enter SERVER_NAME[\INSTANCE_NAME]:
IF a%DBSERVER%==a SET DBSERVER=.
IF a%DBName%==a SET /P DBName=Please enter DB_NAME[\INSTANCE_NAME]:
IF a%DBName%==a  SET DBName=master
IF %DBName%==Null SET DBName=master

SET LOGFILEPATH=%3
IF a%LOGFILEPATH%==a ECHO %DATE% %TIME% > %0.log
IF a%LOGFILEPATH%==a SET LOGFILEPATH=%0.log

SET msg=Running SQL scripts on %DBName% database (Folder %CD%) 
ECHO %msg%
IF NOT %LOGFILEPATH%==con ECHO %msg% >> %LOGFILEPATH%

SET msg=Destination database: %DBSERVER%  %DBName%
ECHO %msg%
IF NOT %LOGFILEPATH%==con ECHO %msg% >> %LOGFILEPATH%

REM ****************************************************************
REM *	Pre Creating Table
REM ****************************************************************
FOR %%f IN (
	CreateTypes.sql
	CreateDefaults.sql
) DO (
	ECHO Excuting the file: %%f on server: %DBSERVER%
	IF NOT %LOGFILEPATH%==con ECHO Excuting the file: %%f on server: %DBSERVER% >> %LOGFILEPATH%
	REM echo sqlcmd  -S %DBSERVER% -d %DBName% -E -i "%%f" >> %LOGFILEPATH%
	sqlcmd  -S %DBSERVER% -d %DBName% -E -i "%%f" >> %LOGFILEPATH%
	IF ERRORLEVEL 1 (
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO Critical Error. Review the deployment process. >> %LOGFILEPATH%
		EXIT /B
	)	
)

REM ****************************************************************
REM *	Creating Table
REM ****************************************************************
FOR /R tables %%f IN (
	*.sql
) DO (
	ECHO Excuting the file: %%f on server: %DBSERVER%
	IF NOT %LOGFILEPATH%==con ECHO Excuting the file: %%f on server: %DBSERVER% >> %LOGFILEPATH%
	REM echo sqlcmd  -S %DBSERVER% -d %DBName% -E -i "%%f" >> %LOGFILEPATH%
	sqlcmd  -S %DBSERVER% -d %DBName% -E -i "%%f" >> %LOGFILEPATH%
	IF ERRORLEVEL 1 (
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO Critical Error. Review the deployment process. >> %LOGFILEPATH%
		EXIT /B
	)	
)

REM ****************************************************************
REM *	Post Creating Table
REM ****************************************************************
FOR %%f IN (
	CreatePKConstraints.sql
	CreateFKConstraints.sql
	CreateUQConstraints.sql
	CreateIndexes.sql
) DO (
	ECHO Excuting the file: %%f on server: %DBSERVER%
	IF NOT %LOGFILEPATH%==con ECHO Excuting the file: %%f on server: %DBSERVER% >> %LOGFILEPATH%
	REM echo sqlcmd  -S %DBSERVER% -d %DBName% -E -i "%%f" >> %LOGFILEPATH%
	sqlcmd  -S %DBSERVER% -d %DBName% -E -i "%%f" >> %LOGFILEPATH%
	IF ERRORLEVEL 1 (
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOGFILEPATH%
		ECHO Critical Error. Review the deployment process. >> %LOGFILEPATH%
		EXIT /B
	)	
)

ECHO Done!
ECHO Review the log in the file [%LOGFILEPATH%]
