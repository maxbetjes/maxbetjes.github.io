---
layout: default
title: eGFRD simulation
header: Running a simulation
---


* Go to the directory containing your simulation script.
{% highlight bash %}
$ cd <egfrd_directory>/samples/example
{% endhighlight %}

* Run the simulation script writing output to stdout for each step.
{% highlight bash %}
$ PYTHONPATH=../../ python example.py
{% endhighlight %}

* Run the simulation writing output to stdout only if an error occurs. 
{% highlight bash %}
$ LOGLEVEL=ERROR PYTHONPATH=../../ python -O example.py  
{% endhighlight %}


Below you find a simulation
[script](http://github.com/gfrd/gfrd/tree/develop/samples/example/example.py),
with comments explaining each step. More example scripts can be found in the
[samples](http://github.com/gfrd/egfrd/tree/develop/samples) directory of the
code.


{% highlight python %}
{% include example.py %}
{% endhighlight %}



