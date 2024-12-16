MAINNAME=fly-debian
RUNLATEX=docker run --rm -t --workdir=/tmp --user="$(shell id -u):$(shell id -g)" --net=none  -v "$(shell pwd):/tmp" leplusorg/latex:sha-4a17317 bash -c "pdflatex  --interaction batchmode $(MAINNAME).tex ; ls -l $(MAINNAME).pdf"

default: clean print

print:
		$(RUNLATEX)

viewpdf: 
		$(RUNLATEX)
		open $(MAINNAME).pdf

clean:
		rm *.aux {tex/,}*.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc; exit 0
