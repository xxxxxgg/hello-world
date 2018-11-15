create table member
(
  id varchar(50) not null primary KEY,
  password varchar(50) not null,
  name varchar(50),
  gender varchar(10),
  mail varchar(100),
  phone varchar(11),
  address varchar(200),
  regdate timestamp not null default now()
);

drop table member;

select *
from member;


create table member
(
  id varchar(50) not null primary KEY,
  password varchar(50) not null,
  name varchar(50),
  gender varchar(10),
  mail varchar(100),
  phone varchar(11),
  address varchar(200),
  regdate timestamp not null default now()
);
drop table member;
select *
from member;



create table product
(
	product_id int not null auto_increment primary key,
    product_name varchar(50),
    category varchar(50),
    priceforweek int,
    priceformonth int,
    pricefornew int,
    mainimg BLOB,
    detailimg MEDIUMBLOB
);
select * from product;
insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg) values('유모차', '유아동', 25000, 44000, 53000, null, null);
insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg) values('자전거', '레저', 10000, 30000, 40000, null, null);



create table tb_order
(
	order_id int not null auto_increment primary key,
    member_id varchar(50) not null,
    total_price int,
    state varchar(50),
    orderdate date
);
drop table tb_order;
insert into tb_order(member_id, total_price, state, orderdate) values('qqq', 10000, '렌탈중', '2018-11-07');
select * from tb_order;
insert into tb_order(member_id, total_price, state, orderdate) values('qqq', 20000, '렌탈중', '2018-11-08');
delete from tb_order where order_id=2;

create table tb_ordered_item
(
	ordered_item_id int not null auto_increment primary key,
    product_id int not null,
    quantity int,
    price int,
    rental_type varchar(50),
    startdate date,
    enddate date,
    order_id int not null
);

select * from tb_ordered_item;
insert into tb_ordered_item(product_id, quantity, price, rental_type, startdate, enddate, order_id) values(1, 1, 25000, 'week', '2018-11-07', '2018-12-07', 1);
insert into tb_ordered_item(product_id, quantity, price, rental_type, startdate, enddate, order_id) values(2, 1, 30000, 'month', '2018-11-07', '2018-12-07', 1);
insert into tb_ordered_item(product_id, quantity, price, rental_type, startdate, enddate, order_id) values(1, 1, 10000, 'week', '2018-11-07', '2018-11-14', 3);




select tb_order.order_id, product_name, rental_type, state, startdate, enddate
from member, tb_order, tb_ordered_item, product
where tb_order.member_id=member.id
and tb_ordered_item.product_id=product.product_id
and tb_ordered_item.order_id=tb_order.order_id;


 
ALTER TABLE tb_order 
ADD CONSTRAINT FK_member_TO_tb_order 
FOREIGN KEY (member_id)
REFERENCES member (id);

ALTER TABLE tb_ordered_item
ADD CONSTRAINT FK_product_TO_tb_ordered_item
FOREIGN KEY (product_id)
REFERENCES product (product_id);

ALTER TABLE tb_ordered_item
ADD CONSTRAINT FK_tb_order_TO_tb_ordered_item
FOREIGN KEY (order_id)
REFERENCES tb_order (order_id);
