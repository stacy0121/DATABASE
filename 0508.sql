use test01;

# 테이블 생성 쿼리
CREATE TABLE board (pkey int(4) NOT NULL AUTO_INCREMENT, title varchar(255), `subject` text, writer int(4) NOT NULL, view_count int(4) DEFAULT 0 NOT NULL, `status` int(1) DEFAULT 0 NOT NULL comment '-2 delete

-1 block

0 temp save

1 appear

2 disappear', insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));

CREATE TABLE board_img (pkey int(4) NOT NULL AUTO_INCREMENT, board_id int(4) NOT NULL, `name` varchar(255), `order` int(2), insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));

CREATE TABLE `like` (pkey int(4) NOT NULL AUTO_INCREMENT, user_id int(4) NOT NULL, content_id int(4) NOT NULL, `like` int(1), insert_date datetime DEFAULT now() NOT NULL, `type` int(1) comment '0 board

1 reply', PRIMARY KEY (pkey), UNIQUE INDEX (pkey));

CREATE TABLE `profile` (pkey int(4) NOT NULL AUTO_INCREMENT, image varchar(255), `profile` varchar(500), `status` int(1) DEFAULT 0 NOT NULL comment '0 not using

1 current using

2 disappear

3 delete', user_fkey int(4) NOT NULL, insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));

CREATE TABLE reply (pkey int(4) NOT NULL AUTO_INCREMENT, board_id int(4) NOT NULL, parent_id int(4) NOT NULL, writer int(4) NOT NULL, reply varchar(500), `status` int(1) DEFAULT 1 NOT NULL comment '-2 delete

-1 block

0 temp save

1 appear

2 disappear', insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));

CREATE TABLE sns_type (pkey int(1) NOT NULL AUTO_INCREMENT, `name` varchar(50) NOT NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));

CREATE TABLE `user` (pkey int(4) NOT NULL AUTO_INCREMENT, id varchar(50), `name` varchar(50), pwd varchar(100), birth date, profile_image varchar(255), email varchar(100), certificated_email int(1) DEFAULT 0 NOT NULL, certificated_date datetime NULL, gender int(1) DEFAULT 0 NOT NULL comment '0 nothing 1 women 2 men', sns_key varchar(50), sns_type int(1) NOT NULL, insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, latest_login_date datetime NULL, privacy_ok_date datetime NULL, privacy_version int(1), `status` int(1) DEFAULT 0 NOT NULL comment '-2 resign

-1 block

0 before regist

1 regist

2 sleep', PRIMARY KEY (pkey), UNIQUE INDEX (pkey));

INSERT INTO `sns_type`(`name`)VALUES('email');
INSERT INTO `sns_type`(`name`)VALUES('kakao');
INSERT INTO `sns_type`(`name`)VALUES('naver');
INSERT INTO `sns_type`(`name`)VALUES('google');


INSERT INTO `user`(`id`,`name`,`pwd`,`birth`,`email`,`gender`,`sns_type`,`status`)VALUES("id01","name01","pwd01","2000-02-03","email01@naver.com",1,1,1);
INSERT INTO `user`(`id`,`name`,`pwd`,`birth`,`email`,`gender`,`sns_type`,`status`)VALUES("id02","name02","pwd02","2010-04-20","email02@naver.com",2,1,1);
INSERT INTO `user`(`id`,`name`,`pwd`,`birth`,`email`,`gender`,`sns_type`,`status`)VALUES("id03","name03","pwd03","2020-06-10","email03@naver.com",1,1,-1);
INSERT INTO `user`(`id`,`name`,`pwd`,`birth`,`email`,`gender`,`sns_type`,`status`)VALUES("id04","name04","pwd04","2020-06-10","email04@naver.com",1,1,1);
INSERT INTO `user`(`id`,`name`,`pwd`,`birth`,`email`,`gender`,`sns_type`,`status`)VALUES("id05","name05","pwd05","2020-06-10","email05@naver.com",2,1,-1);
INSERT INTO `user`(`sns_key`,`sns_type`,`status`)VALUES('adqdxf12g45d7623wdf345', 4, 1);
INSERT INTO `user`(`sns_key`,`sns_type`,`status`)VALUES('cxs3f52f64gh753fg56434', 3, 1);
INSERT INTO `user`(`sns_key`,`sns_type`,`status`)VALUES('j5tgn5ghvb234fgdds45f4', 2, 1);
INSERT INTO `user`(`sns_key`,`sns_type`,`status`)VALUES('hntfcdfgf34dfg65223s21', 3, 1);
INSERT INTO `user`(`sns_key`,`sns_type`,`status`)VALUES('aasdf134dfg46fgvcxd354', 2, 1);

INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title01","subject01",3,100000,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title02","subject0",3,9232,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title03","subject0",2,50,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title04","subject0",3,354,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title05","subject0",6,34,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title06","subject0",7,20,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title07","subject0",7,530,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title08","subject0",8,254,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title09","subject0",10,233,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title10","subject10",8,123,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title11","subject11",7,523,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title12","subject12",6,20,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title13","subject13",2,16,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title14","subject14",1,14,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title15","subject15",2,12,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title16","subject16",3,15,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title17","subject17",2,12,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title18","subject18",4,11,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title19","subject19",6,100,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title20","subject20",7,13,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title21","subject21",10,1220,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title22","subject22",9,1042,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title23","subject23",9,10123,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title24","subject24",8,1009,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title25","subject25",8,10232,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title26","subject26",7,10132,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title27","subject27",6,105232,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title28","subject28",2,10123,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title29","subject29",3,6334,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title30","subject30",1,8434,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title31","subject31",7,8942,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title32","subject32",8,1021,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title33","subject33",9,982,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title34","subject34",10,1232,-1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title35","subject35",9,852,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title36","subject36",8,433,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title37","subject37",7,634,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title38","subject38",6,841,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title39","subject39",8,10002,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title40","subject40",7,1232,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title41","subject41",2,6443,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title42","subject42",3,965,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title43","subject43",1,9452,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title44","subject44",3,8421,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title45","subject45",4,132,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title46","subject46",2,74454,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title47","subject47",1,13422,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title48","subject48",6,8565,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title49","subject49",7,9765,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title50","subject50",8,54694,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title51","subject51",10,23,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title52","subject52",9,13,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title53","subject53",10,10,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title54","subject54",9,9,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title55","subject55",10,5,-1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title56","subject56",10,1312,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title57","subject57",9,105343,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title58","subject58",10,4310,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title59","subject59",7,1340,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title61","subject61",2,53410,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title62","subject62",3,234310,-1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title63","subject63",1,6310,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title64","subject64",3,6110,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title65","subject65",4,120,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title66","subject66",2,210,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title67","subject67",1,410,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title68","subject68",1,150,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title69","subject69",2,510,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title71","subject71",3,120,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title72","subject72",4,34410,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title73","subject73",7,1560,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title74","subject74",1,150,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title75","subject75",2,150,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title76","subject76",9,130,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title77","subject77",10,3110,-1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title78","subject78",8,110,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title79","subject79",6,5210,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title81","subject81",3,8410,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title82","subject82",4,2310,1);
INSERT INTO `board`(`title`,`subject`,`writer`,`view_count`,`status`)VALUES("title83","subject83",2,12310,1);

INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(1, 0, 0, 'reply01', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(1, 1, 0, 'reply02', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(1, 1, 0, 'reply03', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(2, 0, 0, 'reply04', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(3, 0, 0, 'reply05', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(4, 0, 0, 'reply06', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply07', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 7, 0, 'reply08', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply09', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 9, 0, 'reply10', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 10, 0, 'reply11', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 9, 0, 'reply12', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply13', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply14', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply15', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply16', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply17', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply18', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply20', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply21', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply22', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply23', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(1, 0, 0, 'reply24', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(1, 0, 0, 'reply25', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(2, 0, 0, 'reply26', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(3, 0, 0, 'reply27', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(4, 0, 0, 'reply28', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply30', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(6, 0, 0, 'reply31', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(7, 0, 0, 'reply32', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(9, 0, 0, 'reply33', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(10, 0, 0, 'reply34', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(11, 0, 0, 'reply35', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(10, 0, 0, 'reply36', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(11, 0, 0, 'reply37', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(10, 0, 0, 'reply38', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(9, 0, 0, 'reply40', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(8, 0, 0, 'reply41', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(20, 0, 0, 'reply42', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(30, 0, 0, 'reply43', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(31, 0, 0, 'reply44', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(31, 0, 0, 'reply45', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(32, 0, 0, 'reply46', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(33, 0, 0, 'reply47', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(34, 0, 0, 'reply48', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(53, 0, 0, 'reply50', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(32, 0, 0, 'reply51', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(45, 0, 0, 'reply52', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(72, 0, 0, 'reply53', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(21, 0, 0, 'reply54', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(21, 0, 0, 'reply55', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(72, 0, 0, 'reply56', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(31, 0, 0, 'reply57', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(31, 0, 0, 'reply58', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(31, 0, 0, 'reply60', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(32, 0, 0, 'reply61', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(42, 0, 0, 'reply62', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply63', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(6, 0, 0, 'reply64', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(76, 0, 0, 'reply65', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(55, 0, 0, 'reply66', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(56, 0, 0, 'reply67', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply68', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply70', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply71', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(42, 0, 0, 'reply72', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply73', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(67, 0, 0, 'reply74', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(72, 0, 0, 'reply75', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(73, 0, 0, 'reply76', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(62, 0, 0, 'reply77', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply78', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(34, 0, 0, 'reply80', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(64, 0, 0, 'reply81', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(73, 0, 0, 'reply82', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(43, 0, 0, 'reply83', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(56, 0, 0, 'reply84', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(23, 0, 0, 'reply85', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(2, 0, 0, 'reply86', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(3, 0, 0, 'reply87', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply88', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(7, 0, 0, 'reply90', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(8, 0, 0, 'reply91', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(32, 0, 0, 'reply92', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply93', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(45, 0, 0, 'reply94', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(22, 0, 0, 'reply95', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(22, 0, 0, 'reply96', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply97', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply98', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(51, 0, 0, 'reply99', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply100', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply101', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply102', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply103', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(63, 0, 0, 'reply104', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(71, 0, 0, 'reply105', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(71, 0, 0, 'reply106', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(71, 0, 0, 'reply107', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(23, 0, 0, 'reply108', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply109', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply110', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(42, 0, 0, 'reply111', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply112', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply113', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply114', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(13, 0, 0, 'reply115', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply116', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(11, 0, 0, 'reply117', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(10, 0, 0, 'reply118', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(10, 0, 0, 'reply119', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(10, 0, 0, 'reply120', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(9, 0, 0, 'reply121', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(21, 0, 0, 'reply122', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(2, 0, 0, 'reply123', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(5, 0, 0, 'reply124', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(7, 0, 0, 'reply125', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply126', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply127', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(72, 0, 0, 'reply128', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply129', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply130', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(68, 0, 0, 'reply131', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply132', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(42, 0, 0, 'reply133', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply134', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(73, 0, 0, 'reply135', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(72, 0, 0, 'reply136', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(22, 0, 0, 'reply137', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(32, 0, 0, 'reply138', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(42, 0, 0, 'reply139', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply140', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(72, 0, 0, 'reply141', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply142', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(32, 0, 0, 'reply143', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply144', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply145', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(31, 0, 0, 'reply146', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(21, 0, 0, 'reply147', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(23, 0, 0, 'reply148', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(32, 0, 0, 'reply149', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(21, 0, 0, 'reply150', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(12, 0, 0, 'reply151', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(52, 0, 0, 'reply152', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(73, 0, 0, 'reply153', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply154', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(79, 0, 0, 'reply155', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(78, 0, 0, 'reply156', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(77, 0, 0, 'reply157', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(77, 0, 0, 'reply158', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(76, 0, 0, 'reply159', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(65, 0, 0, 'reply160', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(72, 0, 0, 'reply161', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(76, 0, 0, 'reply162', 1);
INSERT INTO `reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`)VALUES(73, 0, 0, 'reply163', 1);

INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,1,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,1,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,1,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,1,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,1,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,1,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,1,5,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,1,5,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,1,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(9,1,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(10,1,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,2,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,2,5,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,2,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,2,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,3,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,3,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,3,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,4,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,4,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,4,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,5,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,5,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,5,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,5,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,5,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,5,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,5,5,0);

INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,7,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,7,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,7,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,7,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,8,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,8,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,8,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(9,8,2,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,9,3,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,14,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,14,2,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,14,3,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,14,2,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,14,4,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,14,5,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,14,2,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,14,3,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,21,4,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,21,2,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,21,2,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,28,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(9,28,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,58,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,58,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,58,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,58,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,81,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(9,81,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(10,81,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,81,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,81,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,81,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,81,2,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,81,3,1);

INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,6,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,6,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,6,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,6,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,6,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,7,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,7,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,7,5,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,8,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,8,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,8,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,8,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,8,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,10,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,10,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,10,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,10,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,10,1,1);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,43,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,42,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,35,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(9,79,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(10,51,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,42,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,67,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,67,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,67,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(8,34,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(10,43,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,43,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(6,43,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,43,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,43,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,74,3,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,74,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,75,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,54,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,54,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,54,4,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,64,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,64,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,64,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,64,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,64,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,67,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,67,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,67,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,67,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(9,58,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(4,58,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,58,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,58,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(7,77,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(5,77,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(3,77,1,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(2,77,2,0);
INSERT INTO `like`(`user_id`,`content_id`,`like`,`type`)VALUES(1,77,4,0);

INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image01','profile01',0,1);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image02','profile02',0,2);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image03','profile03',0,3);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image04','profile04',0,4);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image05','profile05',0,4);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image06','profile06',0,4);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image07','profile07',0,4);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image08','profile08',0,4);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image09','profile09',0,5);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image10','profile10',0,5);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image11','profile11',0,6);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image12','profile12',0,6);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image13','profile13',0,6);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image14','profile14',0,6);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image15','profile15',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image16','profile16',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image17','profile17',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image18','profile18',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image19','profile19',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image20','profile20',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image21','profile21',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image22','profile22',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image23','profile23',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image24','profile24',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image25','profile25',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image26','profile26',0,7);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image27','profile27',0,8);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image28','profile28',0,8);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image29','profile29',0,8);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image30','profile30',0,9);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image31','profile31',0,10);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image32','profile32',0,1);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image33','profile33',0,2);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image34','profile34',0,3);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image35','profile35',0,3);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image36','profile36',0,2);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image37','profile37',0,1);
INSERT INTO `profile`(`image`,`profile`,`status`,`user_fkey`)VALUES('image38','profile38',0,1);


select * from `user`;
## gender 기준 grouping(중복 제거)
select gender, min(sns_type) from `user` group by gender;   # grouping 기준과 같은 컬럼만 조회 -> sns 가입은 gender가 0으로 나오는 문제점 -> 0이면 sns_type이 최소 2

## sns type에 따른 sns 출력
# 암시적 조인
select `user`.gender, `user`.sns_type, sns_type.`name` 
from `user`, sns_type 
where `user`.sns_type = sns_type.pkey;   # name으로 출력, sns_type과 name 맞추기
# 서브쿼리로 구현
select `name`, sns_type, 
	(select `name` 
    from `sns_type` 
    where `user`.sns_type=sns_type.pkey
    limit 1) as 'sns'
from `user`;

## 날짜 형식 바꾸기(나이 계산)
select now();             # 현재 시간 출력, from 없어도 됨, 문자형
select `name`, year(now())-year(`birth`) from `user` 
where !isnull(`birth`);   # 올해 년도에서 빼기, null이 아닌 데이터(= where birth is not null)
# 미성년자는 몇 명?(20 이하 개수)
select count(pkey) from `user` 
where !isnull(`birth`) and year(now())-year(`birth`)<20;   # -> 여러 번 검증하기

## 최후 가입자 출력 (insert date 기준 정렬)
select * from `user` order by pkey desc limit 1;   # pkey 오름차순(asc/desc), 첫번째 출력

select * from `reply`;
## 댓글과 대댓글(feat.별칭)
select reply1.pkey as pkey1, reply1.board_id, reply1.parent_id, reply1.reply,   # 댓글
	reply2.pkey as pkey2, reply2.board_id, reply2.parent_id, reply2.reply       # 대댓글
from reply reply1, reply reply2         # 같은 테이블이지만 2개의 별칭으로 가져오기
where reply1.pkey = reply2.parent_id;   # 댓글에 달린 대댓글 모아서 출력
# parent_id를 pkey에 조인 (여러 번 가능. 여러 테이블에 참조할 수 있으므로)
select reply1.pkey as pkey1, reply1.board_id, reply1.parent_id, reply1.reply,
	reply2.pkey as pkey2, reply2.board_id, reply2.parent_id, reply2.reply 
from reply reply1
left join reply reply2 on reply1.pkey = reply2.parent_id
where reply1.parent_id = 0;   # reply1에서 parent_id가 1 이상이면 대댓글이므로 조건절 넣기

## user별 profile 출력 (feat.조인)
select * from `profile`;
select `user`.pkey, `user`.`name`, `profile`.`profile`, `profile`.image from `user`
left join `profile` on `user`.pkey=`profile`.user_fkey;

select * from `board`;
select * from `like`;