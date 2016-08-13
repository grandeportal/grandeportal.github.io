---
layout:     post
title:      "Shell Script 3"
category:   shell
comments:   true
---

# Shell Script 3 - Vários exemplos

Já leu [Shell Script 2 - Estruturas de Controle][8]? Então veremos um bocado de exemplos interessantes.

### Criando vários arquivos com um texto aleatório

{% highlight bash %}
$ sudo apt-get install gpw
for i in $(seq 1 10); do echo "text$i" > file$i.txt; gpw 7 10 >> file$i.txt; done
{% endhighlight %}

### Inserindo o conteúdo de vários arquivos dentro de um único arquivo

{% highlight bash %}
for i in $(seq 1 10); do cat file$i.txt >> finalfile.txt; done
{% endhighlight %}


### Juntando vários arquivos em um só

{% highlight bash %}
arqs="um.txt dois.txt"
for i in $arqs; do cat $i >> joinedfile.txt; done
{% endhighlight %}

{% highlight bash %}
arqs="um.txt dois.txt"
cat $arqs > joinedfile.txt
cat joinedfile.txt
{% endhighlight %}


### Separando um arquivo em vários linha a linha

{% highlight bash %}
printf '%s\n' 'Um' 'Dois' 'Três' 'Quatro' 'Cinco' > file.txt
# ou
itens="Um Dois Três Quatro Cinco"; for item in $itens; do echo $item >> file.txt; done

# Separando
while read line; do line=${line}; echo "${line}" > "${line}"; done < file.txt

# Lendo
while read line; do cat "${line}"; done < file.txt
{% endhighlight %}


### Separando um arquivo em vários linha a linha com a seguinte regra...

{% highlight bash %}
SECRET_KEY=apqoie38728cmx8s67xs
ALLOW_HOST=127.0.0.1
{% endhighlight %}

{% highlight bash %}
$ cat SECRET_KEY
apqoie38728cmx8s67xs
$ cat ALLOW_HOST
127.0.0.1
{% endhighlight %}

[http://bit.ly/2awZo0d](http://bit.ly/2awZo0d)

### Substituindo texto no arquivo sem abri-lo

{% highlight bash %}
echo "Eu gosto de Java." > linguagens.txt
cat linguagens.txt
sed -i "s/Java/Python/g" linguagens.txt
cat linguagens.txt
{% endhighlight %}


### Renomeando todos os arquivos numa sequência numérica

{% highlight bash %}
# Criando 30 arquivos com nomes aleatórios
for i in $(seq 1 30); do var=`gpw 1 10`; touch $var.txt; done
# Renomenando tudo numericamente
c=0; j=1; for i in *; do ((c++)); if (($c <= 9)); then mv $i 0$j\_$i; else mv $i $j\_$i; fi; ((j++)); done
{% endhighlight %}


### Numerar Linhas

{% highlight bash %}
sed -n "/pattern/{=;p}" arquivo
{% endhighlight %}

{% highlight bash %}
sed -n "/*/{=;p}" arquivo.txt | sed "{N;s/\n/ /}" > arquivo2.txt
{% endhighlight %}

{% highlight bash %}
cat -n arquivo.txt > arquivo2.txt
{% endhighlight %}

{% highlight bash %}
awk '{printf("%5d: %s\n", NR,$0)}' arquivo.txt > arquivo2.txt
{% endhighlight %}


### Shell Script to print Pyramid of Numbers

{% highlight bash %}
#!/bin/bash

#Taking input
read -p "Enter Number:" number

#Outer loop for printing number of rows in pyramid
for((row=1;row<=number;row++))
do

    #Loop for printing required spaces
    for((spaces=row;spaces<=number;spaces++))
    do
        echo -ne " "
    done

    #Loop for printing 1st part
    for((j=1;j<=row;j++))
    do
        echo -ne "$j"
    done

    #Loop for printing 2nd part
    for((l=(row-1);l>=1;l--))
    do
        echo -ne "$l"
    done

    #echo for printing new line
    echo 
done
{% endhighlight %}

Leia mais:

[http://technicalworldforyou.blogspot.com.br/2014/01/shell-script-to-print-pyramid-of-numbers.html](http://technicalworldforyou.blogspot.com.br/2014/01/shell-script-to-print-pyramid-of-numbers.html)

[http://technicalworldforyou.blogspot.com.br/](http://technicalworldforyou.blogspot.com.br/)

[http://rberaldo.com.br/curso-de-shell-script-modulo-1-scripts-shell-estruturas/](http://rberaldo.com.br/curso-de-shell-script-modulo-1-scripts-shell-estruturas/)



[0]: http://aurelio.net/shell/canivete/
[1]: http://aurelio.net/
[2]: https://pt.wikipedia.org/wiki/Bash
[3]: http://aurelio.net/shell/canivete/#ferramentas
[4]: https://jneves.wordpress.com/2008/03/05/papo-de-botequim-parte-1/
[5]: http://wiki.softwarelivre.org/TWikiBar/WebHome
[6]: http://grandeportal.github.io/terminal/2016/alterando-o-prompt-do-terminal/
[7]: https://pt.wikipedia.org/wiki/Shell_script
[8]: http://grandeportal.github.io/shell/2016/shell-script2/