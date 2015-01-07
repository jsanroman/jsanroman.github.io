--- 
layout: post

title: Eliminando un commit local en mercurial
tags: []
excerpt: ""
categories: [tips]
---

Desde hace un tiempo estoy usando [bitbucket.org](https://bitbucket.org) para mis proyectos. Ayer gracias a un commit en falso encontré este [fantástico manual hg](http://hgbook.red-bean.com/read/mercurial-queues-reference.html#id446269). Eliminar un commit de mercurial es tan sencillo como:

{% highlight bash %}
hg strip revision_a_eliminar
{% endhighlight %}

Pero para ejecutar este comando necesitamos activar la extension mq de mercurial. En mi caso, osx, solo he necesitado añadir al fichero .hgrc:
{% highlight bash %}
[extensions]
mq=
{% endhighlight %}
