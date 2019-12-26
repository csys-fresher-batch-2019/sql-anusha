create table employee_details(
  employee_id number not null,
  employee_name varchar2(25) not null, 
  task_name varchar2(50) not null,  
  created_date date not null, 
  deadline_date date not null,
  modified_date date default SYSDATE, 
  completed_date date, 
  priority_number number primary key, 
  status varchar2(10) 
);

create sequence employee_id start with 1 increment by 1;

insert into employee_details()
