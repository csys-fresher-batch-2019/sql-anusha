# ABC Hospital Database Management System

* http://abchospitaldata.in

## Features

* Users should be able to view all the departments in the hospital.
* users can view their own details. 

### Feature 1: List departments and doctors
```sql
create table departments(
  department_id number primary key,
  department_name varchar2(50) not null,
  constraint department_name_uq unique (department_name)
  );
  
create table doctors(
  employee_id number primary key,
  doc_name varchar2(50) not null,
  department_id number not null,
  foreign key (department_id) references departments(department_id) ,
   constraint doc_name_uq unique (doc_name)
  );
``` 
Query:
```sql
  select * from departments;
  select * from doctors;
```
### Feature 2: Patient Details
```sql
create table patient(
    patient_id number primary key,
    patient_name varchar2(50) not null,
    age number not null,
    weight number not null,
    gender char not null,
    address varchar2(150)not null,
    phone_number number not null,
    disease varchar2(50),
    doctor_id number not null,
    patient_type varchar2(5) not null,
    constraint age_ck check(age>=0),
    constraint gender_ck check(gender in ('M','F')),
    constraint patient_type_ck check(patient_type in ('IN','OUT'))
);
```
Query:
```sql
  select * from patient;
```
