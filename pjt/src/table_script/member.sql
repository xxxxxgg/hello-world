ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
create table member
(  id varchar(50) not null primary KEY,
  password varchar(50) not null,
  name varchar(50),
  gender varchar(10),
  mail varchar(100),
  phone varchar(11),
  address varchar(200),
  regdate timestamp not null default now()
);

create table product
(	product_id int not null auto_increment primary key,
    product_name varchar(50),
    category varchar(50),
    priceforweek int,
    priceformonth int,
    pricefornew int,
    mainimg varchar(50),
    detailimg varchar(50),
    msg varchar(200)
);

insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg, msg) values('유모차', '유아동', 25000, 44000, 53000, 'stroller_m.jpg', 'stroller_d.jpg', '굉장히 편안합니다!');
insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg, msg) values('자전거', '레저', 10000, 30000, 40000, 'bicycle_m.jpg', 'bicycle_d.jpg', '굉장히 편안합니다!');
insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg, msg) values('소방차캐리어', '유아동', 5000, 10000, 11000, 'firetruck_m.jpg', 'firetruck_d.jpg', '영국에서 온 타고노는 캐리어');
insert into product(product_name, category, priceforweek, priceformonth, pricefornew, mainimg, detailimg, msg) values('카시트', '유아동', 24000, 31800, 35000, 'carseat_m.jpg', 'carseat_d.jpg', '언제나 아이의 안전과 건강을 지켜주는');

create table tb_order
(	order_id int not null auto_increment primary key,
    member_id varchar(50) not null,
    total_price int,
    state varchar(50),
    orderdate date
);
     
create table tb_ordered_item
(	ordered_item_id int not null auto_increment primary key,
    product_id int not null,
    quantity int,
    price int,
    rental_type varchar(50),
    startdate date,
    enddate date,
    order_id int not null
);
create table cart
(	cart_id int not null auto_increment primary key,
    member_id varchar(50),
    product_id int,
    quantity int,
    rental_type varchar(50),
    price int
);

create table ticket
(	ticket_id int not null auto_increment primary key,
    member_id varchar(50),
    rental_type varchar(50),
    count int
);

create table usedSeller
(	seller_id int not null auto_increment primary key,
    seller_name varchar(50),
    seller_num varchar(50),
    seller_phone varchar(50),
    seller_address varchar(50),
    seller_msg varchar(200)
);

insert into usedSeller(seller_name, seller_phone, seller_address, seller_msg) values('준명상사', '031-4468-0882', '서울시 중구 두지빌딩 3층', '준명상사 입니다.');
insert into usedSeller(seller_name, seller_phone, seller_address, seller_msg) values('대도가구', '062-2453-6543', '서울시 오장동 199-55', '안녕하세요.');
insert into usedSeller(seller_name, seller_phone, seller_address, seller_msg) values('영화상사', '070-2279-1179', '서울시 을지로 동화빌딩 별관', '중고빌려줍니다.');
insert into usedSeller(seller_name, seller_phone, seller_address, seller_msg) values('백만불상사', '02-2276-450', '경기도 진접 아파트 10호', '무엇이든 있습니다.');
insert into usedSeller(seller_name, seller_phone, seller_address, seller_msg) values('중고가구','02-2266-8484', '서울시 중구 을지로2가', '저렴합니다.');


create table product_request
(	request_id int not null auto_increment primary key,
    request_type varchar(50),
    request_model varchar(50),
    request_phone varchar(50),
    request_msg varchar(200)
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
ALTER TABLE ticket
ADD CONSTRAINT FK_member_TO_ticket
FOREIGN KEY (member_id)
REFERENCES member (id);


 insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '유모차', '굉장히 편안합니다!', 20000, 10000, 5000,'stroller.jpg','stroller_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('리빙', '노트북', '굉장히 빠릅니다!', 50000, 20000, 10000,'notebook.jpg','notebook_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('반려동물', '애견유모차', '굉장히 튼튼합니다!', 100000, 50000, 25000,'petbag.jpg','petbag_des.png',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('패션뷰티', '샤넬백', '굉장히 가볍습니다!', 200000, 80000, 40000, 'chanel.png','chanel_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', '킥보드', '굉장히 신납니다!', 700000, 25000, 12500, 'easywheel.jpg', 'easywheel_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('중고', '서핑보드', '굉장히 단단합니다!', 3000, 800, 400, 'consfield.jpg', 'consfield_des.jpg',10);
  
  
   insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '미니물총', '굉장히 수압이 쎕니다!', 8000, 4000, 2000,'mickey.png','mickey_des.png',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('리빙', '냉장고', '굉장히 시원합니다!', 3000000, 100000, 50000,'refrigirator.jpg','refrigirator_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('반려동물', '펫스테이션', '굉장히 똑똑합니다!', 400000, 200000, 100000,'petstation.jpg','petstation_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('패션뷰티', '필립스 면도기', '굉장히 날카롭습니다!', 40000, 20000, 10000, 'phillips.png','phillips_des.png',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', '스타워즈 피규어', '굉장히 진짜같습니다!', 220000, 50000, 14000, 'starwars.jpg', 'starwars_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('중고', '번머신프로', '굉장히 힘듭니다!', 74000, 8000, 4000, 'burnmachine.png', 'burnmachine_des.jpg',10);
  
  
   insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '아동복', '굉장히 이쁩니다!', 70000, 35000, 17500,'kidcloth.jpg','kidcloth_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('리빙', '무선 진공청소기', '굉장히 편리합니다!', 240000, 120000, 60000,'vacuum.jpg','vacuum_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('반려동물', '애견백', '굉장히 튼튼합니다!', 80000, 40000, 20000,'petgear.jpg','petgear_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('패션뷰티', '디올백', '굉장히 멋집니다!', 5000000, 250000, 100000, 'dior.png','dior_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', '디지털 피아노', '굉장히 감미롭습니다!', 500000, 20000, 7500, 'digitalpiano.png', 'digitalpiano_des.jpg',50);
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('중고', '스케이트 보드', '넘어지면 굉장히 아픕니다!', 11000, 6000, 4500, 'skateboard.jpg', 'skateboard_des.jpg',10);
  
  insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '기차붕붕카', '핑크퐁과 달려보자', 69000, 20000, 5000,'train_m.png','train_d.jpg',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '백조튜브', '수영해요', 69000, 20000, 5000,'duck_m.png','duck_d.png',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '콩순이 자판기', '동전모으기', 69000, 20000, 5000,'auto_m.png','auto_d.png',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '탑블레이드', '아주쎔', 69000, 20000, 5000,'pang_m.png','pang_d.png',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '키친', '라지파스텔키친', 10000, 20000, 30000,'kitchen_m.png','kitchen_d.png',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '자전거 유모차', '자전거를 탑니다.', 10000, 20000, 30000,'cyleStroller_m.jpg','cyleStroller_d.jpg',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('유아동', '쌍둥이 유모차', '사이좋은 쌍둥이', 200000, 19000, 28000,'twin_m.jpg','twin_d.png',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('반려동물', '펫유모차', '강아지도 고양이도 탈수있음', 180000, 18000, 29000,'petStroller_m.png','petStroller_d.png',50);



insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', '워크로', '유산소운동', 10000, 20000, 30000,'walkro_m.png','walkro_d.png',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', 'QR-PLUS', '자전거', 10000, 20000, 30000,'qrplus_m.png','qrplus_d.jpg',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', 'E802D', '보드', 10000, 20000, 30000,'e802d_m.jpg','e802d_d.jpg',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', 'NIKON', 'DSLR 카메라', 10000, 20000, 30000,'nikon_m.jpg','nikon_d.jpg',50);
insert into product(category, product_name, msg, pricefornew, priceforweek, priceformonth, mainimg, detailimg, stock) values ('레저취미', '오일', '기름', 10000, 20000, 30000,'oil_m.jpg','oil_d.jpg',50);