-- Erstellen der Tabelle 'employee'
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,   -- automatically generates a unique integer for each new row inserted into the table, schlüssel;
    firstname VARCHAR(255),           -- define variable-length character string column. The (255) specifies the maximum number of characters (or bytes, depending on the database system) that the column can hold.
    lastname VARCHAR(255),
    main_location VARCHAR(255)
);

-- Erstellen der Tabelle 'project'
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    main_location VARCHAR(255)
);

-- Erstellen der Tabelle 'working' mit Fremdschlüssel-Referenzen
CREATE TABLE working (
    employee_id INTEGER REFERENCES employee(employee_id),  -- das sind die fremdschlüssel von den employee und project table
    project_id INTEGER REFERENCES project(project_id),
    start_date TIMESTAMP, -- oder DATE
    PRIMARY KEY (employee_id, project_id) -- oder CONSTRAINT pk_working PRIMARY KEY(employee_id, project_id)
);
