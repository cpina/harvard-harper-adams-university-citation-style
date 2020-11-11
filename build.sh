#!/bin/bash

set -e
set -u

pandoc --pdf-engine=xelatex \
	--bibliography test_bibliography_ha_style.bib \
	--csl /usr/share/citation-style-language/styles/harvard-anglia-ruskin-university.csl \
	-f markdown example-citations.md \
	-s -o tmp/example-citations.odt

#cd tmp
#pdflatex example-citations.tex
#pdflatex example-citations.tex
#pdflatex example-citations.tex
#pdflatex example-citations.tex
