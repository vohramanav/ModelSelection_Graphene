#!/bin/sh

pdflatex slides.tex
pdflatex slides.tex
rm *.aux *.log *.out *.toc *.nav *.snm
