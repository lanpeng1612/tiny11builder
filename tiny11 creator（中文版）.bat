@echo off
setlocal EnableExtensions EnableDelayedExpansion

title tiny11 builder alpha
echo ��ӭʹ��tiny11ͼ�񴴽��ߣ�������������塿�޸İ�
timeout /t 3 /nobreak > nul
cls

set DriveLetter=
echo ֻ��Ҫ��������ĸ�����磺e 
set /p DriveLetter=������Windows 11ӳ�����������: 
set "DriveLetter=%DriveLetter%:"
echo.
if not exist "%DriveLetter%\sources\boot.wim" (
	echo.��ָ���������������Ҳ���Windows����ϵͳ��װ�ļ�..
	echo.
	echo.��������ȷ��DVD��������..
	goto :Stop
)

if not exist "%DriveLetter%\sources\install.wim" (
	echo.��ָ���������������Ҳ���Windows����ϵͳ��װ�ļ�..
	echo.
	echo.��������ȷ��DVD��������..
	goto :Stop
)
md c:\tiny11
echo ���ڸ���Windowsӳ��...
xcopy.exe /E /I /H /R /Y /J %DriveLetter% c:\tiny11 >nul
echo �������!
sleep 2
cls
echo ��ȡͼ����Ϣ:
dism /Get-WimInfo /wimfile:c:\tiny11\sources\install.wim
set index=
set /p index=������ͼ����������һ����Ϣ��:

echo=
echo �Ƿ���Edge�������onedrive
set /p yes_no=���� y ������

set "index=%index%"
echo ����װ��Windowsӳ���������Ҫһ��ʱ��.
echo.
md c:\scratchdir
dism /mount-image /imagefile:c:\tiny11\sources\install.wim /index:%index% /mountdir:c:\scratchdir

echo ��װ��ɣ�����ִ��Ӧ�ó����ɾ��...
echo ����ɾ�� Clipchamp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Clipchamp.Clipchamp_2.2.8.0_neutral_~_yxz26nhyzhsrt 
echo ����ɾ�� News...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingNews_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Weather...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Xbox...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GamingApp_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� GetHelp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GetHelp_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� GetStarted...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Office Hub...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Solitaire...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� PeopleApp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� PowerAutomate...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.PowerAutomateDesktop_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� ToDo...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Todos_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Alarms...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsAlarms_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Mail...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Feedback Hub...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsFeedbackHub_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Maps...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Sound Recorder...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� XboxTCUI...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Xbox.TCUI_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� XboxGamingOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� XboxGameOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGameOverlay_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� XboxSpeechToTextOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxSpeechToTextOverlay_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Your Phone...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.YourPhone_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Music...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Video...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Family...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.MicrosoftFamily_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� QuickAssist...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.QuickAssist_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo ����ɾ�� Teams...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftTeams_23002.403.1788.1930_x64__8wekyb3d8bbwe
echo ����ɾ�� Cortana...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.549981C3F5F10_4.2204.13303.0_neutral_~_8wekyb3d8bbwe

echo ����ɾ�� of system apps complete! Now proceeding to removal of system packages...
timeout /t 1 /nobreak > nul
cls
echo ����ɾ�� Internet Explorer...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~en-US~11.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~~11.0.22621.1265 > nul
echo ����ɾ�� LA57:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Kernel-LA57-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo ����ɾ�� Handwriting:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo ����ɾ�� OCR:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo ����ɾ�� Speech:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo ����ɾ�� TTS:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo ����ɾ�� Media Player Legacy:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~en-US~10.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~~10.0.22621.1 > nul
echo ����ɾ�� Tablet PC Math:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-TabletPCMath-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo ����ɾ�� Wallpapers:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

rem ѡ���Ƿ���Edge�������onedrive

if not "%yes_no%" == "y" (
echo ����ɾ�� Edge:
rd "C:\scratchdir\Program Files (x86)\Microsoft\Edge" /s /q
rd "C:\scratchdir\Program Files (x86)\Microsoft\EdgeUpdate" /s /q
echo ����ɾ�� OneDrive:
takeown /f C:\scratchdir\Windows\System32\OneDriveSetup.exe
icacls C:\scratchdir\Windows\System32\OneDriveSetup.exe /grant Administrators:F /T /C
del /f /q /s "C:\scratchdir\Windows\System32\OneDriveSetup.exe"
)
echo ɾ�����!
timeout /t 2 /nobreak > nul
cls
echo ���ڼ���ע���...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul
echo �ƹ�ϵͳҪ����ϵͳӳ���ϣ�:
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1
echo ���� Teams:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v "ConfigureChatAutoInstall" /t REG_DWORD /d "0" /f >nul 2>&1
echo ��������Ӧ�ó���:
Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "ConfigureStartPins" /t REG_SZ /d "{\"pinnedList\": [{}]}" /f >nul 2>&1
echo ��OOBE�����ñ����ʻ�:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "BypassNRO" /t REG_DWORD /d "1" /f >nul 2>&1
copy /y %~dp0autounattend.xml c:\scratchdir\Windows\System32\Sysprep\autounattend.xml
echo ���� �ڲ�����������:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d "0" /f >nul 2>&1
echo ���� Chat icon������ͼ�꣩:
Reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d "3" /f >nul 2>&1
Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f >nul 2>&1
echo �������!
echo ����ж��ע���...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1
echo ��������ͼ��...
dism /image:c:\scratchdir /Cleanup-Image /StartComponentCleanup /ResetBase
echo �������.
echo ����ж��ӳ��...
dism /unmount-image /mountdir:c:\scratchdir /commit
echo ���ڵ���ͼ��...
Dism /Export-Image /SourceImageFile:c:\tiny11\sources\install.wim /SourceIndex:%index% /DestinationImageFile:c:\tiny11\sources\install2.wim /compress:max
del c:\tiny11\sources\install.wim
ren c:\tiny11\sources\install2.wim install.wim
echo Windowsӳ������ɡ����� boot.wim.
timeout /t 2 /nobreak > nul
cls
echo ����װ������ӳ��:
dism /mount-image /imagefile:c:\tiny11\sources\boot.wim /index:2 /mountdir:c:\scratchdir
echo ���ڼ���ע���...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul
echo �ƹ�ϵͳҪ��������ͼ���ϣ�:
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1
echo �������! 
echo ����ж��ע���...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1
echo ����ж��ӳ��...
dism /unmount-image /mountdir:c:\scratchdir /commit 
cls
echo tiny11ͼ��������ɡ������ƶ�ISO...
echo ���ڸ������˲����ļ����ƹ�OOBE�ϵ�MS�ʻ�...
copy /y %~dp0autounattend.xml c:\tiny11\autounattend.xml
echo.
echo ����ISOͼ��...
%~dp0oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bc:\tiny11\boot\etfsboot.com#pEF,e,bc:\tiny11\efi\microsoft\boot\efisys.bin c:\tiny11 %~dp0tiny11.iso
echo ������ɣ���������˳��ű�...
pause 
echo ִ������...
rd c:\tiny11 /s /q 
rd c:\scratchdir /s /q 
exit





