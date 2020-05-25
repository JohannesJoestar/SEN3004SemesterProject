INSERT INTO 
patient(id, tid, name, surname, date_birth, date_symptom, primary_symptom) 
VALUES (
    1,
    97205969546, 
    'Serdar', 
    'Al', 
    parsedatetime('27-11-1998', 'dd-MM-yyyy'),
    parsedatetime('18-05-2020', 'dd-MM-yyyy')
);
INSERT INTO 
patient(id, tid, name, surname, date_birth, date_symptom, primary_symptom) 
VALUES (
    2,
    55446292052, 
    'Kaan', 
    'Biter', 
    parsedatetime('07-01-1998', 'dd-MM-yyyy'),
    parsedatetime('18-05-2020', 'dd-MM-yyyy')
);

INSERT INTO symptom(id, key) VALUES (1, "fever");
INSERT INTO symptom(id, key) VALUES (2, "dry_cough");
INSERT INTO symptom(id, key) VALUES (3, "tiredness");
INSERT INTO symptom(id, key) VALUES (4, "diarrhoea");
INSERT INTO symptom(id, key) VALUES (5, "cant_breathe");
INSERT INTO symptom(id, key) VALUES (6, "taste_sense_loss");
INSERT INTO symptom(id, key) VALUES (7, "chest_pain");

INSERT INTO patient_symptom(pid, sid) VALUES (1, 4);
INSERT INTO patient_symptom(pid, sid) VALUES (1, 7);
INSERT INTO patient_symptom(pid, sid) VALUES (1, 2);
INSERT INTO patient_symptom(pid, sid) VALUES (1, 6);
INSERT INTO patient_symptom(pid, sid) VALUES (2, 5);
INSERT INTO patient_symptom(pid, sid) VALUES (2, 4);