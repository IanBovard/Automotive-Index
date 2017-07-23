\c radlad;

DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;

CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;

\i scripts/car_models.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;

SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';
--First : 28.226ms
SELECT make_title FROM car_models WHERE make_code ='LAM';
--First : 67.041ms Second : 93.598ms
SELECT DISTINCT model_title FROM car_models WHERE make_code ='NISSAN' AND model_code = 'GT-R';