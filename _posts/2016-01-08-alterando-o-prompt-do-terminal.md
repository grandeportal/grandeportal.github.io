---
layout:     post
title:      "Alterando o Prompt do Terminal"
header-img: "img/posts/post-bg-prompt.jpg"
tags: terminal
---

Vejamos aqui como alterar o prompt do terminal.

#### O mínimo

{% highlight bash %}
PS1="$ "
{% endhighlight %}

<img src="{{ site.baseurl }}/img/posts/ps01.png" alt="ps01.png">

##### *Username*: O nome do usuário

{% highlight bash %}
PS1="\u$ "
{% endhighlight %}

##### *Hostname*: O nome da máquina

{% highlight bash %}
PS1="\h$ "
{% endhighlight %}

##### *Full Path*: O caminho completo do diretório atual

{% highlight bash %}
PS1="\w$ "
{% endhighlight %}

### Refazendo o prompt padrão

{% highlight vim %}
PS1="$ "
PS1="\u$ "
PS1="\u@\h$ "
PS1="\u@\h:\w$ "
{% endhighlight %}

<img src="{{ site.baseurl }}/img/posts/ps-anim.gif" alt="ps-anim.gif">

### Cores

`\e[` indica o começo da cor no prompt.

`x;ym` indica o código da cor.

`\e[m` indica o fim da cor no prompt.

{% highlight bash %}
PS1="\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ "
{% endhighlight %}

<img src="{{ site.baseurl }}/img/posts/ps02.png" alt="ps02.png">

### Diminuindo o caminho do prompt

Eu gosto de deixar o meu prompt com um caminho mais curto, então eu digito:

{% highlight bash %}
PS1="\e[1;34m:/\W\e[00m$ "
{% endhighlight %}

<img src="{{ site.baseurl }}/img/posts/ps03.png" alt="ps03.png">

### Horas

{% highlight bash %}
PS1="\u@\h [\$(date +%k:%M:%S)]$ "
{% endhighlight %}

ou

{% highlight bash %}
PS1="\u@\h [\t]$ "
{% endhighlight %}

<img src="{{ site.baseurl }}/img/posts/ps04.png" alt="ps04.png">

### Referências

* [Bashrc Generator](http://bashrcgenerator.com/) te ajuda a montar o seu comando. Experimente!

* [Color Bash Prompt](https://wiki.archlinux.org/index.php/Color_Bash_Prompt) - tabela de cores.