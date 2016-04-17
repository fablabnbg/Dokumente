# One Makefile to rule them all

all: satzung

satzung: Satzung.html Satzung.pdf

Satzung.pdf: Satzung/Satzung.md
	@echo Datum in Satzung/Satzung.md
	@grep Nürnberg, Satzung/Satzung.md
	pandoc --standalone -f markdown_github Satzung/Satzung.md -t latex -V mainfont=sans -o Satzung.pdf

Satzung.html: Satzung/Satzung.md
	pandoc --standalone -f markdown_github Satzung/Satzung.md -t html -Vsansfont=true -o Satzung.html

clean:
	rm Satzung.pdf

