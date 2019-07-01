#!/bin/bash
cd $(dirname $0)
ln -vnfs $(pwd)/fonts /usr/local/share/fonts/myfonts
ln -vnfs $(pwd)/BHCexam.cls /usr/local/texlive/texmf-local/tex/latex/BHCexam.cls
mktexlsr
updmap-sys
fc-cache -v
