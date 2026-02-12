#
# Makefile - makes latex-slides.ps, creates a 4up PostScript copy and 
#            corrects the access codes, copies the files to the
#            web pages in ~/www/latex/
#


D=try
D=problems
Dps=$(D).ps
Dtex=$(D).tex

all:	$(Dps)

$(Dps):	$(D).dvi 
#	dvips -o $(D).ps $(D).dvi
	touch $(D).dvi

$(D).dvi:	$(D).tex #les*.dvi 
	rm -f *.aux
	lualatex $(D)
	lualatex  $(D)
	bibtex $(D)
	lualatex $(D)
	lualatex $(D)

#les*.dvi: les*.tex 
#	echo "dummy operation on $(@)"

clean:  # Removes and everything that cannot be computed and creates a new backup file
	-rm -f $(D).aux
	-rm -f $(D).bbl
	-rm -f $(D).blg
	-rm -f $(D).cre
	-rm -f $(D).crf
	-rm -f $(D).dvi
	-rm -f $(D).idx
	-rm -f $(D).ilg
	-rm -f $(D).ind
	-rm -f $(D).ind~
	-rm -f $(D).log
	-rm -f $(D).log~
	-rm -f $(D).ps
	-rm -f $(D).pdf
	-rm -f $(D).toc 
	-rm -f *.bak
	-rm les*.aux
	-rm *~
	 mkdir ../backup
	-rm -r backup
	-cp -R * ../backup/.
	-mv ../backup .

cleanup:  # Removes backup file and everything that cannot be computed
	make clean
	-rm -rf backup
