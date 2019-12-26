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

insert into employee_details( employee_name, task_name, created_date, deadline_date, priority_number) 
values ('a','Install oracle', to_date('01/12/2019','dd/MM/yyyy'), to_date('30/01/2020','dd/MM/yyyy'), 1);

insert into employee_details( employee_name, task_name, created_date, deadline_date, priority_number) 
values ('a','Install oracle', to_date('01/12/2019','dd/MM/yyyy'), to_date('30/01/2020','dd/MM/yyyy'), 1);

update todo set status=0 where completed_date is not null;
update todo set status=0 where completed_date is null;

select * from employee_details order by priority_number ASC;
