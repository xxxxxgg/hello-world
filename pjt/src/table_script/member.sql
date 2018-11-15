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

create table product
(
	product_id int not null auto_increment primary key,
    product_name varchar(50),
    category varchar(50),
    priceforweek int,
    priceformonth int,
    pricefornew int,
    mainimg varchar(50),
    detailimg varchar(50)
);

create table tb_order
(
	order_id int not null auto_increment primary key,
    member_id varchar(50) not null,
    total_price int,
    state varchar(50),
    orderdate date
);
     
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

CREATE TABLE cart 
(
	cart_id int not null auto_increment primary key,
	member_id varchar(50),
	amount int,
	product_id int
);

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