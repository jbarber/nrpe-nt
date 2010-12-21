This repository holds NSI files for creating [NSIS (Nullsoft Scriptable Install System)](http://nsis.sourceforge.net) installers for the Nagios NRPE daemon. This is to make the installation of the NRPE daemon a quicker and less error prone affair under Windows.

## Prerequisites
To use the scripts you will need:

1. The [NSIS compiler](http://nsis.sourceforge.net/Download)
2. The [NRPE-NT daemon](http://sourceforge.net/projects/nrpent/) - tested with version 0.8b
3. The [Basic NRPE_NT Plugins](http://exchange.nagios.org/directory/Plugins/Uncategorized/Operating-Systems/Windows-NRPE/Basic-NRPE_NT-Plugins/details)

## Instructions

1. Install the NSIS compiler
2. Unzip the NRPE-NT daemon
3. Unzip the Basic NRPE_NT Plugins
4. Copy the .nsi files in this repo to the parent directory of where you unzip'd the NRPE-NT daemon and the plugins and compile each one

This should give you two .exe installers which you can then run to install the NRPE daemon and the basic plugins.

## Post-installation steps

Edit the nrpe.cfg file (%PROGRAMFILE%\nrpe_nt.0.8b-bin\bin\nrpe.cfg) to change the "allowed_hosts" stanza to include your Nagios server's IP address/hostname.

## Help

The NSI's expect the daemon/plugins to extract to particular paths. If you have a different version of the binaries, then you will probably have to change this in the .nsi files.
