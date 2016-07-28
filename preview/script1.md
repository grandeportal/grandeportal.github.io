# Shell Script 1 - O Básico

Você já leu o [Papo de Botequim][4] por Julio Cezar Neves? Se não, eu sugiro que leia, pois é um excelente material sobre [Shell Script][5]. Lá ele explica, dentre outras coisas, a diferença entre Bash e Shell. Bom, aqui eu vou mostrar apenas os comandos que eu considero mais relevantes, mas não deixe de ler o [Papo de Botequim][4].

> Esta é a parte 1/3 da série de artigos sobre Shell Script.


## A caixa de ferramentas do shelleiro

O [Canivete Suíço do Shell (Bash)][0] do [Aurélio Marinho Jargas][1] é o guia de referência de quem quer aprender Shell Script. E por isso vou reproduzir aqui os comandos que ele menciona em [][3].

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

![terminal]()

O `$` é o prompt do comando, ou seja, a partir deste símbolo você pode digitar seus comandos.

Se você já leu [alterando o prompt terminal][6] você deve ter visto este prompt:

```bash
rg3915@acer:~/gh/grandeportal$ 
```

onde

```bash
usuario@maquina:caminho$
```

E `~` é a pasta principal, a pasta `home` do usuário atual.

Esta é a configuração padrão do prompt de comando do terminal, mas se quiser, você pode mudar digitando

```bash
PS1="$ "
```

![terminal]()

> Para todos os comandos digite `--help`.

$ <comando> --help

## Arquivos e Diretórios

```bash
$ pwd
```

Mostra o nome e caminho do diretório atual.

### Criando pastas

```bash
$ mkdir pastaprincipal
$ mkdir pasta1 pasta2 pasta3
$ mkdir -p novapasta/subpasta
```

O argumento `-p` cria os diretórios pais à medida que forem necessários sem gerar erro. Ou seja, para criar *subpasta* primeiro ele cria *novapasta*.

### Removendo pastas

```bash
$ rmdir pastaprincipal
```

Remove o diretório se estiver vazio.

### Criando arquivos vazios

```bash
$ touch arquivoprincipal.txt
$ touch arquivo1.txt arquivo2.txt arquivo3.txt
$ touch templates/{base.html,index.html,nav.html}
```

**Obs**: Note que neste exemplo devemos criar a pasta *templates* antes.

### Listando os arquivos

```bash
$ ls
$ ls -l
$ ls -la
```

```bash
$ ls
arquivo1.txt  arquivo2.txt  arquivo3.txt  arquivoprincipal.txt
```

`-l` esta opção usa o formato de listagem longa.

```bash
$ ls -l
total 16
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivo1.txt
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivo2.txt
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivo3.txt
-rw-rw-r-- 1 rg3915 rg3915 0 Mar  5 10:57 arquivoprincipal.txt
```

`-a` mostra arquivos ocultos, que começam com `.`

```bash
$ ls -la
total 32
drwxrwxr-x 2 rg3915 rg3915 4096 Mar  5 10:57 .
drwxrwxr-x 3 rg3915 rg3915 4096 Mar  5 10:57 ..
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 .env
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivo1.txt
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivo2.txt
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivo3.txt
-rw-rw-r-- 1 rg3915 rg3915    0 Mar  5 10:57 arquivoprincipal.txt
```

No exemplo, `.env` é um arquivo oculto.

Experimente

```bash
ls -lh
```

### Visualizando os arquivos numa árvore

```bash
$ sudo apt-get install tree
$ tree templates
$ tree --help
```


### Excluindo arquivos e pastas

Depois de ler os comandos a seguir você vai entender o que o [maluco fez quando excluiu todos os dados da empresa](http://www.tecmundo.com.br/programacao/103701-cara-cade-firma-rapaz-deleta-empresa-linha-codigo-errada.htm).

```bash
$ rm arquivoprincipal.txt
$ rm -i arquivoprincipal.txt
$ rm -f arquivoprincipal.txt
$ rm -rf novapasta
$ rm arquivo*.txt
$ rm *.txt
```

> Cuidado: os comandos a seguir são extremamente perigosos!!!

```bash
$ rm *
$ rm -rf *
```

**Cuidado**: O primeiro comando exclui **todos** os arquivos da pasta atual. O segundo exclui **todos recursivamente** e com **force** ativado, ou seja, exclui arquivos não-vazios sem perguntar.

Experimente

```bash
$ rm -rf \*
```

Este comando **anula** o efeito excluir tudo.


### Copiando arquivos

```bash
cp arquivo.txt arquivo_bkp.txt
cp arquivo.txt /subpasta
cp * /subpasta
cp ~/Documentos .
cp -R ~/Documentos backup/
```

### Movendo arquivos

Move ou renomeia arquivos e diretórios. Semelhante ao `cp`, mas o arquivo de origem é apagado.

```bash
$ mv arquivo.txt backup/
$ mv arquivo.txt novo_nome.txt
```

### Criando links

O comando a seguir cria um link simbólico, o que comumente chamamos de atalho.

```bash
$ ln -s ~/Imagens/ img
```

Digitando `cd img` entramos na pasta `~/Imagens/` através do atalho.











# Redirecionamento de Comandos

## `>`

Redireciona a saída de um comando para outro arquivo. Se o arquivo existir será sobrescrito.


```bash
$ ls -la > dir.txt
```

## `>>`

Redireciona a saída, mas acrescentando os dados ao final do arquivo, sem sobrescrever o arquivo.

```bash
ls /etc/passwd >> dir.txt
```

## `<`

Redireciona a entrada.

```bash
wc -l < arquivo
```

Conta o número de linhas não vazias do arquivo.

Experimente:

```bash
cat << EOF > arquivo.txt
Z
X
C
B
A
EOF
```

Depois

```bash
cat arquivo.txt
```

Depois

```bash
sort < arquivo.txt
```



Pipes ( | barra vertical) - permitem que um programa utilize como entrada a saída de outro programa.



$ ls | wc -l

$ echo Existem `who | wc -l` usuarios conectados

$ ls -a | sort -r

Faz com que o comando `sort` receba como entrada a saída produzida pelo comando `ls`. Neste exemplo o `sort` ordena na ordem reversa.

$ cat /etc/passwd | wc -l > lista.txt

Grava no arquivo `lista.txt` o número de linhas do arquivo `passwd`.











# Grep

Pesquisando em um arquivo específico.

$ grep force_color ~/.bashrc 
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
unset color_prompt force_color_prompt

Pesquisando em todos os arquivos do tipo `txt`.

$ grep regis *.txt

Pesquisando na saída de um comando

$ who | grep rg3915

$ grep -i
$ grep --ignore-case



$ grep -r
$ grep --recursive

$ grep -c
$ grep --count






Falar do echo

\t

\n

















# Shell Script 2 - Estruturas de Controle

mkdir pasta; touch pasta/arquivo.txt; cd pasta; ls

c = 0; while [[ c -le 10 ]]; do echo "$c"; (( c++ )); sleep 0.5; done

for i in $(seq 10); do echo "$i"; sleep 0.5; done

# Criando vários arquivos com um texto aleatório

$ sudo apt-get install gpw
for i in $(seq 1 10); do echo "text$i" > file$i.txt; gpw 7 10 >> file$i.txt; done

# Inserindo o conteúdo de vários arquivos dentro de um único arquivo

for i in $(seq 1 10); do cat file$i.txt >> finalfile.txt; done


## Shell Script e Python




## Numerar Linhas



[0]: 
[1]: 
[2]: 
[3]: 
[4]: 
[5]: 
[6]: 
[7]: 
[8]: 
[9]: 
[10]: 
