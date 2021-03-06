:: Trailing semicolon in this variable as set by current (2017/01)
:: conda-build breaks us. Manual fix:
set "MSYS2_ARG_CONV_EXCL=/AI;/AL;/OUT;/out"
:: Delegate to the Unixy script. We need to translate the key path variables
:: to be Unix-y rather than Windows-y, though.
copy "%RECIPE_DIR%\build.sh" .
echo "libdiR
FOR /F "delims=" %%i IN ('cygpath.exe -u "%BUILD_PREFIX%"') DO set "BUILD_PREFIX=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u -p "%PATH%"') DO set "PATH_OVERRIDE=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%LIBRARY_PREFIX%"') DO set "LIBRARY_PREFIX_M=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%LIBRARY_PREFIX%"') DO set "LIBRARY_PREFIX_U=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%LIBRARY_PREFIX%"') DO set "LIBRARY_PREFIX=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%PREFIX%"') DO set "PREFIX=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%PYTHON%"') DO set "PYTHON=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%RECIPE_DIR%"') DO set "RECIPE_DIR=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%SP_DIR%"') DO set "SP_DIR=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%SRC_DIR%"') DO set "SRC_DIR=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%STDLIB_DIR%"') DO set "STDLIB_DIR=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%LIBRARY_INC%"') DO set "LIBRARY_INC=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%LIBRARY_BIN%"') DO set "LIBRARY_BIN=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%LIBRARY_LIB%"') DO set "LIBRARY_LIB=%%i"

set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
set
bash -x "%RECIPE_DIR%/build.sh"
if errorlevel 1 exit 1
exit 0
