# 🗺️ PostGIS Spatial Database Implementation

## 📌 Description
This project demonstrates the full implementation of a spatial database using PostgreSQL and PostGIS. It includes spatial data import, table creation, relationships, and optimization techniques.

*Este proyecto muestra la implementación completa de una base de datos espacial utilizando PostgreSQL y PostGIS.*

## 🧠 Objective
To build a functional spatial database integrating geographic and tabular data, ensuring data integrity and enabling spatial analysis.

## ⚙️ Workflow

- Activation of PostGIS extension
- Import of spatial data using `ogr2ogr`
- Creation of tables and relationships
- Data import from CSV using `COPY`
- Geometry generation using `ST_MakePoint`
- Creation of spatial indexes (GiST)
- Data validation using SQL queries

## 📄 Documentation

[View full report](postgis-spatial-database-report.pdf)

## 💻 SQL Implementation

[View SQL script](spatial_database_implementation.sql)
## 🧪 Technologies

- PostgreSQL
- PostGIS
- GDAL / ogr2ogr
- SQL
- QGIS

## 🚀 Results

A fully functional spatial database capable of managing routes, users, points of interest, and natural areas.

## 📁 Data

The repository includes sample data used for database population:

- CSV files for tabular data (usuarios, rutas, puntos, reseñas)
- Spatial dataset in GeoPackage format (zonas naturales)

These datasets allow full reproduction of the database implementation.

## 👤 Author

Ronald Álvarez Vaca
