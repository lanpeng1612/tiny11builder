@echo off
setlocal EnableExtensions EnableDelayedExpansion

title tiny11 builder alpha
echo 欢迎使用tiny11图像创建者！【网络菜鸟愚沐】修改版
timeout /t 3 /nobreak > nul
cls

set DriveLetter=
echo 只需要驱动号字母即可如：e 
set /p DriveLetter=请输入Windows 11映像的驱动器号: 
set "DriveLetter=%DriveLetter%:"
echo.
if not exist "%DriveLetter%\sources\boot.wim" (
	echo.在指定的驱动器号中找不到Windows操作系统安装文件..
	echo.
	echo.请输入正确的DVD驱动器号..
	goto :Stop
)

if not exist "%DriveLetter%\sources\install.wim" (
	echo.在指定的驱动器号中找不到Windows操作系统安装文件..
	echo.
	echo.请输入正确的DVD驱动器号..
	goto :Stop
)
md c:\tiny11
echo 正在复制Windows映像...
xcopy.exe /E /I /H /R /Y /J %DriveLetter% c:\tiny11 >nul
echo 复制完成!
sleep 2
cls
echo 获取图像信息:
dism /Get-WimInfo /wimfile:c:\tiny11\sources\install.wim
set index=
set /p index=请输入图像索引“第一条信息”:

echo=
echo 是否保留Edge浏览器和onedrive
set /p yes_no=输入 y 保留：

set "index=%index%"
echo 正在装载Windows映像。这可能需要一段时间.
echo.
md c:\scratchdir
dism /mount-image /imagefile:c:\tiny11\sources\install.wim /index:%index% /mountdir:c:\scratchdir

echo 安装完成！正在执行应用程序的删除...
echo 正在删除 Clipchamp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Clipchamp.Clipchamp_2.2.8.0_neutral_~_yxz26nhyzhsrt 
echo 正在删除 News...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingNews_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Weather...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Xbox...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GamingApp_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 GetHelp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GetHelp_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 GetStarted...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Office Hub...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Solitaire...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 PeopleApp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 PowerAutomate...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.PowerAutomateDesktop_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 ToDo...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Todos_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Alarms...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsAlarms_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Mail...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Feedback Hub...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsFeedbackHub_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Maps...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Sound Recorder...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 XboxTCUI...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Xbox.TCUI_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 XboxGamingOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 XboxGameOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGameOverlay_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 XboxSpeechToTextOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxSpeechToTextOverlay_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Your Phone...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.YourPhone_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Music...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Video...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Family...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.MicrosoftFamily_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 QuickAssist...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.QuickAssist_2022.507.446.0_neutral_~_8wekyb3d8bbwe
echo 正在删除 Teams...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftTeams_23002.403.1788.1930_x64__8wekyb3d8bbwe
echo 正在删除 Cortana...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.549981C3F5F10_4.2204.13303.0_neutral_~_8wekyb3d8bbwe

echo 正在删除 of system apps complete! Now proceeding to removal of system packages...
timeout /t 1 /nobreak > nul
cls
echo 正在删除 Internet Explorer...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~en-US~11.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~~11.0.22621.1265 > nul
echo 正在删除 LA57:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Kernel-LA57-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo 正在删除 Handwriting:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo 正在删除 OCR:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo 正在删除 Speech:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo 正在删除 TTS:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo 正在删除 Media Player Legacy:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~en-US~10.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~~10.0.22621.1 > nul
echo 正在删除 Tablet PC Math:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-TabletPCMath-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
echo 正在删除 Wallpapers:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

rem 选择是否保留Edge浏览器和onedrive

if not "%yes_no%" == "y" (
echo 正在删除 Edge:
rd "C:\scratchdir\Program Files (x86)\Microsoft\Edge" /s /q
rd "C:\scratchdir\Program Files (x86)\Microsoft\EdgeUpdate" /s /q
echo 正在删除 OneDrive:
takeown /f C:\scratchdir\Windows\System32\OneDriveSetup.exe
icacls C:\scratchdir\Windows\System32\OneDriveSetup.exe /grant Administrators:F /T /C
del /f /q /s "C:\scratchdir\Windows\System32\OneDriveSetup.exe"
)
echo 删除完成!
timeout /t 2 /nobreak > nul
cls
echo 正在加载注册表...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul
echo 绕过系统要求（在系统映像上）:
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
echo 禁用 Teams:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v "ConfigureChatAutoInstall" /t REG_DWORD /d "0" /f >nul 2>&1
echo 禁用赞助应用程序:
Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "ConfigureStartPins" /t REG_SZ /d "{\"pinnedList\": [{}]}" /f >nul 2>&1
echo 在OOBE上启用本地帐户:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "BypassNRO" /t REG_DWORD /d "1" /f >nul 2>&1
copy /y %~dp0autounattend.xml c:\scratchdir\Windows\System32\Sysprep\autounattend.xml
echo 禁用 内部服务器错误:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d "0" /f >nul 2>&1
echo 禁用 Chat icon（聊天图标）:
Reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d "3" /f >nul 2>&1
Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f >nul 2>&1
echo 调整完成!
echo 正在卸载注册表...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1
echo 正在清理图像...
dism /image:c:\scratchdir /Cleanup-Image /StartComponentCleanup /ResetBase
echo 清理完成.
echo 正在卸载映像...
dism /unmount-image /mountdir:c:\scratchdir /commit
echo 正在导出图像...
Dism /Export-Image /SourceImageFile:c:\tiny11\sources\install.wim /SourceIndex:%index% /DestinationImageFile:c:\tiny11\sources\install2.wim /compress:max
del c:\tiny11\sources\install.wim
ren c:\tiny11\sources\install2.wim install.wim
echo Windows映像已完成。继续 boot.wim.
timeout /t 2 /nobreak > nul
cls
echo 正在装载启动映像:
dism /mount-image /imagefile:c:\tiny11\sources\boot.wim /index:2 /mountdir:c:\scratchdir
echo 正在加载注册表...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul
echo 绕过系统要求（在设置图像上）:
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
echo 调整完成! 
echo 正在卸载注册表...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1
echo 正在卸载映像...
dism /unmount-image /mountdir:c:\scratchdir /commit 
cls
echo tiny11图像现在完成。继续制定ISO...
echo 正在复制无人参与文件以绕过OOBE上的MS帐户...
copy /y %~dp0autounattend.xml c:\tiny11\autounattend.xml
echo.
echo 创建ISO图像...
%~dp0oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bc:\tiny11\boot\etfsboot.com#pEF,e,bc:\tiny11\efi\microsoft\boot\efisys.bin c:\tiny11 %~dp0tiny11.iso
echo 创建完成！按任意键退出脚本...
pause 
echo 执行清理...
rd c:\tiny11 /s /q 
rd c:\scratchdir /s /q 
exit





