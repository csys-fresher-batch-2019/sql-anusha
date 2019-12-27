--drop table order_items;
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
values (1,'abc','abcd',100,'abcde',1,'qwertyuiop',0);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (2,'abc','abcd',120,'abcde',2,'qwertyuiop',1);

insert into books(book_id, book_name, author_name, price, publisher,category_b, active) 
values (3,'def','efgh',80,'fghij','asdfghjkl',1);

insert into books(book_id, book_name, author_name, price, publisher, category_b, active) 
values (4,'ghi','ijkl',900,'klmno','zxcvbnm',1);

insert into books(book_id, book_name, author_name, price, publisher, category_b, active) 
values (5,'jkl','mnop',60,'pqrst','qwertyuiop',1);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (6,'mno','qrts',90,'uvwxy',1,'asdfghjkl',0);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (7,'mno','qrst',150,'uvwxy',2,'asdfghjkl',1);

insert into books(book_id, book_name, author_name, price, publisher, category_b, active) 
values (8,'pqr','uvwx',125,'zabcd','zxcvbnm',1);

insert into books(book_id, book_name, author_name, price, publisher, category_b, active) 
values (9,'stu','yzab',199,'efghi','qwertyuiop',1);

insert into books(book_id, book_name, author_name, price, publisher, category_b, active) 
values (10,'vwx','cdef',209,'jklmno','asdfghjkl',1);

create table orders(
    order_id number not null primary key,
    customer_id number not null,
    ordered_date timestamp default sysdate not null,
    delivered_date timestamp,
    total_amount number not null check(total_amount>=0),
    status varchar2(20) not null check(status in('PENDING','CANCELLED','NOT AVAILABLE'))
);

insert into orders (order_id, customer_id, total_amount, status)values (1,1,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (2,1,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (3,2,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (4,3,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (5,4,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (6,5,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (7,5,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (8,6,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (9,7,120,'PENDING');

insert into orders (order_id, customer_id, total_amount, status)values (10,8,120,'PENDING');

create table order_items(
    item_id number not null,
    order_id number not null,
    quantity number not null, 
    status varchar2(25) not null check(status in ('PENDING','COMPLETED','CANCELLED')),
    constraint order_id_fk foreign key (order_id) references orders
);

insert into order_items (item_id, order_id, quantity, status)values(1, 1, 3, 'PENDING');


/*create table stock(
    stock_number number not null,
    book_id number not null,
    quantity number 
);*/

select * from books;
select * from orders;
select * from order_items;
