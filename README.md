# Hospital Database Management System

* http://hospitaldata.in

## Features

* Users should be able to view all the departments in the hospital

### Feature 1: List departments
```sql
create table departments(
  department_id number primary key,
  department_name varchar2(50) not null
  );
``` 
Query:
```sql
  select * from departments;
```
