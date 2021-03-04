#!/bin/bash

/usr/bin/Xvfb :0 -screen 0 1024x768x24 &
/usr/bin/x11vnc -noxrecord &
/root/novnc/utils/launch.sh --vnc localhost:5900 --listen 8080 &
/opt/wine-staging/bin/wine REG ADD "HKEY_CURRENT_USER\\Software\\Wine\\Direct3D" /v "csmt" /t REG_DWORD /d 0x00
/opt/winetricks jet40 mdac28 vb6run
/opt/wine-staging/bin/wine msiexec /i /tmp/TALTAC21131.msi
/opt/wine-staging/bin/wine /opt/wine-staging/lib/wine/explorer.exe & 
#/opt/wine-staging/bin/wine /opt/wine-staging/lib/wine/regedit.exe &
/usr/bin/fluxbox
