-- Einfügen von Arbeitsbeziehungen zwischen Mitarbeitern und Projekten
-- Hierbei nehmen wir an, dass Erika Mustermann am Projekt project2 arbeitet, 
INSERT INTO working (employee_id, project_id, start_date) VALUES
    ((SELECT employee_id FROM employee WHERE firstname = 'Erika' AND lastname = 'Mustermann' LIMIT 1), 
     (SELECT project_id FROM project WHERE name = 'project2' LIMIT 1), '2021-11-11'); --oder DATE('2021-11-11')


-- LIMIT 1 ensures that only one result is returned even if there might be multiple employees with the same name.