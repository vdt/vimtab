INTRODUCTION

Vimtab is a Windows batch script that can be used to open files in new
tab pages in gVim. Additionally, it can also be used to register a
context menu option for files to open them in new tab pages in gVim by
right clicking the files.


NECESSITY

Vim installer for Windows doesn't create any context menu option for
files that lets us open them in new tab pages in an existing instance of
gVim. The closest thing it does is create context menu options for files
called 'Edit with existing Vim'. This option lets us open a file in a
new buffer in an existing tab page in an existing instance of gVim.
However, this option does not open a file in a new tab page in an
existing instance of gVim. Vimtab fills this gap by creating a context
menu option for files called 'Open as new tab in Vim' which lets us open
files in new tab pages in an existing instance of gVim. Additionally,
the script itself can be invoked from the command prompt to open new
files in new tab pages in an existing instance of gVim.


INSTALLATION

Since this is just a one file script, installing it simply requires
downloading the vimtab.bat file and copying it to some directory present
in the Windows PATH variable. To download this script, visit
https://github.com/susam/vimtab and click the 'ZIP' button. Then unzip
the downloaded file and copy the vimtab.bat file from it into a
directory specified in the Windows PATH variable.

There are various ways to check the Windows PATH variable.

  1. Hold down the 'Windows' key and press the 'Break' key to launch the
     'System Properties'. It can also be launched by right clicking
     'My Computer' and selecting 'Properties'. If you are on
     Windows Vista, Windows 7 or a later version of Windows, click
     'Advanced system settings'. Click 'Advanced' tab. Click
     'Environment variables' button. Look for the 'PATH' variable in
     'System variables' section.
  2. Open 'Command Prompt' and run the command: echo %PATH%.

Once vimtab.bat is placed in a directory specified in the Windows PATH
variable, it can be launched from command prompt by simply executing the
command:

    vimtab


USAGE

To open a file, say, foo.txt in a new tab page, execute the command:

    vimtab foo.txt

This opens the file in a new tab page in an existing gVim instance if an
instance of gVim is already running. Otherwise, it opens the file in a
new instance of gVim.

To enable a context menu option called 'Open as new tab in Vim' for all
files so that you can open a file in a new tab page in gVim by right
clicking it, execute the command:

    vimtab --enable

Once executed, you should get an option called 'Open as new tab in Vim'
when you right click files. For more details on how to use vimtab,
execute the command:

    vimtab --help


LICENSE

This is free software. You are permitted to redistribute and use it in
source and binary forms, with or without modification, under the terms
of the New BSD License. See the LICENSE.txt file for more details.

This software is provided WITHOUT ANY WARRANTY; without even the implied
warranties of MERCHANTIBILITY and FITNESS FOR A PARTICULAR PURPOSE. See
the LICENSE.txt file for more details.

If you do not have a copy of the LICENSE.txt file, please visit
http://susam.in/licenses/bsd/ to see the license.
