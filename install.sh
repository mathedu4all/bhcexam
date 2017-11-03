#!/bin/bash
ln -s fonts /usr/local/share/fonts/myfonts
ln -s BHCexam.cls /usr/local/texlive/texmf-local/tex/latex/BHCexam.cls
mktexlsr
updmap-sys
