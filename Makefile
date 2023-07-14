# One Makefile to rule them all
#
# sudo apt-get install pandoc texlive-xetex
# sudo apt-get install texlive-fonts-recommended lmodern etoolbox
# 
# Tune margins, so dass die Unterschriften beieinander bleiben!

MARGINS=geometry:"top=1.5cm, bottom=1.5cm, left=1.7cm, right=1.7cm, a4paper"
PANDOC_PDF=pandoc --pdf-engine xelatex --standalone -f markdown_github -t latex -V mainfont=FreeSans -V $(MARGINS) -V fontsize=10pt
PANDOC_HTML=pandoc --standalone -f markdown_github -t html -V mainfont=sans

all: satzung Beitrags-Gebuehrenordnung.pdf Geschaeftsordnung.pdf

satzung: Satzung.html Satzung.pdf

Satzung.pdf: Satzung.md Vorstandsunterschriften.md
	$(PANDOC_PDF) -o build/Satzung.pdf Satzung.md Vorstandsunterschriften.md

Satzung.html: Satzung.md
	$(PANDOC_HTML) -o build/Satzung.html Satzung.md

Beitrags-Gebuehrenordnung.pdf: Beitrags-Gebuehrenordnung.md
	$(PANDOC_PDF) -o build/Beitrags-Gebuehrenordnung.pdf Beitrags-Gebuehrenordnung.md

Geschaeftsordnung.pdf: Geschaeftsordnung.md
	$(PANDOC_PDF) -o build/Geschaeftsordnung.pdf Geschaeftsordnung.md

clean:
	rm -rf build/*.pdf build/*.html

