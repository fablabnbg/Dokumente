# One Makefile to rule them all
#
# sudo apt-get install pandoc texlive-xetex

PANDOC_PDF=pandoc --latex-engine xelatex --standalone -f markdown_github -t latex -V mainfont=DroidSans -V geometry=margin=2.5cm -V fontsize=12pt
PANDOC_HTML=pandoc --standalone -f markdown_github -t html -V mainfont=sans

all: satzung

satzung: Satzung.html Satzung.pdf

Satzung.pdf: Satzung/Satzung.md Vorstandsunterschriften.md
	$(PANDOC_PDF) Satzung/Satzung.md Vorstandsunterschriften.md -o Satzung.pdf

Satzung.html: Satzung/Satzung.md
	$(PANDOC_HTML) Satzung/Satzung.md -o Satzung.html

clean:
	rm Satzung.pdf

