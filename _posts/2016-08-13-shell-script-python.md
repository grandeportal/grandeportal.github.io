---
layout:     post
title:      "Shell Script 4"
category:   shell
comments:   true
---

# Shell Script e Python

Para rodar Shell Script no Python use a biblioteca [subprocess][0].

{% highlight python %}
import subprocess
subprocess.call("clear", shell=True)
subprocess.call("echo 'Usando Shell Script e Python'", shell=True)
subprocess.call("ls -l", shell=True)
{% endhighlight %}

Leia mais em http://www.jperla.com/blog/post/a-clean-python-shell-script

[0]: https://docs.python.org/3/library/subprocess.html

