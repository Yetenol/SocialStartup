:: hide yourself
@title nircmd:hide
@nircmd win hide title nircmd:hide
@echo off

:: skip launcher if app is already running
tasklist /FI "IMAGENAME eq OUTLOOK.exe" | find "OUTLOOK"
if %errorlevel%==0 nircmd win activate title "Inbox - anton.pusch@outlook.de - Outlook" && goto ALIVE

:: launch store app
explorer.exe shell:appsFolder\Microsoft.Office.Desktop_8wekyb3d8bbwe!Outlook

:: wait for the app to load completely
:WAIT
tasklist /V /FI "IMAGENAME eq OUTLOOK.exe" | find "Inbox - anton.pusch@outlook.de - Outlook"
if not %errorlevel%==0 goto WAIT
nircmd win max title "Inbox - anton.pusch@outlook.de - Outlook"
nircmd win min title "Inbox - anton.pusch@outlook.de - Outlook"

:: automatically relaunch app when closed
:ALIVE
timeout 5
tasklist /FI "IMAGENAME eq OUTLOOK.exe" | find "OUTLOOK"
if %errorlevel%==0 goto ALIVE
schtasks /Run /TN "Social Startup\outlook"
exit
::@nircmd win hide title "%comspec% - outlook.bat"
::start "" /min "C:\Program Files\WindowsApps\Microsoft.Office.Desktop.Outlook_16050.11029.20108.0_x86__8wekyb3d8bbwe\Office16\OUTLOOK.EXE"
