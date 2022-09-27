@echo off

mkdir tmpGPK_%computername%
set dir=%~dp0%
cd %dir%

wmic path softwarelicensingservice get OA3xOriginalProductKey > .\tmpGPK_%computername%\productkey.txt
systeminfo > .\tmpGPK_%computername%\systeminfo.txt

powershell Compress-Archive .\tmpGPK_%computername%\* GPK_%computername%.zip
rmdir /s /q tmpGPK_%computername%