--- 
layout: post

title: ruby1.9 y rails3 con rvm y passenger
tags: []
excerpt: ""
categories: [tips]
---

Comentaba que uno de los caminos por los que me gustaría seguir es rails (ya veremos si lo consigo compaginar), así que en mi servidor de proyectos necesito servir rails además php.

Quiero usar rails 3 y ruby 1.9 (de empezar, con lo último), parece que versiones demasiado nuevas para las últimas estables de la mayoría de distribuciones linux. Así que después de investigar un poco me encuentro con [rvm](http://rvm.beginrescueend.com/) (ruby version manager, de este ya me había hablado @tothemario, un gestor de instalaciones ruby) y [passenger](http://www.modrails.com) (un proyecto para servir rails a través de apache o nginx).

A través [de este artículo](http://www.fangiotophia.com/journal/2010/8/31/random-act-of-stupidity-6-debian-rails-3-setup-guide.html) conseguí instalar rvm, no sin antes resolver varias dependencias:
{% highlight bash %}
sudo apt-get install zlib1g zlib1g-dev zlibc build-essential
{% endhighlight %}
Como nota mental, recordar añadir la siguiente linea al final del fichero .bashrc
{% highlight bash %}
[[ -s "/home/user/.rvm/scripts/rvm" ]] && source "/home/user/.rvm/scripts/rvm" # This loads RVM into a shell session.
{% endhighlight %}
Y ya podemos instalar la versión de ruby que necesitemos con *rvm install "version"* y cambiar de versión con *rvm use "version"*, realmente sencillo.

Rvm y las versiones de ruby instaladas se encuentran en *$HOME/.rvm* en caso de instalarse como usuario o en */usr/local/rvm* en caso de una instalación con root.

A continuación toca la instalación de passenger:
{% highlight bash %}
gem install passenger
passenger-install-apache2-module
{% endhighlight %}
*passenger-install-apache2-module* nos guiará durante la instalación, nos pedirá que instalemos determinadas dependencias que no cumplimos, de todas las que propone la que nos puede dar problemas es: *apt-get install libopenssl-ruby*.

Como hemos instalado ruby a través de rvm, este no se entera del soporte openssl que passenger propone instalar mediante apt, así que instalamos openssl con rvm, y reinstalamos la versión de ruby necesaria:

{% highlight bash %}
rvm package install openssl
rvm remove 1.9.2
rvm install 1.9.2 -C --with-openssl-dir=$HOME/.rvm/usr
{% endhighlight %}

Tras añadir las lineas respectivas a apache2.conf, ya tenemos rails3 funcionando en apache:

{% highlight bash %}
LoadModule passenger_module $HOME/.rvm/gems/ruby-1.9.2-p180/gems/passenger-3.0.5/ext/apache2/mod_passenger.so
PassengerRoot $HOME/.rvm/gems/ruby-1.9.2-p180/gems/passenger-3.0.5
PassengerRuby $HOME/.rvm/wrappers/ruby-1.9.2-p180/ruby
{% endhighlight %}

Finalmente intenté descargarme un proyecto privado desde github via http, para probar el entorno, pero la versión de git que tenía instalada (1.5) parece que da problemas con esta autenticación, así que buscando información actualizamos a la 1.7:

Añadimos el fuente de los backports al sources.list
{% highlight bash %}
deb http://backports.debian.org/debian-backports lenny-backports main contrib non-free
{% endhighlight %}

Y actualizamos la versión de git a la 1.7
{% highlight bash %}
apt-get update
apt-get -t lenny-backports install git
{% endhighlight %}

Fuentes:

* [http://www.fangiotophia.com/journal/2010/8/31/random-act-of-stupidity-6-debian-rails-3-setup-guide.html](http://beginrescueend.com/packages/openssl)
* [http://beginrescueend.com/packages/openssl](http://beginrescueend.com/packages/openssl)
* [http://rvm.beginrescueend.com](http://rvm.beginrescueend.com)
* [http://serverfault.com/questions/157383/why-does-the-debian-lenny-git-package-not-install-git](http://serverfault.com/questions/157383/why-does-the-debian-lenny-git-package-not-install-git)
* [http://www.modrails.com/documentation/Users%20guide%20Apache.html](http://www.modrails.com/documentation/Users%20guide%20Apache.html)
