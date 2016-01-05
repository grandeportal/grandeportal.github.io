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

Inicie um **Live-CD** ou **Live-USB** com a mesma arquitetura do Linux que estava instalado, ou seja, se o Linux instalado for 64 Bits, use Live-CD ou Live-USB 64bits, se o Linux instalado for 32bits use Live-CD ou Live-USB 32bits.

* Abra o **terminal** (CTRL+ALT+T)
* e digite

{% highlight bash %}
sudo su
{% endhighlight %}

Veja qual partição está instalada o seu Linux

{% highlight bash %}
lsblk
{% endhighlight %}

<img src="{{ site.baseurl }}/img/posts/lsblk.png" alt="lsblk.png">

Crie uma pasta para ser o ponto de montagem

{% highlight bash %}
mkdir hd
{% endhighlight %}

Monte a partição que tem o Linux

{% highlight bash %}
mount /dev/sda3 hd/
{% endhighlight %}

**Nota:** no meu caso *sda3* é a minha partição Linux, talvez na sua seja diferente.

Vincule temporariamente os dispositivos e processos ativados atualmente pelo Live-CD no Linux que está instalado.

{% highlight bash %}
mount --bind /dev/ hd/dev
mount --bind /proc/ hd/proc
mount --bind /sys/ hd/sys
{% endhighlight %}

Mude temporariamente a referência ao `/` para dentro da pasta

{% highlight bash %}
chroot hd/
{% endhighlight %}

Reinstale o GRUB utilizando o próprio sistema instalado no hd

{% highlight bash %}
grub-install /dev/sda
update-grub
exit
{% endhighlight %}

Desmonte todas as partições

{% highlight bash %}
umount -a
{% endhighlight %}

Reinicie o sistema

{% highlight bash %}
reboot
{% endhighlight %}

Agradecimentos ao meu amigo [Fábio](https://gist.github.com/luzfcb/69ed9391290952a1f881).