drop table emp;
create table emp(
    emp_name varchar2(25),
    emp_id number not null,
    manager number
);

insert into emp (emp_id ,emp_name)
values (1,'a');

insert into emp (emp_id ,emp_name,manager)
values (2,'b',1);

insert into emp (emp_id ,emp_name,manager)
values (3,'c',2);
 
select e1.emp_id,e1.emp_name,e2.emp_name as manager from emp e1,emp e2 where e1.manager = e2.emp_id;
