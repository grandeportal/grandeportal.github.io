## Teclas de atalho

```
{ "keys": ["ctrl+k", "ctrl+u"], "command": "upper_case" },
{ "keys": ["ctrl+k", "ctrl+l"], "command": "lower_case" },
```

C+S+J
C+S+A
C+S+V

## Configurando as preferências

`Preferences > Settings - User`

*Preferences.sublime-settings*

```
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
```


## Configurando algumas teclas de atalho

`Preferences > Key Bindings - User`

*Default (Linux).sublime-keymap*

```
[
    { "keys": ["ctrl+0"], "command": "reset_font_size" },
    { "keys": ["ctrl+8"], "command": "insert_snippet", "args": {"contents": "```\n${0:$SELECTION}\n```"}, "context":
        [
            { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
            { "key": "selection_empty", "operator": "equal", "operand": false, "match_all": true }
        ]
    },
    { "keys": ["ctrl+9"], "command": "toggle_comment", "args": { "block": false } },
    { "keys": ["ctrl+shift+9"], "command": "toggle_comment", "args": { "block": true } },
]
```

## Completions

Clique em `Preferences > Browse Packages...`

Crie um novo arquivo dentro desta pasta e salve como `email.sublime-completions`.

```
{
    "completions":
    [
        { "trigger": "html", "contents": "<html>\n\t<body>\n\t\t<h1>$1</h1>\n\t\t<p>$0</p>\n\t</body>\n</html>"},
    ]
}
```

## Snippets

```
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

```
## Configurando o Package Control

https://packagecontrol.io/installation

`View > Show Console`

Copie este texto

import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

`ENTER`

`CTRL+SHIFT+P`

Install Package




## Plugins

PythonPEP8 Autoformat

```
"autoformat_on_save": true,
```

#### Emmet

http://emmet.io/blog/sublime-text-3/

http://docs.emmet.io/cheat-sheet/

#### Djaneiro

https://github.com/squ1b3r/Djaneiro

#### Markmon real-time markdown preview

