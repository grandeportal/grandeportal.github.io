---
layout:     post
title:      "Descompactando arquivos pelo terminal"
category:   zip, compactar, descompactar
comments:   true
---

Veremos a seguir uma descrição de diversos compactadores de arquivos.

## Extensões dos arquivos

`.gz` - Compactado pelo *gzip*. Programa *gzip* para descompactar

`.bz2` - Compactado pelo *bzip2*. Programa *bzip2* para descompactar

`.Z` - Compactado pelo *compress*. Programa *uncompress* para descompactar

`.zip` - Compactado pelo *zip*. Programa *unzip* para descompactar

`.rar` - Compactado pelo *rar*. Programa *rar* para descompactar

`.tar.gz` - Compactado pelo *gzip* e empacotado pelo *tar*. Para descompactar, programa *gzip* e depois o programa *tar* ou somente usando *tar* usando `-z`

`.tgz` - abreviação de `.tar.gz`

`.tar.bz2` - Compactado pelo *bzip2* e empacotado pelo *tar*. Para descompactar, programa *bzip2* e depois o programa *tar* ou somente *tar* usando `-j`

`.tar.Z` - Compactado pelo *compress* e empacotado pelo *tar*. Para descompactar, programa *uncompress* e depois o programa *tar* ou somente *tar* usando `-Z`

A tabela a seguir resume o que foi descrito:

| Formato   | Compactar | Descompactar |
|-----------|-----------|--------------|
|`.gz`      | gzip      | gzip         |
|`.bz2`     | bzip2     | bzip2        |
|`.Z`       | compress  | uncompress   |
|`.zip`     | zip       | zip          |
|`.rar`     | rar       | rar          |
|`.tar.gz`  | gzip/tar  | tar -z       |
|`.tar.bz2` | bzip2/tar | tar -j       |
|`.tar.Z`   | compress  | tar -Z       |


## Programas de compactação e descompactação

**gzip** - padrão do Linux. A extensão é `.gz`.

**Sintaxe:** `gzip [opções] [arquivos]`

**Exemplos:**

Compacta usando compactação máxima

{% highlight bash %}
$ gzip -9 arquivo.txt
{% endhighlight %}

Descompacta o arquivo `arquivo.txt`.

{% highlight bash %}
$ gzip -d arquivo.txt.gz
{% endhighlight %}



**bzip2** - é o melhor programa para compactar arquivos texto. A extensão é `.bz2`.

**Sintaxe:** `bzip2 [opções] [arquivos]`

**Exemplos:**

Compacta usando compactação máxima

{% highlight bash %}
$ bzip2 -9 arquivo.txt
{% endhighlight %}

Descompacta o arquivo `arquivo.txt`.

{% highlight bash %}
$ bzip2 -d arquivo.txt.bz2
{% endhighlight %}



**zip** - compatível com pkzip (DOS). A extensão é `.zip`.

**Sintaxe:** `zip [opções] [arquivo-destino] [arquivo-origem]`

**Exemplos:**

Compacta todos os arquivos `.txt` para o arquivo `textos.zip`.

{% highlight bash %}
$ zip textos.zip *.txt
{% endhighlight %}

Compacta todos os arquivos da pasta atual usando compactação máxima para o arquivo `textos.zip`.

{% highlight bash %}
$ zip -9 textos.zip *
{% endhighlight %}




**unzip** - descompacta arquivos `.zip` criados pelo programa `zip`.

**Sintaxe:** `unzip [opções] [arquivo.zip] [arquivos-extraídos] [-d diretório]`

**Opções:**

`-l` - lista os arquivos existentes dentro do arquivo `.zip`.

**Exemplos:**

Descompacta o arquivo `textos.zip`.

{% highlight bash %}
$ unzip textos.zip
{% endhighlight %}

Descompacta apenas o arquivo `carta.txt` do arquivo `textos.zip`.

{% highlight bash %}
$ unzip textos.zip carta.txt
{% endhighlight %}

Lista o conteúdo antes de descompactar.

{% highlight bash %}
$ unzip -l textos.zip
{% endhighlight %}


**rar** - A extensão é `.rar`.

**Ações:**

`a` - compacta

`x` - descompacta

`l` - lista o conteúdo

**Opções:**

`o+` - substitui arquivo sem perguntar

`o-` - não substitui arquivo existente

`y` - assume sim para todas as perguntas


**Exemplos:**

{% highlight bash %}
$ rar a texto.rar texto.txt
$ rar x texto.rar
{% endhighlight %}

**tar** - Não é um compactador, apenas um empacotador (junta vários arquivos em um só). A extensão é `.tar`.

**Sintaxe:**

{% highlight bash %}
tar [opções] [arquivo-destino] [arquivo-origem]
{% endhighlight %}

**Opções:**

`-x` - extrai arquivos gerados pelo `tar`.

`-j` - compacta e a extensão fica `.tar.bz2`.

`-z` - compacta e a extensão fica `.tar.gz` ou `.tgz`.

`-Z` - compacta e a extensão fica `.tar.Z`.

A extensão é importante para identificar qual descompactador usar.

**Exemplos:**

Criar `[c]` um arquivo `[file-f]` chamado `arquivo.txt.tar` que apenas guarda o `arquivo.txt`, sem compactá-lo.

{% highlight bash %}
$ tar -cf arquivo.txt.tar arquivo.txt
{% endhighlight %}

Mais exemplos:

{% highlight bash %}
$ tar -xf arquivo.txt.tar # desempacota o arquivo
$ tar -xzf arquivo.txt.tar.gz # descompacta e desempacota o arquivo
$ tar -xjf arquivo.txt.tar.bz2 # descompacta e desempacota o arquivo
$ tar --list arquivo.txt.tar # lista o conteúdo do arquivo.
{% endhighlight %}
