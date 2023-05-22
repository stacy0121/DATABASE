select * from `user`;
select `name` from `user`;
# create index
explain select `name` from `user`;   # 인덱스 이름 조회 idx_user_name

select count(*) from `user`; 
# duration: 검색하는 시간/ fetch: 모니터 출력 및 네트워크 전송하는 시간
# 전체 검색 vs 한 컬럼 검색 - 출력할 데이터가 많으면 fetch 시간 더 걸림(게시판 한 번에 보여주는 개수 방법론)

select pkey from `user`;   # 숫자라서 더 빠름

create index `idx_name_gender` on `user` (`name`, gender);   # name 다음 gender
# 사용할 인덱스 지정 (조회 시간 단축)
-- explain
select `name`, gender from `user`
use index(`idx_name_gender`)
where `name`='a80c9908' and gender=1;

# (SUBSTR(MD5(RAND()),1,8),SUBSTR(MD5(RAND()),1,8),SUBSTR(MD5(RAND()),1,8),  -> 숫자, 영어 합쳐서 랜덤 8자리
# FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), -> 1980-01-01 00:00:00 ~ 2015-12-31 00:00:00
# floor(rand()*3),floor(rand()*5)-2,0)

## 데이터 조회 알고리즘
# 전체 데이터를 조회할 일은 거의 없다 
# 조회할 개수 줄이기 