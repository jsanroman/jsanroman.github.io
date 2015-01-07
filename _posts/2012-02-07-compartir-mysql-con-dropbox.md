--- 
layout: post

title: Compartir mysql con dropbox
excerpt: ""
categories: [tips]
---

Hace bastante tiempo que además de tener mis proyectos versionados en bitbucket, muchos de ellos están sincronizados con dropbox. Esto me permite trabajar en cualquiera de los 2 equipos que utilizo habitualmente.
Pero desde que trabajo de esta forma tengo la necesidad de compartir bbdd, mysql en la mayoría de los casos. La solución hasta este momento ha sido la típica con mysqldump e import, completamente inoperativa. Desde entonces busco la mejor forma de sincronizar las bbdd's entre los 2 equipos, solo entre esos 2 equipos, solo en desarrollo.

Servidor externo mysql
----
Aunque es una opción, intento mantener la infraestructura de desarrollo mínima (por esto utilizo bitbucket y dropbox). Un servidor en mi red local no es viable, muchas veces necesito trabajar fuera de la oficina, y abrir puertos tampoco me lo planteo. Un servidor fuera de mi red local sería demasiado lento para desarrollo.

Automatizar export/import de .sql
----
Otra de las opciones que se me pasaron por la cabeza, desarrollar una serie de scripts que automáticamente exportaran bbdd's a .sql cada X tiempo/evento y se almacenaran en dropbox, otros scripts detectarían que los .sql fueron modificados y los importarían. Parece demasiado jaleo todo, y sobre todo demasiado tiempo perdido :S.

Almacenar ficheros nativos de determinadas bbdd mysql en dropbox
----
Apuntando con un enlace simbolico. Por ejemplo:
{% highlight bash %}
ln -s /opt/local/var/db/mysql5/dbtest /dropbox/var/mysql/dbtest
{% endhighlight %}
Esto funcionaría perfecto para el motor [MyISAM](http://es.wikipedia.org/wiki/MyISAM") ya que todos los datos que usa cada bbdd se almacenan en esos ficheros MYD, MYI, frm. Pero con innodb no es tan sencillo. En mysql hay [bastante información sobre este motor](http://dev.mysql.com/doc/refman/5.0/es/innodb-configuration.html):

* Lo primero sería utilizar el parámetro *innodb_file_per_table* en my.cnf para que innodb genere un .idb con la estructura de cada tabla en lugar de almacenarlo todo en el fichero ibdata1.
* Configurar el parámetro *innodb_data_home_dir* para que almacene el fichero *ibdata1* en dropbox y este sea compartido por ambos servidores mysql.
* Configurar el parámetro *innodb_log_group_home_dir* para que almacene los ficheros de log de innodb en mysql y también sean compartidos.

Con esto, y apuntando las bbdd's que necesitemos sincronizar a dropbox, en principio sería suficiente. Pero dentro del jaleo que supone todo esto y los posibles problemas que puede traer, hay uno que me ha llevado a tomar otra decisión. Y es que yo creo links simbólicos para apuntar solo ciertas bbdd's que necesito sincronizar, no todas, pero ibdata1 y los logs siguen almacenando información de cada bbdd que utilice el motor innodb dentro del servidor mysql. Y puedo tener otras bbdd's diferentes entre ambos servidores y que no necesito compartir, creo que produciría un autentico caos y no tardaría en corromper el espacio de tablas.

2 configuraciones independientes de mysql, una en local otra en dropbox
----
Así que finalmente esta es mi solución ya en modo pruebas desde hace una semana: **2 configuraciones diferentes**, que yo uso con 2 ficheros my.cnf diferentes, los cuales renombro cada vez que necesito cambiar de entorno:

* *my.cnf.local*: Con esta configuración mis bbdd's se almacenan en local (no están sincronizadas), todo igual que hasta ahora.
* *my.cnf.dropbox*: En esta otra configuración lo que hago es cambiar la variable datadir para almacenar todos los ficheros que genera mysql en dropbox y por lo tanto sí que están permanentemente sincronizadas.

La pega de compartir el datadir entre 2 servidores mysql es que solo uno de ellos puede estar iniciado a la vez, pero en definitiva, esto es el antipatrón servidor. Si resulta ser operativo, seguiremos puliendo.
