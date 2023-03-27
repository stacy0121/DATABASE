use test01;   # 데이터베이스 선택

create table `user`(   # 테이블과 컬럼 생성 
	pkey int4 not null auto_increment,  # 4byte int 'pkey' 컬럼 자동 증가 
	`name` char(50), 
    pwd char(150),
    birth date,
    profile_image varchar(300),   # 폴더 주소나 파일명
    email varchar(200),
    primary key(pkey),
    unique index(pkey)
);

# pkey는 자동 증가이므로 컬럼 이름 넣지 않음
insert into `user`(`name`, pwd, birth, email) values('name1', 'pwd1', '2001-12-11', 'cose');   # 값 넣을 컬럼과 데이터값
insert into `user`(`name`, pwd, birth, email) values('name2', 'pwd2', '2003-12-11', 'coe');
insert into `user`(`name`, pwd, birth, email) values('name3', 'pwd3', '2004-12-11', 'co9e');
insert into `user`(`name`, pwd, birth, email) values('name4', 'pwd4', '2002-12-11', 'c43e');

# Insert Statement 
INSERT INTO `test01`.`user`(`name`,`pwd`,`birth`,`email`)VALUES('name10','pwd2','2000-12-25','email10');

select * from `user`;   # 테이블 내용 확인

# Update Statement
UPDATE `test01`.`user`
SET
`name` = 'name10',
`pwd` = 'pwd10',
`birth` = '2000-12-25',
`email` = 'email10'
where pkey=2;   # pkey가 2인 컬럼값 변경 
# where가 없으면 모든 데이터를 한 번에 바꿈 

# Delete Statement
DELETE FROM `test01`.`user`
WHERE pkey=5;   # unique한 값 

drop table `user`;   # 테이블 삭제