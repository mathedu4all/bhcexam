#!/bin/bash
cd $(dirname $0)
mkdir -p ~/.local/share/fonts/
ln -vnfs $(pwd)/fonts ~/.local/share/fonts/myfonts
mkdir -p ~/texmf/tex/latex
ln -vnfs $(pwd)/BHCexam.cls ~/texmf/tex/latex/BHCexam.cls
mktexlsr
updmap-sys
sudo apt install -y fontconfig
fc-cache -v
