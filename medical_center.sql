CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT,
    specialty TEXT,
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT,
    insurance TEXT,
    birthday TEXT,
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id FOREIGN KEY REFERENCES doctors,
    patient_id FOREIGN KEY REFERENCES patients,
    date TEXT,
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id FOREIGN KEY REFERENCES visits,
    disease_id FOREIGN KEY REFERENCES diseases,
    notes TEXT,
);
