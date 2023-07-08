USE g1p1;

BULK INSERT employee_data
FROM 'C:\Users\Pablo\Dev\G1-P1\employee_data.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);

BULK INSERT work_data
FROM 'C:\Users\Pablo\Dev\G1-P1\work_data.csv'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);

INSERT INTO supervisor(name)
SELECT DISTINCT d.supervisor FROM employee_data d
WHERE d.supervisor IS NOT NULL;

INSERT INTO employee(id, name, hire_date, id_supervisor)
SELECT DISTINCT d.id, d.employee, d.hire_date, s.id FROM employee_data d
INNER JOIN supervisor s ON s.name = d.supervisor;

INSERT INTO work_day(date, total_edits, edit_time, id_employee)
SELECT DISTINCT d.date, d.total_edits, d.edit_time, d.employee_id FROM work_data d;

