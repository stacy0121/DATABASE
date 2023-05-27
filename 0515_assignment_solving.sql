use test01;

##1
select * 
from `user` 
where pkey=(select min(pkey) from `user`) 
	or pkey=(select max(pkey) from `user`) ;
    
select (select max(pkey) from `user`) as 'maximum'
from `user`;

##2
select (select avg(2024-year(birth)) from `user`) - (2024-year(birth)) as avgAge
from `user`;

## user별 profile image 개수
select user_fkey, count(user_fkey) from `profile` group by user_fkey;
# 검증 (가장 많은 profile image를 가진 유저)
select count(*) from `profile` where user_fkey = 7;

##3 user_fkey가 2인 user 이름과 프로필
# where절 사용
select `profile`.pkey,image,`profile`,`profile`.`status` as profile_status,user_fkey,`user`.`name` as user_name, `user`.`status` as user_status
from `profile`, `user`
where user_fkey=2 and `user`.pkey=2;   # 두 테이블의 연관성을 보여줌

# 2개의 조건문 대신 left join 사용
select `user`.`name` as user_name, `profile`.pkey,image,`profile`,`profile`.`status` as profile_status,user_fkey, `user`.`status` as user_status
from `user`
left join `profile` on `profile`.user_fkey = `user`.pkey
where `user`.pkey=2 and `profile`.`status`!=3;   # 삭제된 이미지 제외

## 유저 이름과 사용 중인 프로필이미지
select `user`.`name` as user_name, `profile`.image as profile_image
from `user`
left join `profile` on `profile`.user_fkey = `user`.pkey and `profile`.`status`=1;

##4 
select gender, count(gender) from `user`
where gender!=0
group by gender;

