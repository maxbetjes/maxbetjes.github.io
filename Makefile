DIR_GFRD=$(HOME)/code/amolf/gfrd
FILES_GFRD=doc/visualization.txt samples/example/example.py
HERE=$(PWD)

all: website


.PHONY: update
update:
	git co master
	git pull
	# Preferably work on a local dev branch
	git co dev
	git rebase master

.PHONY: website
website:
	# Get some files from egfrd directory
	cd $(DIR_GFRD) && cp $(FILES_GFRD) $(HERE)/_includes
	# Remove generated html files
	rm -f *.html
	# Generate _site
	jekyll
	# Mv generated html files to _site directory (not _site/src) so we can 
	# run a proper test using Jekyll testserver or Apache locally.
	mv _site/src/*.html _site/
	# Copy generated html files to root directory so Github web server can 
	# find them.
	cp _site/*.html .
	# Let Github's Jekyll create support.html because of email obfuscation
	# Note Github will transform any markdown file to html using it's own 
	# version of Jekyll. We only use this feature for support.html, so the 
	# root directory should be free of any other markdown files.
	rm support.html
	
	# Older versions of Pygments treat 100 as a float (mf), newer versions 
	# as an integer (mi). Since there is no difference in css/syntax.css,
	# replace all mf by mi such that Pygments version has no effect on 
	# html.
	sed -i 's/class="mf"/class="mi"/g' *.html

# Check if everything looks ok locally. Then:
# git commit -a -m 'Update website'
# Don't forget to add newly created files to the commit too.

.PHONY: deploy
deploy:
	git co master
	git merge --ff-only dev 
	# This updates gfrd.org, because of the file CNAME.
	# Ask Carl if you want to host the website somewhere else than Github.
	git push origin master
	git co dev

