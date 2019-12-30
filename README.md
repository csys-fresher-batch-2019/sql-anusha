# ABC Hospital Database Management System

* http://abchospitaldata.in

## Features

* Users should be able to view all the departments in the hospital

### Feature 1: List departments
```sql
create table departments(
  department_id number primary key,
  department_name varchar2(50) not null,
  constraint department_name_uq unique (department_name)
  );
  
create table doctors(
  employee_id number primary key,
  doc_name varchar2(50) not null,
  department_id number,
  foreign key (department_id) references departments(department_id) 
   constraint doc_name_uq unique (doc_name)
  );
``` 
Query:
```sql
  select * from departments;
  select * from doctors;
```
