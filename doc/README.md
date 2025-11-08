# Práctica FTP: Configuración de un servidor FTP

## Sumario:

1. Configuraciones previas
2. Usando un cliente GUI de FTP
3. Instalación de vsftpd
4. Configuración del servidor vsftpd seguro

## 1. Configuraciones previas

Vamos a empezar clonando nuestro anterior proyecto dns-paso-a-paso para tener una base. Hecho esto ya tendríamos un servidor DNS listo para funcionar.

![Captura de la clonación del repositorio dns-paso-a-paso](./capturas/captura1.png)

Vamos ahora a configurar el servidor. Ahora tendremos que cambiar las direcciones IP y algunos ajustes de las zonas. Todos los cambios están en la carpeta [config](https://github.com/dariob2190/servidor-FTP/tree/main/config).

Como ya hemos visto en la práctica anterior cómo se configura un servidor DNS paso a paso no voy a profundizar.

Lo que sí vamos a hacer es comprobar que todo funcione correctamente con `dig` y `nslookup`:

Primero con `dig` usamos el comando `dig @192.168.56.101 debian.luisdario.test`, y nos tendría que salir algo así:

![Captura de la comprobación con dig](./capturas/captura2.png)

Ahora con `nslookup` usamos el comando `nslookup debian.luisdario.test 192.168.56.101`, y nos tendría que salir algo así:

![Captura de la comprobación con nslookup](./capturas/captura3.png)


## 2. Usando un cliente GUI

Vamos a instalar y hacer una breve introducción a un cliente FTP con GUI (Graphical User Interface). En mi caso voy a utiliar FileZilla que es uno de los más usados actualmente, pero se puede escoger cualquier otro.

El primer paso sería instalar FileZilla desde su [página oficial](https://filezilla-project.org/). Una vez instalado al ejecutarlo nos encontramos una interfaz como la siguiente:

![Captura de la interfaz de FileZilla](./capturas/captura4.png)

Vamos ahora a crear un directorio y entramos en él. Lo vamos a llamar `pruebasFTP`.

![Captura de cómo creamos un directorio y entramos en él](./capturas/captura5.png)

Vamos a crear un fichero de prueba con el contenido que queramos.

![Captura de la carpeta que acabos de crear con un fichero que acabamos de crear dentro](./capturas/captura6.png)

Continuemos conectandonos a `ftp.cica.es` de forma anónima. Para ello ponemos la ruta en el campo Servidor dentro de FileZilla y hacemos clic en 'Conexión rápida'. Vamos ahora dentro de la carpeta `pub` y ahí encontraremos un fichero llamado `check`. Lo descargamos haciendo clic derecho y 'Descargar'.

![Captura de cómo conectarnos a ftp.cica.es de forma anónima y nos descargamos un fichero](./capturas/captura7.png)

Ahora en nuestra carpeta podemos ver que se ha descargado correctamente.

![Captura del fichero que acabamos de descargar](./capturas/captura8.png)

Vamos ahora a tratar de subir el archivo que creamos anteriormente, para ello hacemos clic derecho y pinchamos en 'Subir'. Sin embargo podemos ver que el servidor nos responde con permiso denegado debído a las políticas establecidas en el servidor.

![Captura de cómo subir un fichero y la respuesta negativa del servidor](./capturas/captura9.png)

Para desconectarnos hacemos clic en la barra de arriba donde hay un icono de un ordenador y una cruz roja.

![Captura de cómo desconectarnos de un servidor](./capturas/captura10.png)


## 3. Instalación de vsftpd

Vamos a instalar el servicio de FTP en nuestra máquina virtual con vsftpd, para ello ejecutamos el comando