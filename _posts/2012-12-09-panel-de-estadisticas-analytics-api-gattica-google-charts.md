--- 
layout: post

title: Panel de estadísticas (analytics api, gattica, google charts)
excerpt: ""
categories: [tips]
---

Estoy colaborando en un proyecto en el que necesitamos mostrar las estadísticas de las app's móviles de nuestros clientes. Claro que usamos google analytics, pero para hacerle la consulta más sencilla a nuestros usuarios hemos decidido añadir un panel de estadísticas al mismo gestor que usan para configurar su app.

La plataforma en servidor es rails con la colección de gemas correspondientes.

Para integrarnos con analytics usaremos [gattica](https://github.com/chrisle/gattica), muy sencillota.

Para mostrar estos datos en sus respectivos gráficos usaremos [google charts](https://google-developers.appspot.com/chart/).

Todo muy facilito, aunque en ocasiones sea necesario manejar mínimamente los datos que devuelve analytics para mostrarlos en charts.

Pero, algo que sí me ha llamado la atención por ser ambas herramientas de google (charts y analytics):

* Cuando pides datos por país (país es una dimensión) a analytics, este **devuelve sus nombres de país**.
* Cuando filtras datos por país (país es un filter) a analytics, este **necesita como filtro el nombre del país**.
* Pero para el gráfico [GeoChart](https://google-developers.appspot.com/chart/interactive/docs/gallery/geochart) de regiones de un país, **charts necesita que ese filtro país sea el código ISO del país**.
* Para llegar al nivel de región desde el nivel de país atendemos al evento regionClick, el cual como parámetros solo recibe el código ISO del país, por lo que no tendremos el nombre para decirle a analytics que nos devuelva las estadísticas para este país.

Al final damos un pequeño rodeo, y además del evento "regionClick" habitual, usamos el evento "select" que se activará cada vez que pulsemos en un país del mapa, un poco de código para intentar clarificar el asunto:

{% highlight coffeescript %}
# Primero se ejecuta este evento del que obtenemos el código ISO del país seleccionado
google.visualization.events.addListener(geochart, 'regionClick', (e) -> 
  isoCountrySelect = e.region
)

# A continuación se ejecuta este otro evento desde el que obtenemos el nombre del país seleccionado
google.visualization.events.addListener(geochart, 'select', (e)->
  console.log(e)
  selection = geochart.getSelection()
    if selection.length == 1
      selectedRow = selection[0].row
      selectedCountry = data.getValue(selectedRow, 0)
      # Llamamos a drawRegionsMap para dibujar el mapa de regiones con las estadísticas
      drawRegionsMap(selectedCountry, isoCountrySelect)
)

drawRegionsMap = (country, countryIso) ->
  # Añadimos el nombre de país al campo del formulario que pedirá los datos de analytics al servidor
  $('#country').val(country);
  # Creamos la tabla que almacena los datos para charts
  data = new google.visualization.DataTable()
  data.addColumn('string', 'City')
  data.addColumn('number', 'Access')

  options = 
    region: countryIso
    displayMode: 'markers'

  geochart = new google.visualization.GeoChart(document.getElementById('geochart'))

  $.ajax
    async: true
    type: 'GET'
    url: $('#form_filter_stats').data('stats_for_regions_action')+'.json'
    data: $('#form_filter_stats').serialize()
    success: (r) ->
      for stat in r
        data.addRow([stat.city, stat.visits])

      geochart.draw(data, options)
{% endhighlight %}

Y aquí parte del resultado, aunque no podais toquetear :):

<img src="http://jsanroman.net/wp-content/uploads/2012/stats.png" alt="stats" />
