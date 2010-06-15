---
layout: default
title:
---


Running a simulation
====================

* Go to the directory containing your simulation script.
        $ cd <egfrd_directory>/samples/example
* Run the simulation script writing output to stdout for each step.
        $ PYTHONPATH=../../ python example.py
* Run the simulation writing output to stdout only if an error occurs. 
        $ LOGLEVEL=ERROR PYTHONPATH=../../ python -O example.py  


Below you find a [simulation script](http://github.com/gfrd/gfrd/tree/develop/samples/surfaces/run.py),
with comments explaining each step. More example scripts can be 
found in the [samples](http://github.com/gfrd/gfrd/tree/develop/samples) directory of the code.


---------------------------------------

{% highlight python %}
{% include example.py %}
{% endhighlight %}



