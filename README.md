# Parcial N° 2 - Electiva II: datos

Este proyecto busca el entendimiento de SQL Server Integration Services (SSIS) mediante el uso de dos bases de datos que pueden contener información similar y agruparla en una nueva base de datos.

## Objetivo

Categorizar los datos de las diferentes fuentes permitiendo identificar el origen de los mismos en cualquier punto de tiempo.

## Fuentes de datos

Los datos provienen de los ejemplos de Microsoft para el entendimiento de su base de datos. Estos datos son los siguientes

- [Northwind](https://github.com/Microsoft/sql-server-samples/tree/master/samples/databases/northwind-pubs) el archivo `instnwnd.sql`.
- [AdventureWorks2014](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms) en su versión ligera.

## Proceso

1. Importar datos
2. Crear un nuevo modelo que resuma los datos
3. Identificar el lugar de donde provienen los datos (columnas suplentes)
4. Limpiar los datos
5. Exportar los datos de las fuentes origen al modelo destino

## Focalización

Dentro del análisis de los dos modelos se encontró que las siguientes entidades comparten información similar.

| Modelo     | Northwind             | AdventureWorks              |
| ---------- | --------------------- | --------------------------- |
| Categorias | Categories            | ProductCategory             |
| Clientes   | Custommers            | Customer \| Address         |
| Productos  | Products              | Product                     |
| Ordenes    | Orders \| OrderDetail | OrdersHeader \| OrderDetail |

## Identificadores auxiliares

Los identificadores auxiliares son un identificador único, nombre de la base de datos de origen y el identificador que tiene.

## Alternativas

Se visualiza el Error Log, pero no es obligatorio
