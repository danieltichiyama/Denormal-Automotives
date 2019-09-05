--CATCH

DROP TABLE IF EXISTS car_models_normalized;

DROP TABLE IF EXISTS car_makers;

--7
CREATE TABLE IF NOT EXISTS car_makers (
    make_code VARCHAR(255) PRIMARY KEY,
    make_title VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS car_models_normalized (
    make_code_id VARCHAR(255) NOT NULL,
    model_code VARCHAR (255) NOT NULL,
    model_title VARCHAR (255) NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY (make_code_id, model_code, year)
);

--8
INSERT INTO car_makers (make_code, make_title)
    SELECT DISTINCT make_code, make_title
    FROM car_models;

INSERT INTO car_models_normalized (model_code, model_title, make_code_id, year)
    SELECT model_code, model_title, make_code, year
    FROM car_models;

ALTER TABLE car_models_normalized
    ADD CONSTRAINT foreign_key FOREIGN KEY (make_code_id)
        REFERENCES car_makers(make_code);

--9
SELECT DISTINCT make_title
    FROM car_models_normalized
    INNER JOIN car_makers ON car_models_normalized.make_code_id = car_makers.make_code;

--10
SELECT DISTINCT model_title
    FROM car_models_normalized
    WHERE make_code_id = 'VOLKS';

--11
SELECT DISTINCT make_code_id AS make_code, model_code, model_title, year
    FROM car_models_normalized
    WHERE make_code_id = 'LAM';

-- 12
SELECT * FROM car_models_normalized
    INNER JOIN car_makers ON car_models_normalized.make_code_id=car_makers.make_code
    WHERE year BETWEEN 2010 AND 2015;