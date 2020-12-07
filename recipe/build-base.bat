pushd msvc
  if "%ARCH%" == "32" (
    set ARCH=Win32
    set ARTIFACTS_DIR=%CD%\Release
  ) else (
    set ARCH=x64
    set ARTIFACTS_DIR=%CD%\%ARCH%\Release
  )
  msbuild.exe /p:Platform=%ARCH% /p:Configuration=Release
  dir /s /q
  
  echo is ARTIFACTS_DIR %ARTIFACTS_DIR%
  copy /y %ARTIFACTS_DIR%\*.dll %LIBRARY_BIN%\
  if errorlevel 1 exit 1
  copy /y %ARTIFACTS_DIR%\*.exe %LIBRARY_BIN%\
  if errorlevel 1 exit 1
  copy /y  %ARTIFACTS_DIR%\*.lib %LIBRARY_LIB%\
  if errorlevel 1 exit 1
popd
