# One Makefile to rule them all


satzung: Satzung.pdf

Satzung.pdf: Satzung/Satzung.md
	@echo Datum in Satzung/Satzung.md
	@grep Nürnberg, Satzung/Satzung.md
	pandoc --standalone -f markdown_github Satzung/Satzung.md -t latex -Vsansfont=true -o Satzung.pdf

Satzung.html: Satzung/Satzung.md
	pandoc --standalone -f markdown_github Satzung/Satzung.md -t html -Vsansfont=true -o Satzung.html

clean:
	rm Satzung.pdf

