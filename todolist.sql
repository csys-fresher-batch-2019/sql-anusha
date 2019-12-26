create table todo (
task_number number,
task_name varchar2(50)not null,
by_name varchar2(25) not null,
deadline_date date not null,
completed_date date,
status number not null,
);

create sequence task_number start with 1 increment by 1;
constraint task_number_uq unique
insert into todo(task_number,task_name, by_name, deadline_date)
values(task_number.currval,'Install_oracle','abc',to_date('01/01/2020','dd/MM/yyyy'));
                                    
insert todo(task_number,task_name, by_name, deadline_date,completed_date)
values(task_number.nextval,'Install_chrome','abc',to_date('01/01/2020','dd/MM/yyyy'),to_date('02/01/2020','dd/MM/yyyy'));
                                                                     
update todo set status=1 where comp_date != null;
update todo set status=0 where comp_date = null;
select *from todo;
