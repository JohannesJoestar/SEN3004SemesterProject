CREATE TABLE patient(
    id IDENTITY PRIMARY KEY,
    tid BIGINT UNIQUE,
    name VARCHAR(255),
    surname VARCHAR(255),
    date_birth DATE,
    date_symptom DATE
);

CREATE TABLE symptom(
    id IDENTITY PRIMARY KEY,
    key VARCHAR(100) 
);

CREATE TABLE patient_symptom(
    pid BIGINT,
    sid BIGINT,
    FOREIGN KEY(pid) REFERENCES patient(id),
    FOREIGN KEY(sid) REFERENCES symptom(id)
);