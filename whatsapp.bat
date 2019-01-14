:: hide yourself
@title nircmd:hide
@nircmd win hide title nircmd:hide
@echo off

:: launch store app
explorer.exe shell:appsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!WhatsAppDesktop

:: wait for the app to load completely
:WAIT
tasklist /FI "WINDOWTITLE eq WhatsApp" | find "WhatsApp"
if not %errorlevel%==0 goto WAIT
timeout 1
nircmd win max title WhatsApp
nircmd win min title WhatsApp

:: automatically relaunch app when closed
:ALIVE
timeout 5
tasklist /FI "IMAGENAME eq WhatsApp.exe" | find "WhatsApp"
if %errorlevel%==0 goto ALIVE
schtasks /Run /TN "Social Startup\whatsapp"
exit