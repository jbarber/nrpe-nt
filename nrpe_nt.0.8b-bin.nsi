Name "Silent"
OutFile "nrpe_nt.0.8b-bin.exe"
RequestExecutionLevel admin

Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

InstallDir $PROGRAMFILES\nrpe_nt.0.8b-bin

Section "Install"
  SetOutPath $INSTDIR
  WriteUninstaller uninstaller.exe
  File /r  "nrpe_nt.0.8b-bin\*.*"
  
  # Add commands to the config file
  FileOpen $0 bin\nrpe.cfg a
  FileSeek $0 0 END
  FileWrite $0 "$\n"
  FileWrite $0 "command[check_cpu]=c:\Program Files\nrpe_nt_plugins\bin\cpuload_nrpe_nt.exe 70 90$\n"
  FileWrite $0 "command[check_memload]=c:\Program Files\nrpe_nt_plugins\bin\memload_nrpe_nt.exe 70 90$\n"
  FileWrite $0 "command[check_eventlog]=c:\Program Files\nrpe_nt_plugins\bin\eventlog_nrpe_nt.exe -m 7200$\n"
  FileWrite $0 'command[check_filesystems]=cscript /nologo "c:\Program Files\nrpe_nt_plugins\check_disk.vbs" /w:20 /c:10$\n'
  FileClose $0
  
  nsExec::ExecToLog "$INSTDIR\bin\NRPE_NT.exe -i -n"
  nsExec::ExecToLog 'net start "Nagios Remote Plugin Executor for NT/W2K"'
  nsExec::ExecToLog "netsh firewall add portopening TCP 5666 NRPE"
  
  MessageBox MB_YESNO "Edit config file $INSTDIR\bin\nrpe.cfg" /SD IDNO IDYES true1 IDNO foo
  true1:
    nsExec::ExecToLog "write.exe $INSTDIR\bin\nrpe.cfg"
	Goto foo
  foo:
SectionEnd

Section "Uninstall"
  nsExec::ExecToLog 'net stop "Nagios Remote Plugin Executor for NT/W2K"'
  nsExec::ExecToLog "$INSTDIR\bin\NRPE_NT.exe -u"
  nsExec::ExecToLog "netsh firewall delete portopening TCP 5666"
  RMDir /r $INSTDIR
SectionEnd