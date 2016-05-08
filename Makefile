# One Makefile to rule them all
#
# sudo apt-get install pandoc texlive-xetex

all: satzung

satzung: Satzung.html Satzung.pdf

Satzung.pdf: Satzung/Satzung.md Vorstandsunterschriften.md
	cat Satzung/Satzung.md Vorstandsunterschriften.md > Satzung_mit_Unterschriften.md
	pandoc --standalone -f markdown_github Satzung_mit_Unterschriften.md -t latex -V mainfont=sans -o Satzung.pdf
	rm Satzung_mit_Unterschriften.md

Satzung.html: Satzung/Satzung.md
	pandoc --standalone -f markdown_github Satzung/Satzung.md -t html -V mainfont=sans -o Satzung.html

clean:
	rm Satzung.pdf

