drop table patient;
drop table doctors;
drop table departments;
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
  
create table patient(
    patient_id number primary key,
    patient_name varchar2(50) not null,
    gender char not null,
    address varchar2(150)not null,
    phone_number number not null,
    constraint gender_ck check(gender in ('M','F'))
);

insert into departments (department_id,department_name)values (1,'car');

insert into departments (department_id,department_name)values (2,'der');

insert into departments (department_id,department_name)values (3,'ped');

insert into departments (department_id,department_name)values (4,'gm');

insert into departments (department_id,department_name)values (5,'ent');

insert into departments (department_id,department_name)values (6,'gy');
 
insert into doctors (employee_id,doc_name,department_id) values(1,'a',4);

insert into doctors (employee_id,doc_name,department_id) values(2,'b',1);

insert into doctors (employee_id,doc_name,department_id) values(3,'c',4);

insert into doctors (employee_id,doc_name,department_id) values(4,'d',2);

insert into doctors (employee_id,doc_name,department_id) values(5,'e',5);

insert into doctors (employee_id,doc_name,department_id) values(6,'f',3);

insert into doctors (employee_id,doc_name,department_id) values(7,'g',6);

insert into doctors (employee_id,doc_name,department_id) values(8,'h',3);

insert into doctors (employee_id,doc_name,department_id) values(9,'i',4);

insert into doctors (employee_id,doc_name,department_id) values(10,'j',1);

insert into patient (patient_id, patient_name, address, phone_number, gender) values (1,'z','jksg12yu',9182656261, 'M');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (2,'y','nfbhruyf7',3648573489, 'F');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (3,'x','jkrhwguitj4hh',2768756868, 'M');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (4,'w','jehtuirgfuruih',9858876451, 'M');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (5,'v','h8945ty7845yhgui45hv',9754873675, 'F');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (6,'u','uc4t784gjkbtc85',0823697765, 'F');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (7,'t','hx43gr7cg34ug',9768854783, 'M');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (8,'s','4837ucb',6756478657, 'M');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (9,'r','c84b5u8bg45u',3847567867, 'F');

insert into patient (patient_id, patient_name, address, phone_number, gender) values (10,'q','h8t2c45ucbutg2i',0834564657, 'M');
 
select * from departments;

select * from doctors;

select * from patient;
