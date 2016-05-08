# One Makefile to rule them all
#
# sudo apt-get install pandoc texlive-xetex

PANDOC_PDF=pandoc --latex-engine xelatex --standalone -f markdown_github -t latex -V mainfont=DroidSans -V geometry=margin=2.5cm -V fontsize=12pt
PANDOC_HTML=pandoc --standalone -f markdown_github -t html -V mainfont=sans

all: satzung Beitrags-Gebuehrenordnung.pdf Geschaeftsordnung.pdf

satzung: Satzung.html Satzung.pdf

Satzung.pdf: Satzung/Satzung.md Vorstandsunterschriften.md
	$(PANDOC_PDF) -o build/Satzung.odf Satzung/Satzung.md Vorstandsunterschriften.md

Satzung.html: Satzung/Satzung.md
	$(PANDOC_HTML) -o build/Satzung.html Satzung/Satzung.md

Beitrags-Gebuehrenordnung.pdf: Beitrags-Gebuehrenordnung.md
	$(PANDOC_PDF) -o build/Beitrags-Gebuehrenordnung.pdf Beitrags-Gebuehrenordnung.md

Geschaeftsordnung.pdf: Geschaeftsordnung.md
	$(PANDOC_PDF) -o build/Geschaeftsordnung.pdf Geschaeftsordnung.md

clean:
	rm -rf build/*

