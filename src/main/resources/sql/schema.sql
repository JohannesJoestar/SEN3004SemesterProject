CREATE TABLE patient(
    id IDENTITY PRIMARY KEY,
    tid BIGINT UNIQUE,
    name VARCHAR(255),
    surname VARCHAR(255),
    date_birth DATE,
    date_symptom DATE,
    primary_symptom VARCHAR(255)
);