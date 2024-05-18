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

## Temario

1. Arquitectura SQLServer
2. Creacion de bases de datos y tipos de datos
3. Creación de restricciones
4. Definiendo la integridad de los datos
5. Base de datos
6. Lenguaje Transact SQL
7. Consultas de manipulación de datos (SELECT, INSERT, UPDATE, DELETE)
8. Consultas condicionales (FROM, WHERE, GROUP BY, HAVING, ORDER)
9. Oeradores lógicos (AND, OR, NOT, IN, LIKE, BETWEEN, etc)
10. Funciones de agregación (COUNT, MAX, MIN, SUM, AVG)
11. Funciones de tipo fecha (DATEADD, DATEDIFF, etc)
12. Consultas multitabla INNER JOIN
13. Consultas LEFT JOIN
14. Consultas RIGHT JOIN
15. Consultas FULL OUTER JOIN
16. Manejo de operadores de conjunto (UNION, INTERSECT, EXCEPT)
17. Tablas temporales
18. Subconsultas y sus tipos
19. Modificación de tipo de variable (CAST, CONVERT, FORMAT, PARSE)
20. Carga de archivos txt
21. Carga de archivos Excel
22. Automatizar la carga masiva
23. Concepto y tipos de Funciones
24. Creación, ejecución y eliminación de Funciones
25. Creación de vistas
26. Eliminación y modificación de vistas
27. Procedimientos almacenados y disparadores
28. Concepto y tipos de procedimientos almacenados
29. Creación, ejecución y eliminación de procedimientos almacenados y disparadores en SQL
30. Disparadores en SQL

## Recursos

Utilizaremos para el desarrollo, la base de datos ejemplo Northwind, una tienda de productos ficticia. Para la implementación ejecutaremos el fichero `northwind.sql` en nuestro `SQLServer Management Studio`

## Explorando SQLServer

|Componentes            |           SQLServer     |
|:---------------------:|:-----------------------:|
|Motor de base de datos |Analysis Services        |
|Integration Services   |Reporting Services       |
|Master Data Services   |Data Quality Services    |
|StreamInsight          |Full-text Search         |
|Replication            |PowerPivot               |
|PowerView              |Polybase                 |
|Machine Learning Services (R, Python)            |
