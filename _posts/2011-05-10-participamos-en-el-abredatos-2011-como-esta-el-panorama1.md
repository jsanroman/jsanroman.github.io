--- 
layout: post

title: Participamos en el abredatos 2011, !&iquest;Como está el panorama?&iexcl;
tags: []
excerpt: ""
categories: [proyectos]
---

<img style="float:right;" title="abredatos logo" src="/images/posts/abredatos.jpg" alt="" width="177" height="158" />

Este fin de semana hemos participado en [abredatos 2011](http://www.abredatos.es) con [¡¿comoestaelpanorama?!](http://comoestaelpanorama.com).

Mis compañero-cracks de aventura, [Paula](http://twitter.com/#!/paf82), [Javi](http://twitter.com/#!/aliencanibal), [Damián](http://twitter.com/#!/nimrud), con los que en su momento tuve el gustazo de trabajar/estudiar, pero con los que hacía mucho mucho tiempo que no colaboraba. Ha sido tooodo un placer volver a compartir code, proyecto y grata experiencia con ellos.

Abredatos
----
Abredatos es un concurso (este año es la segunda edición), organizado por [Pro Bono Público](http://blog.probp.org), para darle un poco de bombo al movimiento [opendata](http://es.wikipedia.org/wiki/Datos_abiertos) en España. Intentar que la sociedad sepa que es y porqué se necesita el opendata, y que a la administración pública le llegue un poquito de ruído, y poco a poco (así es como funcionan estas cosas) estas ideas vayan calando. El [concurso consiste en](http://www.abredatos.es/bases) el desarrollo de una aplicación en nada menos que 48h!, y que consulte al menos una fuente de datos pública. Al finalizar el concurso (el domingo a las 00:00), todo proyecto debía tener un repositorio público con los fuentes, y su proyecto accesible para todo el mundo.

Nuestra participación
----
Una primera toma de contacto allá por el 3 de abril, y un par de semanas después estabamos los 4 personajes comprometidos para participar ([¡somos el equipo 62!](http://live.abredatos.es/teams/62)), Javi y Paula desde Londres, Damián desde Vigo, y [aquí un servidor](http://twitter.com/#!/javisanroman) desde Gondomar ([vamos a ponerlo en el mapa](http://maps.google.es/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=gondomar&amp;aq=&amp;sll=40.396764,-3.713379&amp;sspn=12.391454,28.54248&amp;ie=UTF8&amp;hq=&amp;hnear=Gondomar,+Pontevedra,+Galicia&amp;t=h&amp;z=13&amp;iwloc=A)).

Las siguientes fueron unas semanas de reflexiones e idas de olla sobre que podíamos hacer, que queriamos hacer, y si podíamos hacerlo (es realmente difícil con los datos disponibles hoy en día). La idea del empleo siempre estuvo presente por la importancia que tiene ahora, pero no conseguiamos encontrar nada realizable en 48h, nos faltaban muuchos datos (ya, por eso existe el concurso y para eso participamos, para que cambie el panorama).

Además de la idea del empleo surgieron otras: apps para geolocalizar información variada, y siempre por la zona de Vigo-Pontevedra (farmacias, bibliotecas, ptos wifi, buses,...), apps que ofreciera de una forma mas accesible contrataciones/licitaciones de la Xunta de Galicia, e incluso surgió la idea de un juego en el que elegir un par de congresistas, muy curioso pues finalmente el [equipo 48](http://live.abredatos.es/teams/49) desarrollo [un proyecto muy parecido](http://www.congresoabierto.com), y con un resultado fantástico.

Técnicamente
----
Después de plantear rails (sabeis que siento devoción por este entorno), Damián y yo llegamos a la conclusión de que ninguno tenía la experiencia suficiente como para llevar a cabo un desarrollo tan intenso, y enfrentarnos con éxito veloz a esos problemas que siempre acabas encontrando (sabemos como funciona esto, ley murphy etc etc). Así que nos decidimos por php y en este caso codeigniter, no somos los+cool pero ha cumplido a la perfección :P. Además usamos [jquery](http://jquery.com), [google maps api](http://code.google.com/intl/es/apis/maps), [php-excell-reader](http://code.google.com/p/php-excel-reader), [google web fonts](http://www.google.com/webfonts), [google charts](http://chart.apis.google.com), google geocode.

Las fuentes que usamos para el proyecto han sido: [estadísticas de empleo de redtrabaja](https://www.redtrabaja.es/es/redtrabaja/static/Redirect.do?page=statsMunicipios), [estadísticas de población del ine](http://www.ine.es/pob_xls/pobmun10.xls), y la api de [opcionempleo](http://www.opcionempleo.com).

Para versionar usamos git, alojando el código en github, [podeís consultar los fuentes aqui](https://github.com/jsanroman/comoestaelpanorama).

El desarrollo
----
El desarrollo durante el fin de semana tuvo varias fases de optimismo/pesimismo desmedido, en este sentido ya es complicado encontrar el equilibrio en un proyecto internet, ¡cuanto mas en un proyecto internet de 48h!, y cuanto mas en un proyecto internet de 48h y cada cual en un lugar diferente.

Durante el fin de semana, como no, el parseo de datos fué lo que mas complicó todo el desarrollo. Hasta el sabado de madrugada no teníamos todavía datos reales, y las funcionalidades implementadas trabajaban contra datos de pruebas, ¡muuucha incertidumbre!. Con el primer parseo serio teníamos datos incongruentes, en España había mas de 8M de parados, la cosa está mal pero no para tanto :). Estabamos sumando las ultimas filas de los xls con el sumatorio, lo cual duplicaba todos los datos, ¡llegamos a pensar que habíamos interpretado mal la fuente de datos!, todo se vivía de una forma muy intensa y eran las casi las 5 de la mañana después de dormir 4h escasas la madrugada del viernes. Finalmente detectamos el error y el domingo por la mañana realizamos otro parseo con éxito.

Una vez datos parseados, teníamos ccaa/provincias/municipios y datos estadísticos asociados, nos quedaba un problema por solucionar, geolocalizar cada uno de los 8113 municipios de nuestra bbdd. La opción mas sencilla era google y [su servicio geocode](http://maps.google.com/maps/api/geocode/json?address=Vigo,ES), pero a las 600-1000 peticiones eramos baneados. Los vecinos, un par de modems 3g y en el entorno de producción nuestras soluciones, así poco a poco fuímos geolocalizando de 1000 en 1000 +-.

Las últimas horas del domingo fueron para algunos detalles, necesitamos pantalla "[sobre el proyecto](http://comoestaelpanorama.com//c/sobre)", estadísticas en portada, ¿de donde quitamos los datos?, etc. [Finalmente esto es lo que ha dado de sí](http://comoestaelpanorama.com), sabemos que tiene cosas por pulir pero amiguetes, han sido 48h.

La experiencia
----
La experiencia ha sido muy enriquecedora. Volver a trabajar con mis compis, saber que puedes dar de ti en tan poco tiempo, como organizar o mejor dicho desorganizar un proyecto así en tan poco tiempo, ver a cada momento como avanzaban los demás equipos, tomar tantas decisiones y en tan poco tiempo para poder llegar a tener algo, y la repercusión final.

Como apunte y que defiendo desde hace ya tiempo, comentar que el teletrabajo funciona y muy bien (he aquí la prueba), pero a mi no me convence, por lo que la próxima vez que participe en algo así intentaré, al menos con la parte más técnica, hacerlo de forma presencial, se pasa mucho mejor :) y se transmite mas conocimiento.

Para rematar, felicitar desde este mi humilde espacio a [todos los equipos que han participado](http://live.abredatos.es/teams), en serio, las trabas para desarrollarlos son enormes, y los proyectos son de una calidad excelente.
