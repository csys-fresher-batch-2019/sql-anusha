create table emp(
    emp_name varchar2(25),
    emp_id number not null,
    manager number,
);
insert into emp (emp_id ,emp_name)
values (1,'a');

insert into emp (emp_id ,emp_name)
values (1,'b',1);

insert into emp (emp_id ,emp_name)
values (1,'c',2);
 
select * from users u,tasks t;
