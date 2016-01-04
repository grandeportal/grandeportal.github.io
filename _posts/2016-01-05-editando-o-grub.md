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
cp /boot/grub/grub.cfg /boot/grub/grub_ori.cfg
gedit /boot/grub/grub.cfg
{% endhighlight %}

No meu caso, eu vou editar as linhas 90 e 94.

**Antes**

{% highlight vim %}
if [ "${recordfail}" = 1 ] ; then
  set timeout=30
else
  if [ x$feature_timeout_style = xy ] ; then
    set timeout_style=menu
    set timeout=10
  # Fallback normal timeout code in case the timeout_style feature is
  # unavailable.
  else
    set timeout=10
  fi
fi
{% endhighlight %}

**Depois**

{% highlight vim %}
if [ "${recordfail}" = 1 ] ; then
  set timeout=30
else
  if [ x$feature_timeout_style = xy ] ; then
    set timeout_style=menu
    set timeout=5 # mudei aqui
  # Fallback normal timeout code in case the timeout_style feature is
  # unavailable.
  else
    set timeout=5 # e aqui
  fi
fi
{% endhighlight %}

Pronto!
