@echo off
setlocal enabledelayedexpansion

Echo.
If "%1"=="" (Echo Missing source file & GoTo :EOF)
If not exist %~1 (Echo File %~f1 not found & GoTo :EOF)

set ads=type "%1"

:BEGIN
set song=
nircmd.exe wait 500
if "!match!"=="" nircmd.exe setvolume 0 64768 64768
for /f "tokens=3 delims=-" %%A in ('tasklist /V ^| find /I "Spotify - "') do set song=%%A
set /A i=0
if "!song!"=="" GoTo :BEGIN



:CATCH
set match=
for /f "delims=" %%M in ('%ads% ^| find /I "!song!"') do Set match=%%M
if "!match!"=="" GoTo :BEGIN
nircmd.exe setvolume 0 0 0
GoTo :BEGIN