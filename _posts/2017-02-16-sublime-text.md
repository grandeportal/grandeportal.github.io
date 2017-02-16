---
layout:     post
title:      "Sublime Text 3"
category:   editor de texto
comments:   true
---

# Sublime Text 3

Existem vários editores de texto, e cada um usa aquele que gosta, que se sente mais confortável. Dessa vez eu escolhi o [Sublime Text 3][0].

*"Sublime Text may be downloaded and evaluated for free, however a license must be purchased for continued use."*

Eu gosto dele porque existem vários plugins que aumentam muito a minha produtividade. Além disso, ele é multiplataforma e **não perde o arquivo** caso você feche o programa sem salvar.

## Teclas de atalho

{% highlight js %}
{ "keys": ["ctrl+k", "ctrl+u"], "command": "upper_case" },
{ "keys": ["ctrl+k", "ctrl+l"], "command": "lower_case" },
{% endhighlight %}

## Configurando as preferências

`Preferences > Settings - User`

*Preferences.sublime-settings*

{% highlight js %}
{
    "bold_folder_labels": true,
    "draw_white_space": "all",
    "ignored_packages":
    [
        "Vintage"
    ],
    "reset_font_size": 10.0,
    "rulers": [80],
    "save_on_focus_lost": true,
    "tab_size": 4,
    "translate_tabs_to_spaces": true
}
{% endhighlight %}


## Configurando algumas teclas de atalho

`Preferences > Key Bindings - User`

*Default (Linux).sublime-keymap*

{% highlight js %}
[
    { "keys": ["f9"], "command": "aluguel" },
    { "keys": ["ctrl+0"], "command": "reset_font_size" },
    { "keys": ["ctrl+8"], "command": "insert_snippet", "args": {"contents": "```\n${0:$SELECTION}\n```"}, "context":
        [
            { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
            { "key": "selection_empty", "operator": "equal", "operand": false, "match_all": true }
        ]
    },
    { "keys": ["ctrl+9"], "command": "toggle_comment", "args": { "block": false } },
    { "keys": ["ctrl+shift+9"], "command": "toggle_comment", "args": { "block": true } },
    { "keys": ["ctrl+k", "ctrl+t"], "command": "title_case" },
]
{% endhighlight %}

## Completions

Clique em `Preferences > Browse Packages...`

Crie um novo arquivo dentro desta pasta e salve como `email.sublime-completions`.

{% highlight js %}
{
    "completions":
    [
        { "trigger": "html", "contents": "<html>\n\t<body>\n\t\t<h1>$1</h1>\n\t\t<p>$0</p>\n\t</body>\n</html>"},
    ]
}
{% endhighlight %}

## Snippets

{% highlight js %}
<snippet>
    <content><![CDATA[
Nome: ${1:seu_nome}
Email ${2:seu_email}
Descrição ${3:Lorem ipsum dolor sit amet.}
]]></content>
    <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
    <tabTrigger>teste</tabTrigger>
    <!-- Optional: Set a scope to limit where the snippet will trigger -->
    <!-- <scope>source.python</scope> -->
</snippet>
{% endhighlight %}

## Configurando o Package Control

https://packagecontrol.io/installation

`View > Show Console`

Copie o texto que está no link acima.

`ENTER`

Após a atualização pressione `CTRL+SHIFT+P` e digite *Install Package*.


## Plugins

PythonPEP8 Autoformat

{% highlight js %}
"autoformat_on_save": true,
{% endhighlight %}

#### Emmet

http://emmet.io/blog/sublime-text-3/

http://docs.emmet.io/cheat-sheet/

#### Djaneiro

https://github.com/squ1b3r/Djaneiro

#### Markmon real-time markdown preview


#### Inserir data

http://kevinmorey.com/post/84828796419/insert-current-timestamp-into-sublime-text

https://gist.github.com/kmorey/11389657

[0]: https://www.sublimetext.com/3