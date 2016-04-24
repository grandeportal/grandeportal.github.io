---
layout:     post
title:      "Copiando pelo terminal com xclip"
category:   xclip
comments:   true
---

Baseado no artigo [Adding a new SSH key to your GitHub account][0] vou explicar aqui como usar o **xclip** para copiar o conteúdo de um arquivo para a área de transferência.

{% highlight bash %}
$ sudo apt-get install xclip
{% endhighlight %}

Copiando o `id_rsa.pub`.

{% highlight bash %}
$ xclip -sel clip < ~/.ssh/id_rsa.pub
{% endhighlight %}

Depois é só pressionar `Ctrl+V` em qualquer lugar.


[0]: https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
