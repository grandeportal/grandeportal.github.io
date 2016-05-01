---
layout:     post
title:      "Cuidado com os comandos perigosos do Shell"
category:   shell
comments:   true
---

Depois do caso que aconteceu com [o rapaz que deletou todos os dados da empresa][0] por causa de um comando errado nós temos que ficar mais espertos com nossos códigos e principalmente com scripts prontos que baixamos de terceiros, por exemplo, scripts do Gist, dentre outros.

> Importante: Sempre leia os comandos antes de executar scripts de terceiros.

## Deletando arquivos via terminal

O comando que o rapaz executou em específico foi

```bash
rm -rf *
```

Vamos por parte:

`rm` - é o comando pra deletar arquivos via terminal.

`-r` - faz com que delete os arquivos recursivamente, ou seja, deleta tudo das pastas e subpastas.

`f` - indica que a ação deve ser forçada, ou seja, não envia nenhuma mensagem de solicitação ou qualquer outro aviso.

Em resumo:

```bash
rm -rf *
```

Deleta tudo das pastas e subpastas sem avisar nada.


Julio Neves em seu artigo [Papo de Botequim][1] dá uma dica sobre como contornar esse problema da seguinte forma:

```bash
rm \*
```

Quando usamos barra invertida ele "anula" o parâmetro seguinte, no caso o `*`.

O mesmo efeito pode ser obtido no comando a seguir:

```bash
rm -rf \*
```

Uma outra dica que eu falo no meu post [Renomeando comandos][2], é você editar o seu arquivo `~/.bashrc`, escrevendo o seguinte comando:

```bash
alias rm='rm -i'
```

> Reinicie o terminal para surtir efeito, ou digite

```bash
source ~/.bashrc
```

A partir de agora quando você usar o comando `rm` ele vai pedir confirmação antes de deletar.

Ou você pode desativar o comando enviando uma mensagem. Edite o `~/.bashrc`.

```bash
alias rm='echo "rm is disabled."'
```


## Redirecionamento perigoso

Quando digitamos o comando

```bash
ls /etc/ > arquivo.txt
```

Nós redirecionamos a saída do comando `ls` para o arquivo.txt. Até ai tudo bem.

O **perigo** vem agora:

```bash
cat arquivo.txt > arquivo.txt
```

Nós redirecionamos a saída do arquivo.txt para ele próprio. Pronto, acabamos de perder o conteúdo do nosso arquivo.

Isto é **perigoso** porque se você fizer isso num arquivo importante. Já era!!!

Outro exemplo:

```bash
echo "texto" > arquivo.txt
```

O conteúdo do arquivo.txt é *texto*.

Se você fizer

```bash
echo "palavra" > arquivo.txt
```

Agora o conteúdo do arquivo.txt é *palavra*.

### Solução

Uma solução para estes problemas é você usar `>>`. Assim, ele insere o novo conteúdo numa nova linha de texto, mantendo o conteúdo original.

```bash
echo "palavra" >> arquivo.txt
```

Fazendo

```bash
cat arquivo.txt
```

Teremos

```bash
texto
palavra
```


[0]: http://www.tecmundo.com.br/programacao/103701-cara-cade-firma-rapaz-deleta-empresa-linha-codigo-errada.htm
[1]: https://jneves.wordpress.com/2008/03/05/papo-de-botequim-parte-1/
[2]: http://grandeportal.github.io/terminal,%20alias/2016/renomeando-comandos/