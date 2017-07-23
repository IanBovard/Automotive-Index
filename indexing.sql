\c radlad;

DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;

CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;

DROP TABLE IF EXISTS car_models;
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

CREATE INDEX make_code_idx ON car_models (make_code);
CREATE INDEX make_title_idx ON car_models (make_title);
CREATE INDEX model_code_idx ON car_models (model_code);
CREATE INDEX model_title_idx ON car_models (model_title);
CREATE INDEX year_idx ON car_models (year);

SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';
--Non-Indexed : 31.511ms, Indexed : 1.233ms
SELECT DISTINCT model_title FROM car_models WHERE make_code ='NISSAN' AND model_code = 'GT-R';
--Non-Indexed : 28.715ms, Indexed : 1.356ms
SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';
--Non-Indexed: 32.663ms, Indexed : 1.597ms
SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
--Non-Indexed : 95.356ms, Indexed : 90.916ms
SELECT * FROM car_models WHERE year = 2010;
--Non-Indexed : 38.799ms, Indexed : 12.079ms

