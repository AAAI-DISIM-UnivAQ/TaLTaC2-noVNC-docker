## TaLTaC2 running in the browser throught docker, Wine and noVNC

### Instructions

To properly work the Dockerfile expects the installer from the binary distribution of TaLTaC2 (```TALTAC21131.msi```) to be in the same directory.
It can be downloaded from [the TaLTaC2 official site](https://www.taltac.com/download/). Be sure to download the zip under "Pacchetto di installazione completo 2.11.3.1" and extract ```TALTAC21131.msi``` inside this repository.

Running ``` make``` will generate the image and start it, then in the browser noVNC will prompt to install the required Wine dependencies and TaLTaC2. **Do not change the TaLTaC2 installation path.** Once the installation is completed, TaLTaC2 will start.

