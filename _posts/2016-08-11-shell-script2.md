---
layout:     post
title:      "Shell Script 2"
category:   shell
comments:   true
---

# Shell Script 2 - Estruturas de Controle

Se você já leu [o básico sobre Shell Script][9] agora veremos as estruturas de controle do Shell Script.

Não vou explicar muito, apenas digite e veja o que acontece ;)

{% highlight bash %}
seq 10
{% endhighlight %}

{% highlight bash %}
seq 2 2 10
{% endhighlight %}

{% highlight bash %}
mkdir pasta; touch pasta/arquivo.txt; cd pasta; ls
{% endhighlight %}

{% highlight bash %}
if grep mm /etc/passwd; then echo 'ok'; else echo 'não'; fi
{% endhighlight %}

{% highlight bash %}
if who | grep regis; then echo regis está logado; else echo regis não está logado; fi
{% endhighlight %}

A seguir, usaremos o comando `test` para verificar se um arquivo existe.

{% highlight bash %}
# Verifica se o arquivo existe
if test -e $1; then cat $1; else echo Arquivo não encontrado; fi
{% endhighlight %}

Repare, no exemplo a seguir, que podemos substituir o comando `test` por um par de colchetes `[ ]`.

{% highlight bash %}
# Verifica se uma pasta existe
if [ ! -d pasta42 ]; then echo 'Pasta não existe'; else echo 'Pasta já existe, veja:'; ls; fi
{% endhighlight %}

{% highlight bash %}
n1=1
n2=2
if [ $n1 -eq $n2 ]
then
    echo "n1 é igual a n2"
else
    echo "n1 é diferente de n2"
fi
{% endhighlight %}

{% highlight bash %}
n1=1
n2=2
if [ $n1 -ne $n2 ]
then
    echo "n1 é diferente de n2"
else
    echo "n1 é igual a n2"
fi
{% endhighlight %}


{% highlight bash %}
c=0; while [[ c -le 10 ]]; do echo "$c"; (( c++ )); sleep 0.5; done
{% endhighlight %}

### Fibonacci Series

{% highlight bash %}
#!/bin/bash
c=0
a=1
b=1
read -p "Enter limit of fibonacci Series:" n
echo -n "$a "
echo -n "$b "
#Fibonacci series logic
while((c<n))
do
    c=$((a+b))
    echo -n "$c "
    a=$b
    b=$c
done
echo -e "\n"
{% endhighlight %}

`$((a+b))` significa uma expansão aritmética.

## For

{% highlight bash %}
for i in $(seq 10); do echo "$i"; sleep 0.5; done
{% endhighlight %}


{% highlight bash %}
itens="Um Dois Três Quatro Cinco"
for item in $itens; do echo $item; done
{% endhighlight %}



{% highlight bash %}
for ((i=1; i<=9; i++))
do
    echo -n "$i "
done
echo ""
{% endhighlight %}

### Executando uma ação n vezes

{% highlight bash %}
for i in $(seq 10); do touch file$i.txt; done
{% endhighlight %}


## Entrada de dados

{% highlight bash %}
read -p "Digite seu nome: " nome; echo "Bem-vindo $nome"
{% endhighlight %}


## Função

{% highlight bash %}
#!/bin/bash

soma(){
    a=$1
    b=$2
    echo `expr $a + $b`
}

read -p 'Digite um número: ' x
read -p 'Digite outro número: ' y
soma $x $y
{% endhighlight %}

Leia mais em [Shell Script 3 - Vários exemplos][8]


[0]: http://aurelio.net/shell/canivete/
[1]: http://aurelio.net/
[2]: https://pt.wikipedia.org/wiki/Bash
[3]: http://aurelio.net/shell/canivete/#ferramentas
[4]: https://jneves.wordpress.com/2008/03/05/papo-de-botequim-parte-1/
[5]: http://wiki.softwarelivre.org/TWikiBar/WebHome
[6]: http://grandeportal.github.io/terminal/2016/alterando-o-prompt-do-terminal/
[7]: https://pt.wikipedia.org/wiki/Shell_script
[8]: http://grandeportal.github.io/shell/2016/shell-script3/
[9]: http://grandeportal.github.io/shell/2016/shell-script1/