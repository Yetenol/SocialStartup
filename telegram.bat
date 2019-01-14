:: hide yourself
@title nircmd:hide
@nircmd win hide title nircmd:hide
@echo off

:: launch store app
explorer.exe shell:appsFolder\TelegramMessengerLLP.TelegramDesktop_t4vj0pshhgkwm!Telegram.TelegramDesktop.Store

:: wait for the app to load completely
:WAIT
tasklist /FI "WINDOWTITLE eq Telegram" | find "Telegram"
if not %errorlevel%==0 goto WAIT
nircmd win max title Telegram
nircmd win min title Telegram

:: automatically relaunch app when closed
:ALIVE
timeout 5
::tasklist /FI "IMAGENAME eq Telegram.exe" | find "Telegram"
tasklist /FI "WINDOWTITLE eq Telegram" | find "Telegram"
if %errorlevel%==0 goto ALIVE
schtasks /Run /TN "Social Startup\telegram"
exit