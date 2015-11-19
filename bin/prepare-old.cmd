@echo off

@set PLAYKEY_VERSION=%1
@if "%PLAYKEY_VERSION%" == "" call version.cmd war windows-desktop
@if "%PLAYKEY_SOLNAME%" == "" set PLAYKEY_SOLNAME=Playkey.sln

@set ROOT_PROJ=C:\Users\rudol_000\projects\playkey\old-client
@set DIR_PROJ=%ROOT_PROJ%\client\desktop\
@set DIR_BUILD=D:\build-client-old
@set PROTOCOL_VER="%ROOT_PROJ%\Protocol\version.proto"

@echo package cg;                                                > %PROTOCOL_VER%
@echo enum VersionMajor { VERSION_MAJOR = 0; }                  >> %PROTOCOL_VER%
@echo enum VersionMinor { VERSION_MINOR = 0; }                  >> %PROTOCOL_VER%
@echo enum VersionBuild { VERSION_BUILD = %PLAYKEY_VERSION%; }  >> %PROTOCOL_VER%

@call "%ROOT_PROJ%\Protocol\generate-client.bat"

@call common-prepare.cmd
