CREATE DATABASE g1p1;

USE g1p1;

DROP TABLE employee_data;
DROP TABLE work_data;
DROP TABLE work_day;
DROP TABLE employee;
DROP TABLE supervisor;

CREATE TABLE employee_data (
  id INT,
  employee VARCHAR(255),
  supervisor VARCHAR(255),
  hire_date VARCHAR(255)
);

CREATE TABLE work_data (
  date VARCHAR(255),
  employee_id INT,
  employee VARCHAR(255),
  supervisor VARCHAR(255),
  total_edits BIGINT,
  edit_time BIGINT
);

CREATE TABLE supervisor (
  id INT NOT NULL IDENTITY(1,1),
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE employee (
  id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  hire_date VARCHAR(255) NOT NULL,
  id_supervisor INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_supervisor) REFERENCES supervisor(id)
);

CREATE TABLE work_day (
  id INT NOT NULL IDENTITY(1,1),
  date VARCHAR(255) NOT NULL,
  total_edits BIGINT NOT NULL,
  edit_time BIGINT NOT NULL,
  id_employee INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_employee) REFERENCES employee(id)
);
