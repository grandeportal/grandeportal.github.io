---
layout:     post
title:      "Renomeando Comandos"
category:   terminal, alias
comments:   true
---

Para renomear um comando precisamos editar o arquivo `~/.bashrc`. Isso para usuários do Linux.

Renomear um comando significa alterar a função original de determinado comando.

## Deletando com confirmação

Este exemplo é muito importante, pois pode evitar dor de cabeça futuramente.

Pra quem usa Linux sabe que o comando `rm` deleta algum arquivo. E sabe também que ele não vai para a lixeira. Além disso, ele deleta e nem pede confirmação.

A partir de agora, digitando

{% highlight bash %}
alias rm='rm -i'
{% endhighlight %}

dentro do arquivo `~/.bashrc` o seu comando `rm` pedirá confirmação antes de deletar.

> Para surtir efeito você deve reiniciar o terminal ou digitar

{% highlight bash %}
source ~/.bashrc
{% endhighlight %}


## Listando os arquivos

Para listar os arquivos com todos os detalhes, inclusive os arquivos ocultos, eu uso o comando `ll`.

{% highlight bash %}
alias ll='ls -alF'
{% endhighlight %}


## Diminuindo o caminho do prompt

Se lembra do comando para diminuir o caminho do prompt?

{% highlight bash %}
alias p='PS1="\e[1;34m/\W\e[00m$ "'
{% endhighlight %}

Digitando `p` ele já faz isso pra nós.

## Diminuindo o caminho com virtualenv ativado

{% highlight bash %}
alias pa='PS1="(`basename \"$VIRTUAL_ENV\"`)\e[1;34m:/\W\e[00m$ "'
{% endhighlight %}

## Renomeando o comando manage com virtualenv ativado

{% highlight bash %}
alias manage='python $VIRTUAL_ENV/../manage.py'
{% endhighlight %}

**Obs**: Este último comando só funciona se você estiver rodando uma aplicação [Django][0] com o [virtualenv][1] ativado e que a pasta de ativação esteja na mesma pasta do manage.py. Não entendeu nada? Então leia o [tutorial Django 1.7][0].

[0]: http://pythonclub.com.br/tutorial-django-17.html
[1]: http://pythonclub.com.br/tutorial-django-17.html#o-que-voce-precisa