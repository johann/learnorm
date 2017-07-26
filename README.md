CREATE TABLE doctors (
  id INTEGER PRIMARY KEY,
  name TEXT,
  speciality TEXT
);
CREATE TABLE patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  condition TEXT
);

CREATE TABLE appointments (
  id INTEGER PRIMARY KEY,
  doctor_id INTEGER,
  patient_id INTEGER
);

INSERT INTO doctors (name, speciality)
VALUES ("LINDSEY", "EAR");


SELECT * FROM doctors




# GIVE ME ALL THE DOCTORS BELONGING TO PATIENT ID 1
# | Johann | Lindsey|
# | Johann | Alex |


SELECT patients.name, doctors.name
FROM patients
INNER JOIN appointments
ON patients.id = appointments.patient_id
INNER JOIN doctors
ON doctors.id = appointments.doctor_id
WHERE patients.id = 1
