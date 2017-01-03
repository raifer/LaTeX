SHELL=/bin/bash

LATEX=pdflatex
EDITOR ?= xdg-open

all : document.pdf document.txt
text : document.txt

# pdf
document.pdf : document.tex
	$(LATEX) document.tex

# text file
document.txt : document.pdf
	pdftotext -layout document.pdf

view:
	evince document.pdf &

read :
	$(EDITOR) document.txt &

clean clear:
	rm -rf auto *tns *-blx.bib *run.xml *.bcf *.aux *.bbl *.blg *.dvi *.toc *.log *.ps *.out *.lot *.lof *.glg *.glo *.gls *.xdy *.ist *~ $(TMPFILES)

clobber: clean
	rm -rf *.pdf *.txt
