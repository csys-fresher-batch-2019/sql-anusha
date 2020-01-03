# ABC Hospital Database Management System

* http://abchospitaldata.in

## Features

* Users should be able to view all the departments in the hospital.
* Users can view their own details. 

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
### Feature 3: Fix Appointment
```sql
create table appointment(
    appointment_id number primary key,
    patient_id number not null,
    purpose varchar2(50) not null,
    doctor_id number not null,
    s_time timestamp default sysdate not null,
    e_time timestamp default sysdate +0.0140 
);
```
Query:
```sql
select * from appointment;
```
### Feature 4: Room Details
```sql
create table lab_t(
    lab_no number primary key,
    patient_id number not null,
    amount number not null,
    result_date date not null,
    results varchar2(5000) not null,
    foreign key (patient_id) references patient(patient_id)
);

create table nurse_t(
    nurse_id number primary key,
    nurse_name varchar2(50) not null,
    n_position varchar2(25) default 'NURSE' not null
    constraint n_position_ck check (n_position in ('NURSE', 'HEAD OF DEPARTMENT'))
);
```
Query:
```sql
select * from nurse_t;

select * from rooms;
```
### Feature 5: Payments
```sql
create table bills(
    bill_no number primary key,
    patient_id number not null,
    total_amount number not null,
    amount_paid number,
    pending_amount number,
    bill_date date default sysdate not null,
    status varchar2(10)default 'UNPAID' not null,
    foreign key (patient_id) references patient(patient_id),
    constraint status_ck check (status in ('PAID','UNPAID'))
);
```
Query :
```sql
select * from bills;
```
### Feature 6: Head of Department
```sql
select * from doctors where d_position = 'HEAD OF DEPARTMENT';
```
select * from nurse_t where n_position = 'HEAD OF DEPARTMENT';

select p.patient_name from patient p join appointment a on p.patient_id = a.patient_id; 

select count(*) from rooms where patient_id is null;

select d.doctor_name, s.department_name from doctors d join departments s on d.department_id = s.department_id;

select doctor_name from doctors where department_id = 4;
select p.patient_name, d.doctor_name from patient p join doctors d on p.doctor_id = d.doctor_id;
select p.patient_name ,r.room_id from patient p join rooms r on p.patient_id =r.patient_id;
select * from bills where patient_id=3;

