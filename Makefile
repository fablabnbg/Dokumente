# One Makefile to rule them all
#
# sudo apt-get install pandoc texlive-xetex
# 
# Tune margins, so dass die Unterschriften beieinander bleiben!

<<<<<<< HEAD
=======
MARGINS=geometry:"top=1.5cm, bottom=1.5cm, left=1.7cm, right=1.7cm, a4paper"
PANDOC_PDF=pandoc --latex-engine xelatex --standalone -f markdown_github -t latex -V mainfont=FreeSans -V $(MARGINS) -V fontsize=10pt
PANDOC_HTML=pandoc --standalone -f markdown_github -t html -V mainfont=sans

>>>>>>> c80fb7aac1b948f050ab10583d5c7e1733d46c5d
all: satzung Beitrags-Gebuehrenordnung.pdf Geschaeftsordnung.pdf

satzung: Satzung.html Satzung.pdf

<<<<<<< HEAD
Satzung.pdf: Satzung/Satzung.md
	@echo Datum in Satzung/Satzung.md
	@grep Nürnberg, Satzung/Satzung.md
	pandoc --standalone -f markdown_github Satzung/Satzung.md -t latex --latex-engine=xelatex -V 'mainfont=Droid Sans' -V papersize=a4 -V fontsize=12pt -V geometry:margin=2cm -o Satzung.pdf
=======
Satzung.pdf: Satzung.md Vorstandsunterschriften.md
	$(PANDOC_PDF) -o build/Satzung.pdf Satzung.md Vorstandsunterschriften.md

Satzung.html: Satzung.md
	$(PANDOC_HTML) -o build/Satzung.html Satzung.md

Beitrags-Gebuehrenordnung.pdf: Beitrags-Gebuehrenordnung.md
	$(PANDOC_PDF) -o build/Beitrags-Gebuehrenordnung.pdf Beitrags-Gebuehrenordnung.md
>>>>>>> c80fb7aac1b948f050ab10583d5c7e1733d46c5d

Geschaeftsordnung.pdf: Geschaeftsordnung.md
	$(PANDOC_PDF) -o build/Geschaeftsordnung.pdf Geschaeftsordnung.md

Beitrags-Gebuehrenordnung.pdf: Beitrags-Gebuehrenordnung.md
	pandoc --standalone -f markdown_github Beitrags-Gebuehrenordnung.md -t latex --latex-engine=xelatex -V 'mainfont=Droid Sans' -V papersize=a4 -V fontsize=12pt -V geometry:margin=2cm -o Beitrags-Gebuehrenordnung.pdf

Geschaeftsordnung.pdf: Geschaeftsordnung.md
	pandoc --standalone -f markdown_github Geschaeftsordnung.md -t latex --latex-engine=xelatex -V 'mainfont=Droid Sans' -V papersize=a4 -V fontsize=12pt -V geometry:margin=2cm -o Geschaeftsordnung.pdf


clean:
<<<<<<< HEAD
	rm *.pdf
=======
	rm -rf build/*.pdf build/*.html
>>>>>>> c80fb7aac1b948f050ab10583d5c7e1733d46c5d

