In this README file:
I. 	DEVELOPMENT GUIDE
II. 	BITROCK INSTALLER BUILDING GUIDE
III. 	DEPLOYMENT GUIDE
IV. 	EXECUTION GUIDE

==============================================================================
I. 	DEVELOPMENT GUIDE
------------------------------------------------------------------------------
Prerequisites:
1. Netbeans IDE 6.9.1 (or latest version)
2. JDK 1.6
3. MySQL
-------------------------------------------------------------------------------
1. Open Netbeans
2. Browse to the project folder and open the SmartBiz POS

==============================================================================
II.	BITROCK INSTALLER BUILDING GUIDE
------------------------------------------------------------------------------
Prerequisites:
1. BitRock InstallBuilder Enterprise 6.5.3
2. Installer project file located in installer/SmartBizPOS.xml
3. Binary executable folder of SmartBiz placed in E:\ (default name is SmartBizPOS-1.00-bin)
------------------------------------------------------------------------------
1. Run BitRock InstallBuilder
2. Open installer/SmartBizPOS.xml
3. Check if the paths are correct or not. If the paths are not correct, open SmartBizPOS.xml then search and replace with the proper ones.
4. Run Build inside the InstallBuilder to start building the setup file.
5. The setup file for SmartBiz POS can be found at <InstallBuilder Dir>\output (typically, <InstallBuilder Dir> is C:\Program Files\BitRock InstallBuilder Enterprise 6.5.3)

==============================================================================
III.	DEPLOYMENT GUIDE
------------------------------------------------------------------------------
Prerequisites:
1. Ant must be installed properly
2. JRE must be installed to run Ant
-------------------------------------------------------------------------------
There are 4 options to build the applications using Ant:
1. run "ant dist.bin" to build the zip which contains only the executable.
2. run "ant dist.bin.jre.mysql" to build the binary zip which contains the executable, embedded JRE and demo MySQL databases.
3. run "ant dist.bin.jre" to build the zip which contains the executable and the embedded JRE.
4. run "ant dist.bin.mysql" to build the zip which contains the executable the embedded MySQL.

==============================================================================
IV.	EXECUTION GUIDE
------------------------------------------------------------------------------
The embedded MySQL is configured to run on port 3396.
Embedded JRE version is 1.6
-------------------------------------------------------------------------------
There are also 4 options to run the application:
1. run "start.bat": JRE and MySQL database must be installed as prerequisites.
2. run "start-jre-mysql.bat": The application will be run on the embedded JRE and MySQL.
3. run "start-jre.bat": The application will be run on the embedded JRE. MySQL database should be installed beforehand.
3. run "start-mysql.bat": The application will be run on a pre-installed JRE and access the database stored in the embedded MySQL.