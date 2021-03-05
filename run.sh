#!/bin/bash

if [ ! -f '/root/prefix32/drive_c/users/root/Application Data/TaLTaC2/bin/TaLTaC2.exe' ]; then
	echo -e 'Starting dependencies installation\n' > installation.log
	xterm -T Setup -e tail -f installation.log &
	/opt/wine-staging/bin/wine REG ADD "HKEY_CURRENT_USER\\Software\\Wine\\Direct3D" /v "csmt" /t REG_DWORD /d 0x00 | tee -a installation.log
	/opt/winetricks jet40 mdac28 vb6run | tee -a installation.log
	/opt/wine-staging/bin/wine msiexec /i /tmp/TALTAC21131.msi | tee -a installation.log
	echo -e '\n\nDone.' >> installation.log
	sleep 1
fi

/opt/wine-staging/bin/wine '/root/prefix32/drive_c/users/root/Application Data/TaLTaC2/bin/TaLTaC2.exe'

