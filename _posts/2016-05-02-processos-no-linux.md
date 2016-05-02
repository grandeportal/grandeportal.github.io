---
layout:     post
title:      "Processos no Linux"
category:   shell
comments:   true
---

## ps

Processos são programas sendo executados. Para visualizarmos os programas executados no sistema usamos o comando `ps`. Cada processo tem um número associado, chamado PID (Process ID).

{% highlight bash %}
$ ps --ajuda s
{% endhighlight %}

As opções são: `a, e, r, u, x`

**Exemplos:**

{% highlight bash %}
$ ps -u
{% endhighlight %}

{% highlight bash %}
$ ps aux
{% endhighlight %}

## top

Similar ao `ps`, mas mostra os processos dinamicamente. Para sair pressione `q`.

<img src="{{ site.baseurl }}/images/top.png" alt="top.png">


## Controle dos processos

Um processo pode ser executado em primeiro plano (*foreground*) ou em segundo plano (*background*).

Para parar (pausar) um processo digite CTRL+Z.

Para interrompê-lo digite CTRL+C, caso o programa esteja em primeiro plano.

### jobs

Mostra os processos que estão parados ou rodando em segundo plano.

### fg

Permite fazer um programa rodando em segundo plano ou pausado, rodar em primeiro plano.

**Sintaxe:** `fg [numero]`

### bg

Permite fazer um programa rodando em primeiro plano ou pausado, rodar em segundo plano.

**Sintaxe:** `bg [numero]`

Se executamos um comando seguido de `&`, este é executado em segundo plano. Bom para liberar o terminal.

{% highlight bash %}
$ gedit &
{% endhighlight %}

## Matando processos

Muitas vezes precisamos encerrar um processo forçadamente. Para isso usamos o programa `kill`. Se não for definido nenhum parâmetro ele envia um sinal de término ao programa.

**Sintaxe:** `kill [nº do sinal] PID`

**Opção:**

`-l` - lista os sinais

**Sinais:**

`-9` - mata um processo.

`-15` - tenta fechar o processo de uma forma mais "amigável".

`-19` - pausa o processo (equivalente ao CTRL+Z).

**Exemplo**:

{% highlight bash %}
$ gedit &
[1] 22745

$ ps aux | grep gedit
rg3915   22745  4.5  0.8 188640 24332 pts/11   Sl   23:34   0:00 gedit
rg3915   22787  0.0  0.0   4692   820 pts/11   S+   23:34   0:00 grep --color=auto gedit

$ kill -9 22745
{% endhighlight %}