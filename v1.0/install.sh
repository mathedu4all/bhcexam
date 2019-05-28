#!/bin/bash
cd $(dirname $0)
ln -s $(pwd)/fonts /usr/local/share/fonts/myfonts
ln -s $(pwd)/BHCexam.cls /usr/local/texlive/texmf-local/tex/latex/BHCexam.cls
mktexlsr
updmap-sys
