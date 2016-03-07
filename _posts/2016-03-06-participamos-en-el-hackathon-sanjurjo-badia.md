---
layout: post

title: Participamos en el hackathon Sanjurjo Badía
excerpt: ""
categories: [proyectos]
---

El pasado fin de semana, 30 febrero y 1 marzo, participé en el [hackathon Sanjurjo Badía](http://hacksb.vigolabs.gal/) que organizaba [VigoLabs](http://vigolabs.gal/), [Jesús](https://twitter.com/jsayar) y [Eloy](https://twitter.com/eloycoto) a la cabeza. Sobre el evento en sí poco más que añadir a [esto](http://www.initios.com/dos-dias-desarrollo-creativo-hackathon-sanjurjo-badia/) y a [esto](http://elladogeekde.ciges.net/blog/hackathon-sanjurjo-badia/), así que un poco de mi experiencia personal.

Después de participar en el [último abredatos](http://jsanroman.net/2011/05/participamos-en-el-abredatos-2011-como-esta-el-panorama1/) -hackathon en remoto con equipo y proyecto ya organizado días antes-, y en el [opendataday de 2014](https://vigodd2014.wordpress.com/2014/02/25/la-jornada-del-open-data-day-en-vigo/) -evento de 1 día-, esta era otra experiencia diferente. Porque a pesar de que sabía de antemano que asistían varios amiguetes, yo llegaba sin equipo ni una remota idea de que hacer. El estar encasillado en el sector marítimo -sector que apenas conozco-, y el deber de usar mínimo una placa [Udoo](udoo.org) como componente hardware, también ayudaba a ello.

Después de saludos varios y de sondear mínimamente los equipos que ya llegaban formados -la mayoría-, llegaba el momento del café, momento que todos aprovechamos para charlar sobre ideas con los representantes de cada empresa que patrocinaba/participaba en el hackathon.

Pronto me uní a [Alberto](https://twitter.com/albertoruibal) y Rodrigo, que traían un termógrafo para desarrollar un posible proyecto sobre el seguimiento de la cadena de frío en el transporte alimentario. A ellos se había unido [Miguel](https://twitter.com/mgesteiro) primero.

Después de unas breves conversaciones con [Kaleido](https://twitter.com/KALEIDOLogistic) y [Marine Instruments](http://www.marineinstruments.es/), teníamos más o menos claro que nuestro proyecto sería una caja negra que haría seguimiento de contenedores marítimos, ya no solo de temperatura -variante de la idea inicial de Alberto y Rodrigo- sino también de señal GPS, y con el uso de giroscopio y acelerómetro detectaríamos posibles golpes e inclinaciones.

A nosotros se unió al momento [Alex](https://twitter.com/alexhermida), que además tiene algo más de experiencia que nosotros en este tipo de transporte.

**Si los conoceis, sabréis que habíamos montado un equipo muy TOP.**

Nos organizamos fácil. Alberto y Rodrigo se encargaban de trastear con la Udoo, de recoger, almacenar y enviar las señales necesarias a un servidor que montábamos Alex y yo, que recogía todos esos datos, los almacenaba en Postgresql y mostraba las gráficas pertinentes. Por otro lado, Miguel se encargaba sobre todo de la comunicación entre la placa Udoo y el servidor, aunque pronto nos sorprendió con sus habilidades sobre toda la parte de marketing del proyecto ^_^ (imagen, naming, presentación, etc).

Pensando que un contenedor solo tendría red al llegar a puerto, debían almacenarse todos sus datos en la propia placa, para una vez en puerto y cuando alguien le proporcionara conexión wifi a través de un móvil, por ejemplo, esta enviara todos los datos recopilados durante el viaje al servidor. Con esta operativa discutimos bastante sobre como debía ser la política de comunicación y almacenamiento entre placa y el servidor, incluso en un primer momento si tendría sentido disponer de un servidor o simplemente apps móviles, opción que descartamos pronto.

En python desarrollamos los scripts que recogerían, almacenarían y enviarían los datos al servidor, con un punto extra de dificultad, pues ni Alberto ni Rodrigo programan habitualmente en ese lenguaje.

La parte servidor la desarrollamos finalmente en [rails 5 (beta1)](http://weblog.rubyonrails.org/2015/12/18/Rails-5-0-beta1/). Un par de servicios web y unas gráficas con hightcharts mostrarían que todo era real. Podría haber sido algo mucho más ligero, pero me atraia la idea de jugar un poco con rails 5, aunque poco tiempo tuve para trastear con sus novedades.

**El domingo pusimos nombre a nuestro proyecto, [Container Sentinel](http://www.containersentinel.com)** -bueno, después de descartar ollocontainer, decidimos que para nuestra expansión a China no iba a resultar XD-, **y ya [desplegabamos las diferentes versiones en Heroku desde el sábado](ollocontainer.herokuapp.com/dashboard)**. Código por [aquí](https://github.com/jsanroman/containersentinel) y por [aquí](https://github.com/jsanroman/containersentinel_embebed).

<div style="max-width:350px;margin:auto;margin-bottom:25px;">
  <blockquote class="twitter-tweet" data-lang="es"><p lang="es" dir="ltr">Grabando datos para la demo <a href="https://twitter.com/hashtag/hacksb?src=hash">#hacksb</a> <a href="https://t.co/BJ0DP9jvH3">pic.twitter.com/BJ0DP9jvH3</a></p>&mdash; Alex Hermida (@alexhermida) <a href="https://twitter.com/alexhermida/status/703983479558639617">28 de febrero de 2016</a></blockquote>
  <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
</div>

En esos 2 días conseguimos una demo bastante funcional, probamos los sensores de temperatura, giroscopio y acelerómetro principalmente, aunque también llegamos a recoger datos de señal GPS gracias a una placa que nos dejó Marine Instruments. 

Cada vez que salíamos fuera y la gráfica de temperatura bajaba, esa Udoo conseguía sacarnos una sonrisa a todos. Para mi era el primer contacto con hardware, y la verdad es que me han quedado ganas de más, otra historia es que el día a día y Martín me lo permitan.

<div style="max-width:350px;margin:auto;margin-bottom:25px;">
  <blockquote class="twitter-tweet" data-lang="es"><p lang="es" dir="ltr">. <a href="https://twitter.com/alexhermida">@alexhermida</a> parece q tira ;) <a href="https://t.co/wClpuZirBf">pic.twitter.com/wClpuZirBf</a></p>&mdash; Javi Sanroman (@javisanroman) <a href="https://twitter.com/javisanroman/status/703983975036030977">28 de febrero de 2016</a></blockquote>
  <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
</div>

Finalmente la presentación de proyectos. Nuestra presentación por Miguel fué muy buena, claro que no soy objetivo pero diré que para mi fué una de las mejores. Todos los proyectos me parecieron de un nivel muy alto y muchos con una demo funcional como la nuestra. Finalmente ganó [ai´nasa](https://www.hackster.io/enxe-eiros-da-nasa/ai-nasa-3e6bfb) del amiguete [Ciges](https://twitter.com/ciges) y compañía, ¡enhorabuena cracks!.

Para mi los resultados fueron toda una sorpresa, pues tenía dudas de que con esa componente hardware y en poco tiempo pudieran salir tantos prototipos con tan buena pinta, y lo había comentado con Eloy semanas antes, muy a gusto reconozco que estaba muy equivocado.

Para terminar, y como no podía ser de otra forma, agradecer a todos los que hicieron posible este evento **en Vigo**, y en especial a Jesús y a Eloy. Me quedo con un gran recuerdo de esos días y ya estoy esperando por el siguiente ;)
