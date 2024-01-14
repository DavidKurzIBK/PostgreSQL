-- Einfügen von Erika Mustermann in die Tabelle 'employee'
INSERT INTO employee (firstname, lastname, main_location) VALUES ('Erika', 'Mustermann', 'Innsbruck');

-- Einfügen von zwei weiteren Mitarbeitern
INSERT INTO employee (firstname, lastname, main_location) VALUES 
    ('Max', 'Muster', 'Wien'),
    ('Anna', 'Beispiel', 'Graz');

-- Einfügen von project2 in die Tabelle 'project'
INSERT INTO project (name, main_location) VALUES ('project2', 'Innsbruck');

-- Einfügen von zwei weiteren Projekten
INSERT INTO project (name, main_location) VALUES 
    ('project3', 'Wien'),
    ('project4', 'Graz');

--select * from employee; 
--select * from project; 
