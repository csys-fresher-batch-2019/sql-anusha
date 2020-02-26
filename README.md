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
  active_departments number default 1,
  constraint department_name_uq unique (department_name)
  );
  create sequence department_id_sq start with 1 increment by 1;
  
  create table doctors(
    doctor_id number primary key,
    doctor_name varchar2(50) not null,
    department_id number not null, 
    doctor_password varchar2(15) not null,
    active_doctors number default 1,
    doctor_presence number default 1,
    d_phone_number varchar2(10) not null,
    d_gender char not null,
    no_of_appointments number default 0,
    constraint d_gender_ck check(d_gender in ('M','F')),
    constraint phone_number_uq unique (d_phone_number),
    foreign key (department_id) references departments(department_id) 
  );
  create sequence doctor_id_sq start with 1 increment by 1;

``` 
Query:
```sql
  select * from departments;
  select * from doctors;
```

## Table 1 : Departments

| 1  | Cardiology       | 1 |
|----|------------------|---|
| 2  | Dermatology      | 1 |
| 3  | Pediatrician     | 1 |
| 4  | General Medicine | 1 |
| 5  | ENT              | 1 |
| 6  | Dental           | 1 |
| 7  | Neurology        | 1 |
| 21 | Opthalmology     | 1 |

## Table 2 : Doctors

| Doctor Id | Doctor Name | Department Id | Doctor Password | Active Status | Doctor Presence | Phone Number | Gender | No of Appointments |
|:---------:|:-----------:|:-------------:|:---------------:|:-------------:|:---------------:|:------------:|:------:|:------------------:|
|     1     |    Sruthi   |       1       |       123       |       0       |        1        |  9876543210  |    F   |          0         |
|     21    |    Megala   |       2       |       123       |       1       |        1        |  8765432109  |    F   |          2         |
|     41    |   Swaathi   |       3       |       123       |       1       |        1        |  7654321098  |    F   |          0         |
|     81    |    Aakash   |       4       |       123       |       1       |        1        |  6543210987  |    F   |          2         |
|     82    |     Bavi    |       5       |       123       |       1       |        1        |  9999999999  |    F   |          0         |
|     83    |   Krithika  |       6       |       123       |       1       |        1        |  8888888888  |    F   |          0         |
|     84    |    Meera    |       7       |       123       |       1       |        1        |  7777777777  |    F   |          0         |
|     85    |   Dharsini  |       1       |       123       |       1       |        1        |  6666666666  |    F   |          0         |

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

## Table 3 : Patient
| PATIENT_ID | PATIENT_NAME | AGE | WEIGHT | GENDER | ADDRESS               | PHONE_NUMBER | DISEASE          | DOCTOR_ID | ENTRY_DATE | PATIENT_TYPE |
|------------|--------------|-----|--------|--------|-----------------------|--------------|------------------|-----------|------------|--------------|
| 1          | z            | 34  | 54     | F      | jksg12yu              | 9182656261   | ALLERGY          | 4         | 01-JAN-20  | IN           |
| 2          | y            | 27  | 75     | M      | nfbh ruyf7            | 3648573489   | GENERAL CHECK-UP | 9         | 02-JAN-20  | OUT          |
| 3          | x            | 10  | 38     | M      | jkrh wguitj4hh        | 2768756868   | TOOTH ACHE       | 6         | 01-JAN-20  | OUT          |
| 4          | w            | 3   | 10     | M      | jehtu irgfuruih       | 9858876451   | FEVER            | 8         | 01-JAN-20  | IN           |
| 5          | v            | 60  | 79     | M      | h8945ty7 845yhgui45hv | 9754873675   | CARDIAC ARREST   | 10        | 01-JAN-20  | IN           |
| 6          | u            | 19  | 44     | F      | uc4t78 4gjkbtc85      | 823697765    | HEAD ACHE        | 3         | 01-JAN-20  | OUT          |
| 7          | t            | 33  | 77     | F      | hx43gr7 cg34ug        | 9768854783   | CAVITY           | 6         | 01-JAN-20  | OUT          |
| 8          | s            | 22  | 55     | M      | 4837ucb               | 6756478657   | HEARING LOSS     | 5         | 01-JAN-20  | OUT          |
| 9          | r            | 98  | 70     | F      | c84b5u8 bg45u         | 3847567867   | COMMON COLD      | 1         | 01-JAN-20  | OUT          |
| 10         | q            | 45  | 68     | M      | h8t2c45 ucbutg2i      | 834564657    | ATHEROSCLEROSIS  | 2         | 01-JAN-20  | IN           |

### Feature 3:Lab

create table lab_t(
    lab_no number primary key,
    patient_id number not null,
    amount number not null,
    result_date date not null,
    results varchar2(5000) not null,
    foreign key (patient_id) references patient(patient_id)
);

## Table 5 : Lab

| LAB_NO | PATIENT_ID | AMOUNT | RESULT_DATE | RESULTS |
|--------|------------|--------|-------------|---------|
| 1      | 1          | 90     | 02-JAN-20   | fdtyfh  |
| 2      | 3          | 150    | 01-JAN-20   | mjgjfyu |
| 3      | 5          | 420    | 30-DEC-19   | csvcx   |
| 4      | 2          | 99     | 28-DEC-19   | jgddddd |

### Feature 4: Fix Appointment
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

## Table 4 : Appointment
|APPOINTMENT_ID|	PATIENT_ID	|PURPOSE	DOCTOR_ID|	S_TIME	                    |           E_TIME           |
|--------------|--------------|------------------|------------------------------|----------------------------|
|1	           |2	            | hefbj	 9	       | 03-JAN-20 02.39.17.000000 AM	|03-JAN-20 02.59.27.000000 AM|
|2	           |3	            | hefbj	 6	       | 03-JAN-20 02.39.17.000000 AM	|03-JAN-20 02.59.27.000000 AM|

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

## Table 6 : Nurse

|NURSE_ID	|NURSE_NAME	|N_POSITION        |
|---------|-----------|------------------|
|1	      |q	        |HEAD OF DEPARTMENT|
|2        |w          |NURSE             |
|3	      |e	        |NURSE             |
|4	      |r	        |NURSE             |
|5	      |t	        |NURSE             |

## Table 7 : Rooms

| ROOM_ID | NURSE_ID | PATIENT_ID |
|---------|----------|------------|
| 1       | 1        | 1          |
| 2       | 2        | 4          |
| 3       | 3        | 5          |
| 4       | 4        | 10         |
| 5       | 5        |  -         |
| 6       | 6        |  -         |
| 7       | 7        |  -         |
| 8       | 8        |  -         |
| 9       | 9        |  -         |
| 10      | 10       |  -         |

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

update bills set pending_amount=total_amount-amount_paid;
update bills set status ='PAID' where total_amount=amount_paid;

```
Query :
```sql
select * from bills;
```

## Table 8 : Bills

| BILL_NO | PATIENT_ID | TOTAL_AMOUNT | AMOUNT_PAID | PENDING_AMOUNT | BILL_DATE | STATUS |
|---------|------------|--------------|-------------|----------------|-----------|--------|
| 1       | 2          | 3234         | 543         | 2691           | 03-JAN-20 | UNPAID |
| 2       | 4          | 1200         | 1200        | 0              | 03-JAN-20 | PAID   |
| 3       | 6          | 3670         | 2734        | 936            | 03-JAN-20 | UNPAID |
| 4       | 7          | 7653         | 5443        | 2210           | 03-JAN-20 | UNPAID |
| 5       | 9          | 3234         | 3234        | 0              | 03-JAN-20 | PAID   |
| 6       | 1          | 8942         | 8942        | 0              | 03-JAN-20 | PAID   |
| 7       | 3          | 8978         | 543         | 8435           | 03-JAN-20 | UNPAID |
| 8       | 5          | 75341        | 75341       | 0              | 03-JAN-20 | PAID   |
| 9       | 10         | 8637         | 5632        | 3005           | 03-JAN-20 | UNPAID |
| 10      | 8          | 6532         | 6532        | 0              | 03-JAN-20 | PAID   |


### Feature 6: Head of Department
```sql
select * from doctors where d_position = 'HEAD OF DEPARTMENT';
```

| DOCTOR_ID | DOCTOR_NAME | DEPARTMENT_ID | D_POSITION         |
|-----------|-------------|---------------|--------------------|
| 1         | a           | 4             | HEAD OF DEPARTMENT |
| 2         | b           | 1             | HEAD OF DEPARTMENT |
| 4         | d           | 2             | HEAD OF DEPARTMENT |
| 5         | e           | 5             | HEAD OF DEPARTMENT |
| 6         | f           | 6             | HEAD OF DEPARTMENT |
| 8         | h           | 3             | HEAD OF DEPARTMENT |

### Feature 7: Head nurse
```sql
select * from nurse_t where n_position = 'HEAD OF DEPARTMENT';
```

| NURSE_ID | NURSE_NAME | N_POSITION         |
|----------|------------|--------------------|
| 1        | q          | HEAD OF DEPARTMENT |

### Feature 8: Patient who fixed an appointment
```sql
select p.patient_name from patient p join appointment a on p.patient_id = a.patient_id; 
```

| PATIENT_NAME |
|--------------|
| y            |
| x            |

### Feature 9: Available Rooms
```sql
select count(*) from rooms where patient_id is null;
```

| COUNT()  |
|----------|
| 6        |

### Feature 10: Doctors and their departments 
```sql
select d.doctor_name, s.department_name from doctors d join departments s on d.department_id = s.department_id;
```

| DOCTOR_NAME | DEPARTMENT_NAME  |
|-------------|------------------|
| a           | General Medicine |
| b           | Cardiology       |
| c           | General Medicine |
| d           | Dermatology      |
| e           | ENT              |
| f           | Dental           |
| g           | Dental           |
| h           | Pediatrician     |
| i           | General Medicine |
| j           | Cardiology       |

### Feature 11: Doctors of department ID 4
```sql
select doctor_name from doctors where department_id = 4;
```

| DOCTOR_NAME |
|-------------|
| a           |
| c           |
| i           |

### Feature 12: Patient and their Doctor
```sql
select p.patient_name, d.doctor_name from patient p join doctors d on p.doctor_id = d.doctor_id;
```

| PATIENT_NAME | DOCTOR_NAME |
|--------------|-------------|
| r            | a           |
| q            | b           |
| u            | c           |
| z            | d           |
| s            | e           |
| x            | f           |
| t            | f           |
| w            | h           |
| y            | i           |
| v            | j           |

### Feature 13: Room of a Patient
```sql
select p.patient_name ,r.room_id from patient p join rooms r on p.patient_id =r.patient_id;
```

| PATIENT_NAME | ROOM_ID |
|--------------|---------|
| z            | 1       |
| w            | 2       |
| v            | 3       |
| q            | 4       |

### Feature 14: Payment detail of patient id 3
```sql
select * from bills where patient_id=3;
```

| BILL_NO | PATIENT_ID | TOTAL_AMOUNT | AMOUNT_PAID | PENDING_AMOUNT | BILL_DATE | STATUS |
|---------|------------|--------------|-------------|----------------|-----------|--------|
| 7       | 3          | 8978         | 543         | 8435           | 03-JAN-20 | UNPAID |
