RM = rm -f
LATEXMK ?= latexmk -pdflatex='pdflatex --shell-escape'

.PHONY: clean

doc.pdf: doc.tex
	$(LATEXMK) -f -pdf $<

clean:
	$(LATEXMK) -c
