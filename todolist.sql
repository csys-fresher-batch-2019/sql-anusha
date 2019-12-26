create table todo (
task_number number,
task varchar2(50)not null,
by_name varchar2(25) not null,
deadline_date date not null,
completed_date date
status number not null,
);
insert into todo(task, by_name, deadline_date)
values('Install_oracle',abc,to_date('01/01/2020','dd/MM/yyyy'));
                                    
insert todo(task, by_name, deadline_date,completed_date)
values(Install_chrome,abc,to_date('01/01/2020','dd/MM/yyyy'),to_date('02/01/2020','dd/MM/yyyy'));
update todo values status=1 where comp_date != null;
update todo values status=0 where comp_date = null;
select *from todo where status = 1;
