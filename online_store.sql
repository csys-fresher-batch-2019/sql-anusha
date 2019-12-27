drop table orders;
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
values (1,'abc','abcd',120,'abcde',1,'qwertyuiop',0);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (2,'abc','abcd',120,'abcde',2,'qwertyuiop',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (3,'def','efgh',120,'fghij',1,'asdfghjkl',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (4,'ghi','ijkl',120,'klmno',1,'zxcvbnm',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (5,'jkl','mnop',120,'pqrst',1,'qwertyuiop',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (6,'mno','qrts',120,'uvwxy',1,'asdfghjkl',0);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (7,'mno','qrst',120,'uvwxy',2,'asdfghjkl',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (8,'pqr','uvwx',120,'zabcd',1,'zxcvbnm',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (9,'stu','yzab',120,'efghi',1,'qwertyuiop',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (10,'vwx','cdef',120,'jklmno',1,'asdfghjkl',1);

create table orders(
    order_id number not null primary key,
    customer_id number not null,
    book_id number,
    ordered_date timestamp default sysdate not null,
    delivered_date timestamp,
    total_amount number not null check(total_amount>=0),
    quantity number not null check(quantity>=1),
    status varchar2(20) not null check(status in('PENDING','CANCELLED','NOT AVAILABLE')),
    commands varchar2(200),
    constraint book_id_fk foreign key (book_id) references books(book_id)
);

insert into orders (order_id, customer_id, book_id, total_amount, quantity, status)values (1,1,1,120,1,'PENDING');

create table order_items(
    order_no number not null,
    order_id number not null,
    quantity number not null, 
    status varchar2(25) not null check(status in ('PENDING','COMPLETED','CANCELLED'))
);



create table stock(
    stock_number number not null,
    book_id number not null,
    quantity number 
);



select * from books order by category_b asc;
select * from orders;
