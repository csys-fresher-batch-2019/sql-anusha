drop table stock;
drop table order_items;
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
    active number default 1 check (active in (0,1))
);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (1,'abc','abcd',100,'abcde',1,'qwertyuiop',0);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b) 
values (2,'abc','abcd',120,'abcde',2,'qwertyuiop');

insert into books(book_id, book_name, author_name, price, publisher,category_b) 
values (3,'def','efgh',80,'fghij','asdfghjkl');

insert into books(book_id, book_name, author_name, price, publisher, category_b) 
values (4,'ghi','ijkl',900,'klmno','zxcvbnm');

insert into books(book_id, book_name, author_name, price, publisher, category_b) 
values (5,'jkl','mnop',60,'pqrst','qwertyuiop');

insert into books(book_id, book_name, author_name, price, publisher, version, category_b, active) 
values (6,'mno','qrts',90,'uvwxy',1,'asdfghjkl',0);

insert into books(book_id, book_name, author_name, price, publisher, version, category_b) 
values (7,'mno','qrst',150,'uvwxy',2,'asdfghjkl');

insert into books(book_id, book_name, author_name, price, publisher, category_b) 
values (8,'pqr','uvwx',125,'zabcd','zxcvbnm');

insert into books(book_id, book_name, author_name, price, publisher, category_b) 
values (9,'stu','yzab',199,'efghi','qwertyuiop');

insert into books(book_id, book_name, author_name, price, publisher, category_b) 
values (10,'vwx','cdef',209,'jklmno','asdfghjkl');

create table orders(
    order_id number not null primary key,
    customer_id number not null,
    ordered_date timestamp default sysdate not null,
    delivered_date timestamp,
    cancelled_date timestamp,
    total_amount number not null check(total_amount>=0),
    status varchar2(20) default 'PROCESSING' not null  check(status in('PROCESSING','DELIVERED','CANCELLED','NOT AVAILABLE'))
);

insert into orders (order_id, customer_id, total_amount,delivered_date)values (1,1,120, systimestamp);

insert into orders (order_id, customer_id, total_amount)values (2,1,120);

insert into orders (order_id, customer_id, total_amount,cancelled_date)values (3,2,120,systimestamp);

insert into orders (order_id, customer_id, total_amount)values (4,3,120);

update orders set status='DELIVERED' where delivered_date is not null;

update orders set status='CANCELLED' where cancelled_date is not null;

create table order_items(
    item_id number not null,
    order_id number not null,
    quantity number not null, 
    status varchar2(25) default 'PROCESSING' check(status in ('PROCESSING','DELIVERED','CANCELLED')),
    constraint order_id_fk foreign key (order_id) references orders
);

insert into order_items (item_id, order_id, quantity)values(1, 1, 3);

insert into order_items (item_id, order_id, quantity)values(2, 2, 2);

insert into order_items (item_id, order_id, quantity)values(3, 2, 4);

insert into order_items (item_id, order_id, quantity)values(4, 3, 5);

insert into order_items (item_id, order_id, quantity)values(5, 4, 6);

insert into order_items (item_id, order_id, quantity)values(6, 1, 1);

insert into order_items (item_id, order_id, quantity)values(7, 4, 3);

insert into order_items (item_id, order_id, quantity)values(8, 3, 2);

insert into order_items (item_id, order_id, quantity)values(9, 1, 4);

insert into order_items (item_id, order_id, quantity)values(10, 3, 3);

create table stock(
    stock_id number primary key,
    book_id number not null,
    quantity number  
);

insert into stock (stock_id, book_id, quantity) values(1,1,100);

insert into stock (stock_id, book_id, quantity) values(2,2,100);

insert into stock (stock_id, book_id, quantity) values(3,3,100);

insert into stock (stock_id, book_id, quantity) values(4,4,100);

insert into stock (stock_id, book_id, quantity) values(5,5,100);

insert into stock (stock_id, book_id, quantity) values(6,6,100);

insert into stock (stock_id, book_id, quantity) values(7,7,100);

insert into stock (stock_id, book_id, quantity) values(8,8,100);

insert into stock (stock_id, book_id, quantity) values(9,9,100);

insert into stock (stock_id, book_id, quantity) values(10,10,100);

select * from books;

select * from orders;

select * from order_items;

select * from stock; 

select book_id, ((select quantity from stock where book_id = b.book_id)-(select sum(quantity) from order_items where item_id = b.book_id )) as remaining_stock from books b;
