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
    mainimg varchar(50),
    detailimg varchar(50),
    msg varchar(200)
);
select * from product;
insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg, msg) values('유모차', '유아동', 25000, 44000, 53000, 'stroller_m.jpg', 'stroller_d.jpg', '굉장히 편안합니다!');
insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg, msg) values('자전거', '레저', 10000, 30000, 40000, 'bicycle_m.jpg', 'bicycle_d.jpg', '굉장히 편안합니다!');


create table tb_order
(
	order_id int not null auto_increment primary key,
    member_id varchar(50) not null,
    total_price int,
    state varchar(50),
    orderdate date
);
drop table tb_order;
select * from tb_order;
insert into tb_order(member_id, total_price, state, orderdate) values('qqq', 55000, '렌탈중', '2018-11-07');
insert into tb_order(member_id, total_price, state, orderdate) values('qqq', 10000, '렌탈중', '2018-11-08');


     
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
insert into tb_ordered_item(product_id, quantity, price, rental_type, startdate, enddate, order_id) values(1, 1, 25000, 'week', '2018-11-07', '2018-11-13', 1);
insert into tb_ordered_item(product_id, quantity, price, rental_type, startdate, enddate, order_id) values(2, 1, 30000, 'month', '2018-11-07', '2018-12-06', 1);
insert into tb_ordered_item(product_id, quantity, price, rental_type, startdate, enddate, order_id) values(1, 1, 10000, 'week', '2018-11-08', '2018-11-14', 2);




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

ALTER TABLE cart
ADD CONSTRAINT FK_product_TO_cart
FOREIGN KEY (product_id)
REFERENCES product (product_id);

ALTER TABLE cart
ADD CONSTRAINT FK_member_TO_cart
FOREIGN KEY (member_id)
REFERENCES member (id);