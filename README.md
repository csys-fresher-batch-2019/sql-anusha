# ABC Hospital Database Management System

* http://abchospitaldata.in

## Features

* Users should be able to view all the departments in the hospital

### Feature 1: List departments
```sql
create table departments(
  department_id number primary key,
  department_name varchar2(50) not null unique
  );
  
create table doctors(
  employee_id number primary key,
  doc_name varchar2(50) not null unique,
  department_name varchar2(50),
  foreign key (department_name) references departments(department_name)  
  );
``` 
Query:
```sql
  select * from departments;
```
