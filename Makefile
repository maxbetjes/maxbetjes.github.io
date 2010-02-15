CODE=$(HOME)/code/gfrd
FILES=README INSTALL doc/visualization.txt samples/example/example.py
HERE=$(PWD)

all: website

.PHONY: website
website:
	cd $(CODE) && cp $(FILES) $(HERE)/_includes
	jekyll


.PHONY: deploy
deploy:
	git push origin master

