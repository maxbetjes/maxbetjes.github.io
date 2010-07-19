DIR_GFRD=$(HOME)/code/gfrd
FILES_GFRD=doc/visualization.txt samples/example/example.py
HERE=$(PWD)

all: website

.PHONY: website
website:
	cd $(DIR_GFRD) && cp $(FILES_GFRD) $(HERE)/_includes
	jekyll
	mv _site/src/*.html _site/
	cp _site/*.html .
	rm support.html


.PHONY: deploy
deploy:
	git push origin master

