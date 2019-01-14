:: hide yourself
@title nircmd:hide
@nircmd win hide title nircmd:hide
@echo off

:: launch store app
explorer.exe shell:appsFolder\SAMSUNGELECTRONICSCoLtd.SamsungFlux_wyx1vj98g3asy!App

:: wait for the app to load completely
:WAIT
tasklist /V /FI "IMAGENAME eq SamsungFlowDesktop.exe"
if not %errorlevel%==0 goto WAIT
nircmd win min title "Samsung Flow"
exit