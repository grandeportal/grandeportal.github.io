---
layout:     post
title:      "Shell Script 2"
category:   shell
comments:   true
---

# Shell Script 2 - Estruturas de Controle

Não vou explicar muito, apenas digite e veja o que acontece ;)

```bash
seq 10
```

```bash
seq 2 2 10
```

```bash
mkdir pasta; touch pasta/arquivo.txt; cd pasta; ls
```

```bash
if grep mm /etc/passwd; then echo 'ok'; else echo 'não'; fi
```

```bash
if who | grep regis; then echo regis está logado; else echo regis não está logado; fi
```

A seguir, usaremos o comando `test` para verificar se um arquivo existe.

```bash
# Verifica se o arquivo existe
if test -e $1; then cat $1; else echo Arquivo não encontrado; fi
```

Repare, no exemplo a seguir, que podemos substituir o comando `test` por um par de colchetes `[ ]`.

```bash
# Verifica se uma pasta existe
if [ ! -d pasta42 ]; then echo 'Pasta não existe'; else echo 'Pasta já existe, veja:'; ls; fi
```

```bash
n1=1
n2=2
if [ $n1 -eq $n2 ]
then
    echo "n1 é igual a n2"
else
    echo "n1 é diferente de n2"
fi
```

```bash
n1=1
n2=2
if [ $n1 -ne $n2 ]
then
    echo "n1 é diferente de n2"
else
    echo "n1 é igual a n2"
fi
```


```bash
c=0; while [[ c -le 10 ]]; do echo "$c"; (( c++ )); sleep 0.5; done
```

### Fibonacci Series

```bash
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
```

`$((a+b))` significa uma expansão aritmética.

## For

```bash
for i in $(seq 10); do echo "$i"; sleep 0.5; done
```


```bash
itens="Um Dois Três Quatro Cinco"
for item in $itens; do echo $item; done
```



```bash
for ((i=1; i<=9; i++))
do
    echo -n "$i "
done
echo ""
```

### Executando uma ação n vezes

```bash
for i in $(seq 10); do touch file$i.txt; done
```


## Entrada de dados

```bash
read -p "Digite seu nome: " nome; echo "Bem-vindo $nome"
```


## Função

```bash
#!/bin/bash

soma(){
    a=$1
    b=$2
    echo `expr $a + $b`
}

read -p 'Digite um número: ' x
read -p 'Digite outro número: ' y
soma $x $y
```




[0]: http://aurelio.net/shell/canivete/
[1]: http://aurelio.net/
[2]: https://pt.wikipedia.org/wiki/Bash
[3]: http://aurelio.net/shell/canivete/#ferramentas
[4]: https://jneves.wordpress.com/2008/03/05/papo-de-botequim-parte-1/
[5]: http://wiki.softwarelivre.org/TWikiBar/WebHome
[6]: http://grandeportal.github.io/terminal/2016/alterando-o-prompt-do-terminal/
[7]: https://pt.wikipedia.org/wiki/Shell_script