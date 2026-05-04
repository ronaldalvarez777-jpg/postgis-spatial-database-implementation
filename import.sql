-- PostGIS Spatial Database Implementation
-- Author: Ronald Álvarez Vaca
-- Description: SQL script for creating tables, importing CSV data,
-- generating geometries and creating spatial indexes.

CREATE EXTENSION postgis;

-- =========================
-- TABLE CREATION
-- =========================

CREATE TABLE public.usuario (
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR(80),
  email VARCHAR(120),
  nivel VARCHAR(30)
);

CREATE TABLE public.ruta (
  id_ruta INT PRIMARY KEY,
  nombre VARCHAR(120),
  distancia_km DOUBLE PRECISION,
  desnivel_m INT,
  dificultad VARCHAR(30),
  id_zona INT
);

CREATE TABLE public.punto_ruta (
  id_punto INT PRIMARY KEY,
  nombre VARCHAR(120),
  tipo_punto VARCHAR(50),
  km DOUBLE PRECISION,
  id_ruta INT,
  geom geometry(Point,4326),
  lon DOUBLE PRECISION,
  lat DOUBLE PRECISION
);

CREATE TABLE public.resena (
  id_resena INT PRIMARY KEY,
  puntuacion INT,
  comentario VARCHAR(1000),
  fecha DATE,
  id_usuario INT,
  id_ruta INT
);

CREATE TABLE public.ruta_tipo (
  id_ruta INT,
  tipo VARCHAR(50),
  PRIMARY KEY (id_ruta, tipo)
);

-- =========================
-- FOREIGN KEYS
-- =========================

ALTER TABLE public.ruta
  ADD CONSTRAINT ruta_id_zona_fkey
  FOREIGN KEY (id_zona)
  REFERENCES public.zonas_naturales(gid);

ALTER TABLE public.punto_ruta
  ADD CONSTRAINT punto_ruta_id_ruta_fkey
  FOREIGN KEY (id_ruta)
  REFERENCES public.ruta(id_ruta);

ALTER TABLE public.resena
  ADD CONSTRAINT resena_id_usuario_fkey
  FOREIGN KEY (id_usuario)
  REFERENCES public.usuario(id_usuario);

ALTER TABLE public.resena
  ADD CONSTRAINT resena_id_ruta_fkey
  FOREIGN KEY (id_ruta)
  REFERENCES public.ruta(id_ruta);

ALTER TABLE public.ruta_tipo
  ADD CONSTRAINT ruta_tipo_id_ruta_fkey
  FOREIGN KEY (id_ruta)
  REFERENCES public.ruta(id_ruta);

-- =========================
-- SPATIAL DATA IMPORT (OGR2OGR)
-- =========================

-- Execute in OSGeo4W Shell (not in pgAdmin)
-- ogr2ogr -f "PostgreSQL" "PG:host=localhost port=5432 dbname=database user=postgres" \
-- "spatial_data/zonas_naturales.gpkg" \
-- -nln public.zonas_naturales -overwrite \
-- -lco GEOMETRY_NAME=geom -lco FID=gid \
-- -nlt PROMOTE_TO_MULTI

-- =========================
-- CSV DATA IMPORT
-- =========================

COPY public.usuario
FROM 'data/usuario.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.ruta
FROM 'data/ruta.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.punto_ruta (id_punto, nombre, tipo_punto, km, id_ruta, lon, lat)
FROM 'data/punto_ruta.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Generate geometry from coordinates
UPDATE public.punto_ruta
SET geom = ST_SetSRID(ST_MakePoint(lon, lat), 4326);

COPY public.resena
FROM 'data/resena.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- =========================
-- INDEXES
-- =========================

CREATE INDEX ruta_id_zona_idx ON public.ruta(id_zona);
CREATE INDEX punto_ruta_id_ruta_idx ON public.punto_ruta(id_ruta);
CREATE INDEX resena_id_usuario_idx ON public.resena(id_usuario);
CREATE INDEX resena_id_ruta_idx ON public.resena(id_ruta);

-- Spatial indexes
CREATE INDEX IF NOT EXISTS zonas_naturales_geom_gix
ON public.zonas_naturales
USING GIST (geom);

CREATE INDEX IF NOT EXISTS punto_ruta_geom_gix
ON public.punto_ruta
USING GIST (geom);
