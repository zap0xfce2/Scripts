@echo off

cls
COLOR 02

echo Folgende Programme werden Installiert: 
echo Firefox, Thunderbird, LibreOffice, izArc, Virenscanner (mit Auswahl)

pushd \\Pfad\zum\Programm\Firefox\
Firefox-Windows.exe -ms
popd

pushd \\Pfad\zum\Programm\Thunderbird\
Thunderbird-Windows.exe -ms
popd

pushd \\Pfad\zum\Programm\LibreOffice\
start /wait msiexec /qn /norestart /i LibO_3.6.5_Win_x86_install_multi.msi
popd

pushd \\Pfad\zum\Programm\Windows\IZArc\
IZArc.exe /SILENT and /NOCANDY /Language="German" /ArcTypes=ALL
popd

echo Welcher Virenscanner?
echo 1. Esset Nod32
echo 2. Microsoft Security Essentials 64Bit
echo 3. Microsoft Security Essentials 32Bit

set INPUT=
set /P INPUT=Zahl eingeben: %=%

if "%INPUT%"=="1" goto nod32
if "%INPUT%"=="2" goto mse64
if "%INPUT%"=="3" goto mse32

:nod32
pushd \\Pfad\zum\Programm\Nod32\
eset_nod32_antivirus_live_installer.exe
popd
goto benutzerkontensteuerung

:mse64
pushd \\Pfad\zum\Programm\MS Security Essentials\
mseinstall_64bit.exe /s /runwgacheck /o
popd
goto benutzerkontensteuerung

:mse32
pushd \\Pfad\zum\Programm\MS Security Essentials\
mseinstall_32bit.exe /s /runwgacheck /o
popd
goto benutzerkontensteuerung

:benutzerkontensteuerung
echo Benutzerkontensteuerung deaktivieren?
echo 1. Ja + Neustart!
echo 2. Nein

set INPUT=
set /P INPUT=Zahl eingeben: %=%

if "%INPUT%"=="1" goto uac
if "%INPUT%"=="2" goto ende

:uac
regedit /s "\\Pfad\zum\Programm\Benutzerkontensteuerung\Benutzerkontensteuerung deaktivieren.reg"
shutdown -r /t 3
echo Installation beendet. System wird neu gestartet.
pause
exit

:ende
echo Installation beendet. Neustart empfohlen!
pause
exit