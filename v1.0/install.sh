#!/bin/bash
cd $(dirname $0)
ln -vnfs $(pwd)/fonts ~/.local/share/fonts/myfonts
mkdir -p ~/texmf/tex/latex
ln -vnfs $(pwd)/BHCexam.cls ~/texmf/tex/latex/BHCexam.cls
mktexlsr
updmap-sys
fc-cache -v
