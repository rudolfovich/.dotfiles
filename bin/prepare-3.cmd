@echo off

@set PROJECT_NAME=client-3

@set PLAYKEY_VERSION=%1
@if "%PLAYKEY_VERSION%" == "" call version.cmd war windows-desktop

@set DIR_PROJ=C:\Users\rudol_000\projects\playkey\%PROJECT_NAME%
@set DIR_BUILD=D:\build-%PROJECT_NAME%

@call common-prepare.cmd

vs
rem if "%1" == "" vs rem start %VSSOL%
rem start %VSSOL%