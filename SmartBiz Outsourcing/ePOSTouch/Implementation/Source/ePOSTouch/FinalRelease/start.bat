@echo off

REM    SmartBiz POS is a point of sales application designed for touch screens.
REM    Copyright (C) 2008-2009 SmartBiz, S.L.
REM    http://sourceforge.net/projects/openbravopos
REM
REM    This file is part of SmartBiz POS.
REM
REM    SmartBiz POS is free software: you can redistribute it and/or modify
REM    it under the terms of the GNU General Public License as published by
REM    the Free Software Foundation, either version 3 of the License, or
REM    (at your option) any later version.
REM
REM    SmartBiz POS is distributed in the hope that it will be useful,
REM    but WITHOUT ANY WARRANTY; without even the implied warranty of
REM    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM    GNU General Public License for more details.
REM
REM    You should have received a copy of the GNU General Public License
REM    along with SmartBiz POS.  If not, see <http://www.gnu.org/licenses/>.

set DIRNAME=%~dp0

start /B javaw -splash:splash.png -Xms128m -Xmx256m -XX:MaxPermSize=128m -Djava.library.path="%DIRNAME%lib/Windows/i368-mingw32" -Ddirname.path="%DIRNAME%./" -jar SmartBizPOS.jar %1
