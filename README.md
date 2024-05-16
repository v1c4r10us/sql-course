# SQLServer y MySQL

En este curso aprenderemos acerca de los 2 motores de base de datos relacionales más populares y más utilizados: `SQLServer` y `MySQL`

# Configuración preliminar

## SQLServer

Una vez instalado el motor de base de datos es necesario también tener instalado una herramienta que nos permita interactuar directamente con el motor, para este caso es recomendable el uso de `SQLServer Management Studio`. Asimismo con la instalación del motor viene incluido `SQLServer configuration manager`, una herramienta encargada de gestionar los servicios, puertos y acceso remoto hacia nuestro motor.

Inicialmente el motor se instala para acceder a él desde nuestra instancia local o `localhost`. Sin embargo a través de dicha herramienta podemos configurarlo para que se encuentre visible desde otro cliente en la red.

**`Habilitación de acceso remoto`**
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1CgWUcugHAoTe2rb7k9ybnriOFQDwEm7s" /></p>

**`Restart del servicio para aplicar los cambios`**
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1bDHb7soUUO4m-b8JkE3tn2WPGNiTyQwy" /></p>

## MySQL

Para este caso haremos uso de `MySQL Workbench` la herramienta de interacción nativa y mediante el siguiente commando haremos visible al motor dentro de la red:

```sql
ALTER USER 'root'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

<p align="center"><img src="https://drive.google.com/uc?export=view&id=1qcdeQvh5wirM0Kj77yCxcCnnG6d1stgz" /></p>

## DBeaver

Esta es una herramienta que permite conectarse a diferentes motores de base de datos a través de drivers descargables. Es gratuita en su versión community y esta disponible tanto para Windows, MacOS y Linux.

<p align="center"><img src="https://drive.google.com/uc?export=view&id=1b1awuk0ImfRZu30gicX3ugy55GVDP1d4"/></p>



