# 🗺️ PostGIS Spatial Database Implementation

## 📌 Description
This project demonstrates the full implementation of a spatial database using PostgreSQL and PostGIS. It includes spatial data import, table creation, relationship management, and optimization techniques.

## 🧠 Objective
To build a functional spatial database integrating geographic and tabular data, ensuring data integrity and enabling spatial analysis.

## ⚙️ Workflow

- Activation of the PostGIS extension  
- Import of spatial data using `ogr2ogr`  
- Creation of tables and relationships  
- Import of CSV data using `COPY`  
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

The repository includes sample datasets used for database population:

- CSV files for tabular data (users, routes, points, reviews)  
- Spatial dataset in GeoPackage format (natural areas)  

These datasets allow full reproducibility of the database implementation.

## 🔍 Additional SQL Analysis

This project also includes additional SQL queries focused on spatial and statistical analysis using PostGIS.

- Air quality filtering (O3 levels)  
- Meteorological averages per station  
- Daily temperature aggregation  
- Spatial relationships using `ST_Contains`  
- Precipitation analysis by region  

[View additional queries](sql_queries_analysis.pdf)

## 👤 Author

Ronald Álvarez Vaca


