
## How to update gfrd.org
We use [Jekyll](http://github.com/thomie/jekyll/) to separate layout from content. The source is written with [Markdown syntax](http://daringfireball.net/projects/markdown/basics), and Jekyll uses [Rdiscount](http://github.com/thomie/rdiscount/) to transform the source to html.

First install Jekyll and Rdiscount as explained below. Then take a look at the Makefile for generating the website.

The gfrd.org website is hosted using [Github pages](http://pages.github.com/) with custom domains. Note that Github will also transform any markdown file to html using it's own version of Jekyll. We only use this feature for support.html. This is the reason we keep the sources file separately in the src directory, instead of in the root directory, and copy the html files to the root directory after generation.


### Website source:

    git clone git@github.com:gfrd/gfrd.github.com.git
    # Preferably work on a local dev branch
    git co -b dev


### Jekyll
First intall Ruby and rake:

    sudo apt-get install ruby1.8-dev
    echo 'export PATH=$HOME/.gem/ruby/1.8/bin:$PATH' >> .bashrc
    gem install rake

We use a patched version of Jekyll.

    git clone git://github.com/thomie/jekyll.git
    cd jekyll
    rake install
    # Note: don't use 'gem install jekyll', it would  miss the patches.

Patches:

* add rdiscount config, starting with "smart", which i use. :)

This enables SmartyPants processing. Also see [Discount](http://www.pell.portland.or.us/~orc/Code/discount/).

Jekyll specific files and folders in website source:

* \_config.yml
* \_includes
* \_layouts
* \_site


### Rdiscount
Jekyll depends on rdiscount to transform markdown files into html. We use a patched version for some extra features.

    git clone git://github.com/thomie/rdiscount.git
    cd rdiscount
    rake install
    # Note: don't use 'gem install rdiscount', it would  miss the patches.

Patches:

* Add div-quote option.
* Allow multiple css class names, separated by spaces.
* Add sid: pseudo-protocol.
* Don't include dot or semilcolon inside sup of A^B.



## Testing
Two options:

1) /about/ redirects to /about/index.hml (more robust)

    $ jekyll --permalink pretty

* Test using Jekyll or Apache server
* See http://github.com/henrik/jekyll

2) /about redirects to /about.hml (a bit nicer)

    $ jekyll

* Test using Apache server.
* Set 'Options MultiViews' in httpd.conf.
* Note: Apache gets confused about trailing slash when \_site previously 
  created with jekyll --permalinks pretty is now replaced by \_site created 
  without --permalinks pretty.


### Test using jekyll

    $ jekyll --server
    http://0.0.0.0:4000/ 


### Test using Apache

    $ apachectl restart
    http://localhost:8000/



## Movies
Numbering the image files:

    $ x=1; for i in *png; do counter=$(printf %03d $x); ln "$i" /tmp/img"$counter".png; x=$(($x+1)); done

Making the movies:

    $ ffmpeg -r 10 -i images/step.%04d.png -vcodec libx264 -an -r 10 movie.mp4
    $ ffmpeg2theora movie.mp4



## Images

Exporting an image from OpenOffice.

- export a complete slide. Select the image that is on the slide, but don't 
  use 'Selection' under 'File type' in the export dialog.

- or, copy the image to an OpenOffice drawing. Rescale the drawing together 
  with the image, and again export the whole drawing. If you export just the 
  selection, things get blurry.

Font of menu entries, png made using the Gimp: Nimbus Sans L, size 13, hinting, anti-aliasing, force auto-hinter.

Font in svg's: [Lucida Grande](http://ifido.deviantart.com/art/Mac-OS-X-Tiger-Visual-Style-12670629).



### Other
Other libraries used, see [/credits](/credits).
