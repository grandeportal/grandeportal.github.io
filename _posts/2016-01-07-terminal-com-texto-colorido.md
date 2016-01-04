---
layout:     post
title:      "Terminal com Texto Colorido"
header-img: "img/posts/post-bg-terminal-color.png"
tags: terminal, cor
---

Para deixar o terminal com texto colorido digite

{% highlight bash %}
sudo gedit ~/.bashrc
{% endhighlight %}

Procure pela linha (46) que contém o texto

{% highlight vim %}
#force_color_prompt=yes
{% endhighlight %}

Basta tirar o símbolo `#`. Salvar e fechar.

<img src="{{ site.baseurl }}/img/posts/terminal-text-color.png" alt="terminal-text-color.png">

**Nota:** é necessário fechar o terminal e abrir novamente.
