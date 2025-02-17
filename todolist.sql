drop table todo; 
create table todo (
task_number number not null,
task_name varchar2(50) not null,
by_name varchar2(25) not null,
created_date date not null,
deadline_date date not null,
modified_date date default SYSDATE,
completed_date date,
priority number,
status number not null
    task_number number not null,
    task_name varchar2(50) not null,
    by_name varchar2(25) not null,
    created_date date not null,
    deadline_date date not null,
    modified_date date default SYSDATE,
    completed_date date,
    priority_number number primary key,
    status varchar2(10),
    constraint task_number_uq unique(task_number)
);



/*constraint priority_pk primary key (priority);*/
create sequence task_number start with 1 increment by 1;
constraint task_number_uq unique(task_number); 

constraint priority_pk primary key (priority);
insert into todo(task_number, task_name, by_name, created_date, deadline_date, priority_number)
values(task_number.nextval, 'Install_oracle', 'abc', to_date('01/12/2019','dd/MM/yyyy'), to_date('01/01/2020','dd/MM/yyyy'), 3);

insert into todo(task_number, task_name, by_name, created_date, deadline_date, completed_date, priority_number)
values(task_number.nextval, 'Install_chrome', 'de',  to_date('01/12/2019','dd/MM/yyyy'), to_date('01/01/2020','dd/MM/yyyy'), to_date('02/01/2020','dd/MM/yyyy'),2);

update todo set status='COMPLETED' where completed_date is not null;
update todo set status='PENDING' where completed_date is null;

insert into todo(task_number, task_name, by_name, created_date, deadline_date)
values(task_number.currval, 'Install_oracle', 'abc', to_date('01/12/2019','dd/MM/yyyy'), to_date('01/01/2020','dd/MM/yyyy'));

insert into todo(task_number, task_name, by_name, created_date, deadline_date, modified_date, completed_date)
values(task_number.nextval, 'Install_chrome', 'de',  to_date('01/12/2019','dd/MM/yyyy'), to_date('01/01/2020','dd/MM/yyyy'), to_date('02/01/2020','dd/MM/yyyy'));

update todo set status=1 where completed_date != null;
update todo set status=0 where completed_date = null;
select *from todo order by priority ASC ;
select * from todo order by priority_number ASC ;
