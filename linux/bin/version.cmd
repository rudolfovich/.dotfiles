@echo off

@set PLAYKEY_API=war
@set PLAYKEY_SOFTWARE=windows-desktop

@if NOT "%1" == "" set PLAYKEY_API=%1
@if NOT "%2" == "" set PLAYKEY_SOFTWARE=%2

@set BASH="C:\Program Files (x86)\Git\bin\bash.exe" --cd-to-home
@for /f "delims=" %%a in ('%BASH% /d/version.sh %PLAYKEY_API% %PLAYKEY_SOFTWARE%') do @set PLAYKEY_VERSION=%%a
@echo The latest version of %PLAYKEY_SOFTWARE% is %PLAYKEY_VERSION% on %PLAYKEY_API%
