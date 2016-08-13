---
layout:     post
title:      "Shell Script 1"
category:   shell
comments:   true
---

# Shell Script 1 - O Básico

Você já leu o [Papo de Botequim][4] por Julio Cezar Neves? Se não, eu sugiro que leia, pois é um excelente material sobre [Shell Script][5]. Lá ele explica, dentre outras coisas, a diferença entre Bash e Shell. Bom, aqui eu vou mostrar apenas os comandos que eu considero mais relevantes, mas não deixe de ler o [Papo de Botequim][4].

## O que é Bash e Shell Script?

[Bash][2] é o **interpretador** e [Shell Script][7] é a linguagem.

## A caixa de ferramentas do shelleiro

O [Canivete Suíço do Shell (Bash)][0] do [Aurélio Marinho Jargas][1] é o guia de referência de quem quer aprender Shell Script. E por isso vou reproduzir aqui os comandos que ele menciona em "[A caixa de ferramentas do shelleiro][3]".

| Comando   | Função                | Opções úteis                             |
|-----------|-----------------------|------------------------------------------|
| cat       | Mostra arquivo        | -n, -s                                   |
| cut       | Extrai campo          | -d -f, -c                                |
| date      | Mostra data           | -d, +'...'                               |
| diff      | Compara arquivos      | -u, -Nr, -i, -w                          |
| echo      | Mostra texto          | -e, -n                                   |
| find      | Encontra arquivos     | -name, -iname, -type f, -exec, -or       |
| fmt       | Formata parágrafo     | -w, -u                                   |
| grep      | Encontra texto        | -i, -v, -r, -qs, -n, -l, -w -x, -A -B -C |
| head      | Mostra início         | -n, -c                                   |
| od        | Mostra caracteres     | -a, -c, -o, -x                           |
| paste     | Paraleliza arquivos   | -d, -s                                   |
| printf    | Mostra texto          | nenhuma                                  |
| rev       | Inverte texto         | nenhuma                                  |
| pwd       | Mostra o caminho do diretório atual |                            |
| sed       | Edita texto           | -n, -f, s/isso/aquilo/, p, d, q, N       |
| seq       | Conta números         | -s, -f                                   |
| sort      | Ordena texto          | -n, -f, -r, -k -t, -o                    |
| tac       | Inverte arquivo       | nenhuma                                  |
| tail      | Mostra final          | -n, -c, -f                               |
| tee       | Arquiva fluxo         | -a                                       |
| tr        | Transforma texto      | -d, -s, A-Z a-z                          |
| top       | Mostra os processos dinamicamente |                              |
| uniq      | Remove duplicatas     | -i, -d, -u                               |
| wc        | Conta letras          | -c, -w, -l, -L                           |
| which     | Mostra a localização de um arquivo executável |                  |
| who       | Mostra que está conectado |                                      |
| whoami    | Mostra o nome do usuário logado |                                |
| xargs     | Gerencia argumentos   | -n, -i                                   |


## O Básico

Antes de sair explorando "A caixa de ferramentas do shelleiro", vamos começar do começo.

Para abrir o terminal você pode pressionar Ctrl+Alt+T.

<img src="{{ site.baseurl }}/images/terminal.png" alt="terminal.png">

O `$` é o prompt do comando, ou seja, a partir deste símbolo você pode digitar seus comandos.

Se você já leu [alterando o prompt terminal][6] você deve ter visto este prompt:

{% highlight bash %}
rg3915@acer:~/gh/grandeportal$ 
{% endhighlight %}

onde

{% highlight bash %}
usuario@maquina:caminho$
{% endhighlight %}

E `~` é a pasta principal, a pasta `home` do usuário atual.

Esta é a configuração padrão do prompt de comando do terminal, mas se quiser, você pode mudar digitando, por exemplo.

{% highlight bash %}
PS1="$ "
{% endhighlight %}

<img src="{{ site.baseurl }}/images/terminal_ps1.png" alt="terminal_ps1.png">

> Para todos os comandos digite `--help`.

{% highlight bash %}
$ <comando> --help
{% endhighlight %}

## Arquivos e Diretórios

{% highlight bash %}
$ pwd
{% endhighlight %}

Mostra o nome e caminho do diretório atual.

### Criando pastas

{% highlight bash %}
$ mkdir pastaprincipal
$ mkdir pasta1 pasta2 pasta3
$ mkdir -p novapasta/subpasta
{% endhighlight %}

O argumento `-p` cria os diretórios pais à medida que forem necessários sem gerar erro. Ou seja, para criar *subpasta* primeiro ele cria *novapasta*.

### Removendo pastas

{% highlight bash %}
$ rmdir pastaprincipal
{% endhighlight %}

Remove o diretório se estiver vazio.

### Criando arquivos vazios

{% highlight bash %}
$ touch arquivoprincipal.txt
$ touch arquivo1.txt arquivo2.txt arquivo3.txt
$ touch templates/{base.html,index.html,nav.html}
{% endhighlight %}

**Obs**: Note que neste exemplo devemos criar a pasta *templates* antes.

### Listando os arquivos

{% highlight bash %}
$ ls
$ ls -l
$ ls -la
{% endhighlight %}

{% highlight bash %}
$ ls
arquivo1.txt  arquivo2.txt  arquivo3.txt  arquivoprincipal.txt
{% endhighlight %}

`-l` esta opção usa o formato de listagem longa.

{% highlight bash %}
$ ls -l
total 16
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivo1.txt
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivo2.txt
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivo3.txt
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivoprincipal.txt
{% endhighlight %}

`-a` mostra arquivos ocultos, que começam com `.`

{% highlight bash %}
$ ls -la
total 32
drwxrwxr-x 2 rg3915 rg3915 4096 Mar  5 10:57 .
drwxrwxr-x 3 rg3915 rg3915 4096 Mar  5 10:57 ..
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 .env
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivo1.txt
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivo2.txt
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivo3.txt
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivoprincipal.txt
{% endhighlight %}

No exemplo, `.env` é um arquivo oculto.

Experimente

{% highlight bash %}
$ ls -lh
{% endhighlight %}

### Visualizando os arquivos numa árvore

{% highlight bash %}
$ sudo apt-get install tree
$ tree templates
$ tree --help
{% endhighlight %}


### Excluindo arquivos e pastas

Depois de ler os comandos a seguir você vai entender o que o [maluco fez quando excluiu todos os dados da empresa](http://www.tecmundo.com.br/programacao/103701-cara-cade-firma-rapaz-deleta-empresa-linha-codigo-errada.htm).

{% highlight bash %}
$ rm arquivoprincipal.txt
$ rm -i arquivoprincipal.txt
$ rm -f arquivoprincipal.txt
$ rm -rf novapasta
$ rm arquivo*.txt
$ rm *.txt
{% endhighlight %}

> Cuidado: os comandos a seguir são extremamente perigosos!!!

{% highlight bash %}
$ rm *
$ rm -rf *
{% endhighlight %}

**Cuidado**: O primeiro comando exclui **todos** os arquivos da pasta atual. O segundo exclui **todos recursivamente** e com **force** ativado, ou seja, exclui arquivos não-vazios sem perguntar.

Experimente

{% highlight bash %}
$ rm -rf \*
{% endhighlight %}

Este comando **anula** o efeito excluir tudo.

Leia mais em [cuidado com comandos perigosos do shell](http://grandeportal.github.io/shell/2016/cuidado-com-comandos-perigosos-do-shell/).


### Copiando arquivos

{% highlight bash %}
cp arquivo.txt arquivo_bkp.txt
cp arquivo.txt /subpasta
cp * /subpasta
cp ~/Documentos .
cp -R ~/Documentos backup/
{% endhighlight %}

### Movendo arquivos

Move ou renomeia arquivos e diretórios. Semelhante ao `cp`, mas o arquivo de origem é apagado.

{% highlight bash %}
$ mv arquivo.txt backup/
$ mv arquivo.txt novo_nome.txt
{% endhighlight %}

### Criando links

O comando a seguir cria um link simbólico, o que comumente chamamos de atalho.

{% highlight bash %}
$ ln -s ~/Imagens/ img
{% endhighlight %}

Digitando `cd img` entramos na pasta `~/Imagens/` através do atalho.











# Redirecionamento de Comandos

## `>`

Redireciona a saída de um comando para outro arquivo. Se o arquivo existir será sobrescrito.


{% highlight bash %}
$ ls -la > dir.txt
{% endhighlight %}

## `>>`

Redireciona a saída, mas acrescentando os dados ao final do arquivo, sem sobrescrever o arquivo.

{% highlight bash %}
ls /etc/passwd >> dir.txt
{% endhighlight %}

## `<`

Redireciona a entrada.

{% highlight bash %}
wc -l < arquivo
{% endhighlight %}

Conta o número de linhas não vazias do arquivo.

Experimente:

{% highlight bash %}
cat << EOF > arquivo.txt
> Z
> X
> C
> B
> A
> EOF
{% endhighlight %}

Depois

{% highlight bash %}
cat arquivo.txt
{% endhighlight %}

Depois

{% highlight bash %}
sort < arquivo.txt
{% endhighlight %}

## Pipes

Pipes ( `|` barra vertical) - permite que um programa utilize como entrada a saída de outro programa.

{% highlight bash %}
$ ls | wc -l
{% endhighlight %}

{% highlight bash %}
$ echo Existem `who | wc -l` usuarios conectados
{% endhighlight %}

{% highlight bash %}
$ ls -a | sort -r
{% endhighlight %}

Faz com que o comando `sort` receba como entrada a saída produzida pelo comando `ls`. Neste exemplo o `sort` ordena na ordem reversa.

{% highlight bash %}
$ cat /etc/passwd | wc -l > lista.txt
{% endhighlight %}

Grava no arquivo `lista.txt` o número de linhas do arquivo `passwd`.











# Grep

Pesquisando em um arquivo específico.

{% highlight bash %}
$ grep force_color ~/.bashrc
{% endhighlight %}

Resultado:

{% highlight bash %}
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
unset color_prompt force_color_prompt
{% endhighlight %}

Pesquisando em todos os arquivos do tipo `txt`.

{% highlight bash %}
$ grep regis *.txt
{% endhighlight %}

Pesquisando na saída de um comando

{% highlight bash %}
$ who | grep rg3915
{% endhighlight %}

{% highlight bash %}
$ ps aux | grep python
{% endhighlight %}

{% highlight bash %}
$ curl http://www.meetup.com/pt-BR/Grupy-SP/events/232869373/ | grep Regis
{% endhighlight %}

{% highlight bash %}
$ curl http://www.meetup.com/pt-BR/Grupy-SP/events/232869373/ | grep -c Python
{% endhighlight %}

{% highlight bash %}
$ grep -i
$ grep --ignore-case
{% endhighlight %}

{% highlight bash %}
$ grep -r
$ grep --recursive
{% endhighlight %}

{% highlight bash %}
$ grep -c
$ grep --count
{% endhighlight %}






### echo

{% highlight bash %}
echo "Hello World"
{% endhighlight %}

Experimente

{% highlight bash %}
echo {2..10}
echo {a..Z}
{% endhighlight %}

{% highlight bash %}
echo azul{' claro',' escuro'}
{% endhighlight %}

#### Tabulação

{% highlight bash %}
printf "Um\tDois"
{% endhighlight %}

#### Quebra de linha

{% highlight bash %}
printf "Um\nDois"
{% endhighlight %}




[0]: http://aurelio.net/shell/canivete/
[1]: http://aurelio.net/
[2]: https://pt.wikipedia.org/wiki/Bash
[3]: http://aurelio.net/shell/canivete/#ferramentas
[4]: https://jneves.wordpress.com/2008/03/05/papo-de-botequim-parte-1/
[5]: http://wiki.softwarelivre.org/TWikiBar/WebHome
[6]: http://grandeportal.github.io/terminal/2016/alterando-o-prompt-do-terminal/
[7]: https://pt.wikipedia.org/wiki/Shell_script