Name "Silent"
OutFile "nrpe_nt_plugins.exe"
RequestExecutionLevel admin

Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

InstallDir $PROGRAMFILES\nrpe_nt_plugins

Section "Install"
  SetOutPath $INSTDIR
  WriteUninstaller uninstaller.exe
  File check_disk.vbs
  File /r  "nrpe_nt_plugins\nrpe_nt plugins\*.*"
SectionEnd

Section "Uninstall"
  RMDir /r "$INSTDIR"
SectionEnd