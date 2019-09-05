--3
SELECT DISTINCT make_title FROM car_models;

--4
SELECT DISTINCT model_title FROM car_models
WHERE make_code = 'VOLKS';

--5
SELECT make_code, model_code, model_title, year FROM car_models
WHERE make_code = 'LAM';

--6
SELECT * FROM car_models
WHERE year BETWEEN 2010 AND 2015;

