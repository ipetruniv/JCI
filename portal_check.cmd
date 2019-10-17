@echo off
REM "Checking Admin Portal" 
set SuccessRate=0


http-ping.exe -q http://stepmdmqa.labcorp.ad.ctc/webui/CTRAdminPortal
if %ErrorLevel% equ 100 (set /a SuccessRate=%SuccessRate%+%ErrorLevel%) else (echo False; echo %ErrorLevel%;)

http-ping.exe -q  http://stepmdmqa.labcorp.ad.ctc/webui/CTRInternalUserPortal
if %ErrorLevel% equ 100 (set /a SuccessRate=%SuccessRate%+%ErrorLevel%) else (echo False; echo %ErrorLevel%;)


http-ping.exe -q http://stepmdmqa.labcorp.ad.ctc/webui/CTRSupplierPortal_SS
if %ErrorLevel% equ 100 (set /a SuccessRate=%SuccessRate%+%ErrorLevel%) else (echo False; echo %ErrorLevel%;)

http-ping.exe -q http://stepmdmqa.labcorp.ad.ctc/webui/CTRDigitalContentAuthorPortal
if %ErrorLevel% equ 100 (set /a SuccessRate=%SuccessRate%+%ErrorLevel%) else (echo False; echo %ErrorLevel%;)

http-ping.exe -q http://stepmdmqa.labcorp.ad.ctc/webui/CTRProductSourcingPortal
if %ErrorLevel% equ 100 (set /a SuccessRate=%SuccessRate%+%ErrorLevel%) else (echo False; echo %ErrorLevel%;)

echo "Total:"
echo %SuccessRate%
if %SuccessRate% equ 500 (
echo ALL IS FINE
pause
)
if %SuccessRate% equ 500 (exit 0) else (exit 25)

