--- 
layout: post

title: Probando geoplugin.net desde ruby
excerpt: ""
categories: [tips]
---

Ayer en un rato libre estuve trasteando con ruby y el servicio de geolocalización por ip <http://www.geoplugin.net>. A la petición <http://www.geoplugin.net/php.gp?ip=91.61.81.221> tenemos una respuesta del tipo:

{% highlight json %}

a:14:{s:14:"geoplugin_city";s:8:"Chemnitz";s:16:"geoplugin_region";s:6:"Saxony";s:18:"geoplugin_areaCode";s:1:"0";s:17:"geoplugin_dmaCode";s:1:"0";s:21:"geoplugin_countryCode";s:2:"DE";s:21:"geoplugin_countryName";s:7:"Germany";s:23:"geoplugin_continentCode";s:2:"EU";s:18:"geoplugin_latitude";s:15:"50.833301544189";s:19:"geoplugin_longitude";s:15:"12.916700363159";s:20:"geoplugin_regionCode";s:2:"13";s:20:"geoplugin_regionName";s:6:"Saxony";s:22:"geoplugin_currencyCode";s:3:"EUR";s:24:"geoplugin_currencySymbol";s:7:"&#8364;";s:27:"geoplugin_currencyConverter";d:0.68893261679999995283907310295035131275653839111328125;}

{% endhighlight %}

Un objeto serializado al modo php. Depués de probar la <a href="https://github.com/flori/json">gema json</a> y otros medios de <a href="http://www.skorks.com/2010/04/serializing-and-deserializing-objects-with-ruby/">serialización/deserialización</a>  de objetos ruby sin éxito, me encuentro con la gema <a href="http://www.aagh.net/files/ruby/php-serialize/doc/">php-serialize</a> que hace justo lo que necesito.

{% highlight ruby %}
      require 'php_serialize'
      geo_request = Net::HTTP.get_response(URI.parse("http://www.geoplugin.net/php.gp?ip="+request.remote_ip)).body
      geo_request=PHP.unserialize(ip)
      puts geo_request['geoplugin_latitude']
      puts geo_request['geoplugin_longitude']
{% endhighlight %}

Seguro que existen otras formas más eficientes de hacer lo mismo, pero por el momento me ha servido.
