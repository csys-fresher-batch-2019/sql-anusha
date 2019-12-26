create todo (
status number not null,
task varchar2(50)not null,
by_name varchar2(25) not null,
deadline_date date not null,
completed_date date
);
insert todo(task, by_name, deadline_date)
values(Install_oracle,abc,to_date('01/01/2020','dd/mm/yyyy'));
insert todo(task, by_name, deadline_date,completed_date)
values(Install_chrome,abc,to_date('01/01/2020','dd/mm/yyyy'));
set status=1 where comp_date != null;
set status=0 where comp_date =null;
select *from todo where status=1;
