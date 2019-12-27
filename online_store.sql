drop table books;
create table books(
    book_id number primary key,
    book_name varchar2(100) not null,
    author_name varchar2(50) not null,
    price number not null check (price>=0),
    publisher varchar2(50) not null,
    version number,
    category_b varchar2(25) not null,
    active number check (active in (0,1))
);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (1,'abc','asdf',120,'ghjkl',1,'qwerty',1);



drop table orders;
create table orders(
    order_id number not null,
    customer_id number not null,
    book_id number,
    ordered_date timestamp default sysdate not null,
    delivered_date timestamp default sysdate,
    total_amount number not null check(total_amount>=0),
    quantity number not null check(quantity>=1),
    status varchar2(20) not null check(status in('PENDING','CANCELLED','NOT AVAILABLE')),
    commands varchar2(200),
    constraint book_id_fk foreign key (book_id) references books(book_id)
);

insert into orders (order_id, customer_id, book_id, total_amount, quantity, status)values (1,1,1,120,1,'PENDING');

select * from books;
select * from orders;
