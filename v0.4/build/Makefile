PACKAGE = BHCexam
########################################################################
## LaTeX2e Makefile
##
## Update the following defines for your local configuration, 
##
TEXMFDIR   = ~/texmf/tex/latex/BHCexam
GZIP      = gzip
XELATEX  = xelatex
PDFLATEX  = pdflatex
MAKEINDEX = makeindex
########################################################################
## make [all]		Generates the class(.cls) file, the configuration(.cfg)
##                        file and the documentation (.pdf).  If you don't have 
##                        the required MAKEINDEX (along with `gglo.ist' and
##                        `gind.ist'), then change the first dependency
##			  of "all" from "fullpdf" to "pdf" below.
## make [un]install 	Install or uninstall the class(.cls) file and 
##                        the configuration(.cfg) file.
## make [very]clean	Clean out various auxillary files.  "veryclean"
##			  cleans out more stuff.
########################################################################
## make [full]doc       Generate the documentation.  The "fulldoc" version
##			  adds the change log and the cross-references.
## make idx		Generate the change log and the cross-references
##			  (for fulldoc -- requires MAKEINDEX).
## make cls 		Generate the class(.cls) file and the
##                        configuration(.cfg) file.

########################################################################
## make test		Run test file(s)
## make src		Builds a src distribution (.tar.gz) file.
## make distribtion	Builds a distribution (.tar.gz) file.
########################################################################

all:		veryclean cls fulldoc test clean

install:	cls
		cp $(PACKAGE).{cls,cfg} $(TEXMFDIR)
uninstall:	; rm $(TEXMFDIR)/$(PACKAGE).{cls,cfg}
clean:		; -rm -f *.dvi *.log *.aux *.lof *.lot *.toc 
		-rm -f *.idx *.ind *.glo *.gls *.ilg *.out *~
veryclean:	; -rm -f *.dvi *.log *.aux *.lof *.lot *.toc 
		-rm -f *.idx *.ind *.glo *.gls *.ilg *.out
		-rm -f *.idx *.ind *.glo *.gls *.ilg *.out
		-rm -f *.sty *.cls *.pdf *pk *.cfg *.tar *~


doc:		; $(XELATEX) $(PACKAGE).dtx

cls:		; $(XELATEX) $(PACKAGE).ins

fulldoc:	doc $(PACKAGE).gls $(PACKAGE).ind 
		$(XELATEX) $(PACKAGE).dtx

src:		; mkdir $(PACKAGE)
		cp -p README Makefile $(PACKAGE)
		cp -p $(PACKAGE).dtx $(PACKAGE).ins $(PACKAGE)
		cp -p test*.tex $(PACKAGE)
		tar -cvf $(PACKAGE)-src.tar ./$(PACKAGE) 
		rm -rf $(PACKAGE)
		$(GZIP) -9 $(PACKAGE)-src.tar

distribution:	veryclean cls fulldoc test clean
		mkdir $(PACKAGE)
		cp -p $(PACKAGE).cls $(PACKAGE).cfg $(PACKAGE)
		cp -p *.tex $(PACKAGE)
		cp -p *.pdf $(PACKAGE)
		tar -cvf $(PACKAGE).tar ./$(PACKAGE) 
		rm -rf $(PACKAGE)
		$(GZIP) -9 $(PACKAGE).tar

$(PACKAGE).gls:	doc
		$(MAKEINDEX) -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo

$(PACKAGE).ind:	doc
		$(MAKEINDEX) -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx

test:		cls
		$(XELATEX) test1.tex 
		$(XELATEX) test1.tex 
		$(XELATEX) test2.tex 
		$(XELATEX) test2.tex 
		$(XELATEX) test3.tex 
		$(XELATEX) test3.tex 
		$(XELATEX) test4.tex 
		$(XELATEX) test4.tex 

