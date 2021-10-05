#!/bin/bash
cd ~
sudo rm -rf ~/abap
sudo rm -rf ~/abaptransports/
curl  -O https://raw.githubusercontent.com/Mrtlearns/abap/main/ux_transports/github-downloader.sh
sudo chmod +x ./github-downloader.sh
curl  -O https://raw.githubusercontent.com/Mrtlearns/abap/main/ux_transports/process_files.sh
sudo chmod +x ./process_files.sh
sudo apt install subversion -y
./github-downloader.sh https://github.com/Mrtlearns/abap/ux_transports/
mkdir -p ~/abaptransports
mv ~/abap/trunk/ux_transports/R* ~/abaptransports/
mv ~/abap/trunk/ux_transports/K* ~/abaptransports/
sudo rm -rf ~/abap
~/process_files.sh
