--7
CREATE TABLE IF NOT EXISTS car_makers (
    make_code VARCHAR(255) PRIMARY KEY,
    make_title VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS car_models_normalized (
    make_code VARCHAR(255) REFERENCES car_makers(make_code),
    model_code VARCHAR (255) NOT NULL,
    model_title VARCHAR (255) NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY (make_code, model_code, year)
);

--8
INSERT INTO car_makers (make_code, make_title)
    SELECT DISTINCT make_code, make_title
    FROM car_models;

INSERT INTO car_models_normalized (model_code, model_title, make_code, year)
    SELECT model_code, model_title, year
    FROM car_models;

--9
SELECT DISTINCT make_title
    FROM car_models_normalized;

--10
SELECT DISTINCT model_title
    FROM car_models_normalized
    WHERE make_code = 'VOLKS';

--11
SELECT DISTINCT make_code, model_code, model_title, year
    FROM car_models_normalized
    WHERE make_code = 'LAM';

--12
SELECT * FROM car_models_normalized
    WHERE year BETWEEN 2010 AND 2015;