---
layout:     post
title:      "Recuperando o GRUB"
header-img: "img/posts/post-bg-grub2.png"
tags: grub
---

Quando você faz a instalação do Ubuntu usando **dual boot**...

1. Instale primeiro o Windows
2. Depois instale o Ubuntu

... você terá uma tela parecida com essa. O famoso **GRUB**, onde você escolhe qual SO você quer inicializar.

<img src="{{ site.baseurl }}/img/posts/post-bg-grub.png" alt="post-bg-grub.png">

Mas e no dia que dá pau no computador e você não consegue inicializar o GRUB? Calma, não precisa se desesperar e jogar o computador no lixo.

Faça o seguinte:

* Pegue o pen drive com a imagem do seu Ubuntu.
* Rode o Ubuntu em modo Live-CD.
* Abra o terminal (CTRL+ALT+T)
* e digite

{% highlight bash %}
sudo fdisk -l
sudo mount -t ext4 /dev/sda6 /mnt
sudo grub-install --root-directory=/mnt /dev/sda
{% endhighlight %}

**Nota:** no meu caso *sda6* é a minha partição, talvez na sua seja diferente.
