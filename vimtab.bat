@echo off

rem Vim Tab Script 
rem Copyright (c) 2010 Susam Pal
rem 
rem All rights reserved.
rem 
rem Redistribution and use in source and binary forms, with or without
rem modification, are permitted provided that the following conditions are
rem met:
rem 
rem   1. Redistributions of source code must retain the above copyright
rem      notice, this list of conditions and the following disclaimer.
rem   2. Redistributions in binary form must reproduce the above copyright
rem      notice, this list of conditions and the following disclaimer in
rem      the documentation and/or other materials provided with the
rem      distribution.
rem   3. Neither the name of the project nor the names of its contributors
rem      may be used to endorse or promote products derived from this
rem      software without specific prior written permission.
rem 
rem THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
rem "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
rem LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
rem PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
rem HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
rem SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
rem TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
rem PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
rem LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
rem NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
rem SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

rem Autodetect the path of Vim executable.
for /f "tokens=2*" %%a in ('reg query HKLM\SOFTWARE\Vim\GVim') ^
do set VIM_EXE=%%b

rem If Vim path detection fails, uncomment the following line and
rem set the path of Vim executable as the value of this variable. 
rem The path must include the filename of the executable.

rem set VIM_EXE=X:\path\to\gvim.exe

set VERSION=0.1
set COPYRIGHT=Copyright (c) 2010 Susam Pal
set LICENSE_URL=http://susam.in/licenses/bsd/

if %1. == . (
    start "" "%VIM_EXE%" %*
) else if %1. == -p. (
    call :path
) else if %1. == --path. (
    call :path
) else if %1. == -e. (
    call :enable
) else if %1. == --enable. (
    call :enable
) else if %1. == -d. (
    call :disable
) else if %1. == --disable. (
    call :disable
) else if %1. == -h. (
    call :help %0
) else if %1. == --help. (
    call :help %0
) else if %1. == /?. (
    call :help %0
) else if %1. == -v. (
    call :version %0
) else if %1. == --version. (
    call :version %0
) else (
    start "" "%VIM_EXE%" --remote-tab-silent %*
)
goto :cleanup

:path
echo %VIM_EXE%
goto :cleanup

:enable
reg add "HKCR\*\shell\Open as new tab in Vim\command" /f ^
        /ve /d "\"%VIM_EXE%\" --remote-tab-silent \"%%1\""
goto :cleanup

:disable
reg delete "HKCR\*\shell\Open as new tab in Vim" /f
goto :cleanup

:help
echo Usage: %1 [OPTION] [FILE]...
echo.
echo If no argument is specified, Vim is launched. If arguments are
echo specified and the first argument is not a valid option then they
echo are assumed to be filenames and passed to the Vim executable. If
echo an existing instance of Vim is running, the files are opened in
echo a new tab page in it, otherwise, a new Vim instance is launched.
echo.
echo Note that if multiple files are specified, multiple tabs are not
echo opened. They are opened as multiple buffers in a new tab.
echo.
echo The -p or --path option may be used to display the Vim executable
echo that is executed while launching Vim or opening files in new tab.
echo This is automatically detected from Windows registry. If it is
echo found to be incorrect, the source code of the script should be
echo edited and VIM_EXE variable should be set to the correct path.
echo.
echo Options:
echo   -p, --path      Display the path of Vim being used.
echo   -e, --enable    Enable 'Open as new tab in Vim' option in context
echo                   menu of files.
echo   -d, --disable   Disable 'Open as new tab in Vim' option in context
echo                   menu of files.
echo   -h, --help, /?  Display this help and exit.
echo   -v, --version   Display version information and exit.
echo.
echo Report bugs to ^<susam@susam.in^>
goto :cleanup

:version
echo %1 %VERSION%
echo %COPYRIGHT%
echo.
echo This is free software. You are permitted to redistribute and use it in
echo source and binary forms, with or without modification, under the terms
echo of the New BSD License. Please see ^<%LICENSE_URL%^> for
echo the complete license.
echo.
echo Written by Susam Pal.
goto :cleanup

:cleanup
set VIM_EXE=
set VERSION=
set COPYRIGHT=
set LICENSE_URL=
