CODE=$(HOME)/code/gfrd
FILES=README INSTALL doc/visualization.txt samples/example/example.py
HERE=$(PWD)


.PHONY: website
website:
	cd $(CODE) && cp $(FILES) $(HERE)/_includes
	jekyll


.PHONY: deploy
deploy:
	git push origin master

