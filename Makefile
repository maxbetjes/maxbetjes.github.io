CODE=$(HOME)/code/gfrd
FILES=README INSTALL doc/visualization.txt samples/example/example.py
HERE=$(PWD)

all: website

.PHONY: website
website:
	cd $(CODE) && cp $(FILES) $(HERE)/_includes
	jekyll
	mv _site/src/*.html _site/
	cp _site/*.html .
	rm support.html


.PHONY: deploy
deploy:
	git push origin master

