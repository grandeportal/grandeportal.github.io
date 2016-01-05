---
layout:     post
title:      "Editando o GRUB"
header-img: "img/posts/post-bg-edit-grub.png"
tags: grub
---

**Cuidado:** Não é muito bom editar o GRUB, mas de vez em quando a gente precisa.

Neste exemplo vou editar somente o `timeout` para 5 seg.

> Faça um **backup** do grub. Senão já era.

{% highlight bash %}
cp /etc/default/grub /etc/default/grub_ori
sudo gedit /etc/default/grub
{% endhighlight %}


**Antes**

{% highlight vim %}
GRUB_TIMEOUT=10
{% endhighlight %}

**Depois**

{% highlight vim %}
GRUB_TIMEOUT=5
{% endhighlight %}

Salva e fecha. E no terminal digite

{% highlight bash %}
sudo update-grub
{% endhighlight %}

Pronto!

<img src="{{ site.baseurl }}/img/posts/grub-update.png" alt="grub-update.png">

**Fonte:** [how-to-configure-the-grub2-boot-loaders-settings](http://www.howtogeek.com/196655/how-to-configure-the-grub2-boot-loaders-settings/)
