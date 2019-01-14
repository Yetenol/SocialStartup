:: hide yourself
@title nircmd:hide
@nircmd win hide title "Administrator:  nircmd:hide"
@echo off

:: launch keyboard driver setup
start "" "C:\Skripts\Hotkey\apps\setapps.exe"

:: wait for the app to install completely (dialog message)
:WAIT
tasklist /FI "WINDOWTITLE eq setapps.exe" | find "setapps.exe"
if not %errorlevel%==0 goto WAIT
nircmd win close title setapps.exe
exit