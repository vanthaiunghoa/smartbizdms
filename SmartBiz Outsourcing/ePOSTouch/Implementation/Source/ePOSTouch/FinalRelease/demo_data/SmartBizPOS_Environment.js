// ========================================================================
// Setup development environment for SmartBiz or later.           ======
// Author: SUnflowerVN Co., Ltd.                                     ======
//                                                                   ======
// Step1: Get SystemEnvironment(SysEnv) & Install-Location (homeDir) ======
// Step2: Set *_HOME variable name & set PATH                        ======
//        + ANT_HOME & ANT_OPTS="-Xmx1024M"                          ======
//          (For 64bit: ANT_OPTS="-Xmx1024M -XX:MaxPermSize128M" )   ======
//        + CATALINA_HOME, CATALINA_BASE & CATALINA_OPTS             ======
//          (DONE) Copy tools.jar & comment WatchedResource          ======
//          (DONE) Configure 4 Tomcat Manager in tomcat-users.xml    ======
//        + JAVA_HOME                                                ======
//        + ORACLE_HOME & ORACLE_SID(eBiz)                           ======
// Step3: Oracle performance turning & change HTTP port              ======
// ========================================================================


// Step1: Get SystemEnvironment(SysEnv) & Install-Location (homeDir)
var Shell = new ActiveXObject("WScript.Shell");
var SysEnv = Shell.Environment("USER"); //Shell.Environment("SYSTEM");
var homeDir = "D:\\SunflowerVN\\3rd-PartySofts\\";

SysEnv("JAVA_HOME") = homeDir + "\java\\jdk";
SysEnv("JAVA_OPTS") = "-Xms768M -Xmx1024M -XX:MaxPermSize=512M"


// Set JAVA_HOME\bin to the PATH
var pathString = SysEnv("PATH"); // Shell.ExpandEnvironmentStrings("%PATH%");
var index = pathString.indexOf(SysEnv("JAVA_HOME")+"\\bin");
if (index == -1)
{
  SysEnv("PATH") = SysEnv("JAVA_HOME") + "\\bin;" + pathString;
  SysEnv("PATH") = SysEnv("JAVA_HOME") + "\\jre\\bin;" + pathString;
}


WScript.Echo ("PATH=" + SysEnv("PATH"));
WScript.Echo ("SmartBiz Environment All Done!");
  