#!/bin/bash
cd $(dirname $0)
mkdir -p /usr/local/share/fonts
ln -vnfs $(pwd)/fonts /usr/local/share/fonts/myfonts
mkdir -p ~/texmf/tex/latex
ln -vnfs $(pwd)/BHCexam.cls /usr/local/texlive/texmf-local/tex/latex/BHCexam.cls
mktexlsr
updmap-sys
sudo apt install -y fontconfig
fc-cache -v
