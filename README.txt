Vimtab is a batch file that can be used to open files in new tab pages
in Vim. Additionally, it can also be used to register a context menu
option for files to open them as new tab pages in Vim by right clicking
the files. Installation and usage details are provided below.

Since this is just a one file script, installing it simply requires
downloading the vimtab.bat file and copying it to some directory present
in the Windows PATH variable. There are various ways to check the
Windows PATH variable.

  1. Hold down the 'Windows' key and press the 'Break' key to launch the
     'System Properties'. It can also be launched by right clicking
     'My Computer' and selecting 'Properties'. Click 'Advanced' tab.
     Click 'Environment variables' button. Look for the 'PATH' variable
     in 'System variables' section.
  2. Open 'Command Prompt' and run the command: echo %PATH%.

Once, vimtab.bat is placed in a directory mentioned in the Windows PATH
variable, it can be launched from anywhere by simply executing the
command:

    vimtab

To open a file, say, foo.txt in a new tab page, execute the command:

    vimtab foo.txt

This will open the file as a new tab page in the same Vim instance.

To enable a context menu option called 'Open as new tab in Vim' for all
files so that you can open a file as a new tab page in Vim by right
clicking it, execute the command:

    vimtab --enable

Once executed, you should get an option called 'Open as new tab in Vim'
when you right click files. 

This is free software. You are permitted to redistribute and use it in
source and binary forms, with or without modification, under the terms
of the New BSD License. See the LICENSE.txt file for more details.

This software is provided WITHOUT ANY WARRANTY; without even the implied
warranties of MERCHANTIBILITY and FITNESS FOR A PARTICULAR PURPOSE. See
the LICENSE.txt file for more details.
