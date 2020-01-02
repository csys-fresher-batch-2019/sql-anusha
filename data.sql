drop table rooms;
drop table bills;
drop table nurse;
drop table appointment; 
drop table lab;
drop table patient;
drop table doctors;
drop table departments;
create table departments(
  department_id number primary key,
  department_name varchar2(50) not null,
  constraint department_name_uq unique (department_name)
  );
  
create table doctors(
  doctor_id number primary key,
  doctor_name varchar2(50) not null,
  department_id number not null,
  foreign key (department_id) references departments(department_id) ,
  constraint doc_name_uq unique (doctor_name)
  );
  
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
    entry_date date default SYSDATE,
    patient_type varchar2(5) not null,
    constraint gender_ck check(gender in ('M','F')),
    constraint patient_type_ck check(patient_type in ('IN','OUT'))
);

create table appointment(
    appointment_id number primary key,
    patient_id number not null,
    purpose varchar2(50) not null,
    doctor_id number not null,
    s_time timestamp default sysdate not null,
    e_time timestamp default sysdate +0.0140 
);

create table lab(
    lab_no number primary key,
    patient_id number not null,
    amount number not null,
    result_date date not null,
    results varchar2(5000) not null,
    foreign key (patient_id) references patient(patient_id)
);

create table nurse(
    nurse_id number primary key,
    nurse_name varchar2(50) not null
);

create table rooms(
    room_id number primary key,
    nurse_id number not null,
    patient_id number,--need not b not null
    foreign key (patient_id) references patient(patient_id)
);

create table bills(
    bill_no number primary key,
    patient_id number not null,
    total_amount number not null,
    amount_paid number,
    pending_amount number,
    bill_date date default sysdate not null,
    insurance number,
    foreign key (patient_id) references patient(patient_id)
);

insert into departments (department_id,department_name)values (1,'Cardiology');

insert into departments (department_id,department_name)values (2,'Dermatology');

insert into departments (department_id,department_name)values (3,'Pediatrician');

insert into departments (department_id,department_name)values (4,'General Medicine');

insert into departments (department_id,department_name)values (5,'ENT');

insert into departments (department_id,department_name)values (6,'Dental');
 
insert into doctors (doctor_id,doctor_name,department_id) values(1,'a',4);

insert into doctors (doctor_id,doctor_name,department_id) values(2,'b',1);

insert into doctors (doctor_id,doctor_name,department_id) values(3,'c',4);

insert into doctors (doctor_id,doctor_name,department_id) values(4,'d',2);

insert into doctors (doctor_id,doctor_name,department_id) values(5,'e',5);

insert into doctors (doctor_id,doctor_name,department_id) values(6,'f',6);

insert into doctors (doctor_id,doctor_name,department_id) values(7,'g',6);

insert into doctors (doctor_id,doctor_name,department_id) values(8,'h',3);

insert into doctors (doctor_id,doctor_name,department_id) values(9,'i',4);

insert into doctors (doctor_id,doctor_name,department_id) values(10,'j',1);

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (1, 'z', 34, 54, 'jksg12yu', 9182656261,  'F', 'ALLERGY', 4, 'IN', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (2, 'y', 27, 75, 'nfbh ruyf7', 3648573489, 'M', 'GENERAL CHECK-UP', 9, 'OUT', to_date('02/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (3, 'x', 10, 38, 'jkrh wguitj4hh', 2768756868, 'M', 'TOOTH ACHE', 6, 'OUT', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (4, 'w', 03, 10, 'jehtu irgfuruih', 9858876451, 'M', 'FEVER', 8, 'IN', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (5, 'v', 60, 79, 'h8945ty7 845yhgui45hv', 9754873675, 'M', 'CARDIAC ARREST', 10, 'IN', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (6, 'u', 19, 44, 'uc4t78 4gjkbtc85', 0823697765, 'F', 'HEAD ACHE', 3, 'OUT', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (7, 't', 33, 77, 'hx43gr7 cg34ug', 9768854783, 'F', 'CAVITY', 6, 'OUT', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (8, 's', 22, 55, '4837ucb', 6756478657, 'M', 'HEARING LOSS', 5, 'OUT', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (9, 'r', 98, 70, 'c84b5u8 bg45u', 3847567867, 'F', 'COMMON COLD', 1, 'OUT', to_date('01/01/2020','dd/MM/yyyy'));

insert into patient (patient_id, patient_name, age, weight, address, phone_number, gender, disease, doctor_id, patient_type, entry_date) 
values (10, 'q', 45, 68, 'h8t2c45 ucbutg2i', 0834564657, 'M', 'ATHEROSCLEROSIS', 2, 'IN', to_date('01/01/2020','dd/MM/yyyy'));

insert into appointment(appointment_id, patient_id, purpose, doctor_id) values (1, 1, 'hefbj', 4);
 
insert into lab (lab_no, patient_id, amount, result_date, results) values (1, 1, 90, to_date('02/01/2020','dd/MM/yyyy'), 'fdtyfh');

insert into lab (lab_no, patient_id, amount, result_date, results) values (2, 3, 150, to_date('01/01/2020','dd/MM/yyyy'), 'mjgjfyu');

insert into lab (lab_no, patient_id, amount, result_date, results) values (3, 5, 420, to_date('30/12/2019','dd/MM/yyyy'), 'csvcx');

insert into lab (lab_no, patient_id, amount, result_date, results) values (4, 2, 99, to_date('28/12/2019','dd/MM/yyyy'), 'jgddddd');

insert into nurse (nurse_id, nurse_name) values (1, 'q');

insert into nurse (nurse_id, nurse_name) values (2, 'w');

insert into nurse (nurse_id, nurse_name) values (3, 'e');

insert into nurse (nurse_id, nurse_name) values (4, 'r');

insert into nurse (nurse_id, nurse_name) values (5, 't');

insert into rooms (room_id,nurse_id, patient_id) values (1,1,1);

insert into rooms (room_id,nurse_id, patient_id) values (2,2,4);

insert into rooms (room_id,nurse_id, patient_id) values (3,3,5);

insert into rooms (room_id,nurse_id, patient_id) values (4,4,10);

insert into bills (bill_no, patient_id, total_amount, amount_paid) values (1,1,3234,543);

update bills set pending_amount=total_amount-amount_paid;

select * from departments;

select * from doctors;

select * from patient;

select * from lab;

select * from appointment;

select * from nurse;

select * from rooms;

select * from bills;
