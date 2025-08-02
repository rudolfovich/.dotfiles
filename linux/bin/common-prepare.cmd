@echo off

if "%DIR_PROJ%" == "" goto error_dir_proj
if "%DIR_BUILD%" == "" goto error_dir_build

if "%PLAYKEY_VERSION%" == "" set PLAYKEY_VERSION=1
if "%TOOLSET%" == "" set TOOLSET=v110_xp
if "%PLAYKEY_SOLNAME%" == "" set PLAYKEY_SOLNAME=PlaykeyClient.sln

mkdir %DIR_BUILD% 2>nul
pushd %DIR_BUILD%
if ERRORLEVEL 1 goto error
cmd /C cmake ^
  -DCMAKE_GENERATOR_TOOLSET=%TOOLSET% ^
  -DCMAKE_VERBOSE_MAKEFILE=OFF ^
  -DVERSION_BUILD=%PLAYKEY_VERSION% ^
  %DIR_PROJ%
if ERRORLEVEL 1 goto error

@set VSSOL=%DIR_BUILD%\%PLAYKEY_SOLNAME%

doskey vs=start %VSSOL%
goto done

:error_dir_proj
  set MISVAR=DIR_PROJ
  goto error

:error_dir_build
  set MISVAR=DIR_BUILD
  goto error

:error
  popd 2>nul
  echo.
  echo Prepare script failed!
  if NOT "%MISVAR%" == "" echo Please set %MISVAR% environment variable!
  exit /B 1

:done
  popd 2>nul
  echo.
  echo Solution has been prepared!
  echo.
  echo Solution: %VSSOL%
  echo.
  echo Type "vs" ^<ENTER^> to open it in Visual Studio.
  echo.
  exit /B 0
