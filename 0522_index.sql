## insert_statement 해석
# INSERT INTO `user`(`id`,`name`,`pwd`,`birth`,`gender`,`status`,sns_type) VALUES(
# (SUBSTR(MD5(RAND()),1,8),SUBSTR(MD5(RAND()),1,8),SUBSTR(MD5(RAND()),1,8),  # 아이디, 비번 -> 숫자, 영어 합쳐서 랜덤 8자리 문자
# FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), # 생일 데이터 랜덤 범위 -> 1980-01-01 00:00:00 ~ 2015-12-31 00:00:00
# floor(rand()*3), # 성별 0, 1, 2
# floor(rand()*5)-2,0); # 상태 -2 ~ 2

## Duration과 Fetch 시간을 비교해보자
# duration: 검색하는 시간/ fetch: 모니터 출력 및 네트워크 전송하는 시간
select * from `user`;
select `name` from `user`;   # 전체 검색 vs 한 컬럼 검색 - 출력할 데이터가 많으면 fetch 시간 더 걸림. 과부하 발생 (한 페이지에 보여주는 게시글의 개수를 제한하는 이유)
select count(*) from `user`;
select pkey from `user`;   # 숫자라서 약간 더 빠름

# 같은 개수의 데이터 검색에서 조회 시간을 줄일 수 있는 방법?
# 출력되는 컬럼의 개수 줄이기 - 컬럼이 언제 필요한지 고려 (아이디와 패스워드는 로그인할 때만, 사용 중인 프로필이미지만 필요한지 전체프로필이미지가 필요한지, snstype는 로그인 형태에 따라, snskey는 snstype이 1 이상일때)
## Index (데이터 조회 알고리즘)
# `user`, `gender` 컬럼 인덱스 생성하기
# `user`, `gender` 컬럼 인덱스의 Cardinality 수치 비교
-- select `gender` from `user` group by `gender`;   # gender 개수 = Cardinality 수치
## 다중 컬럼 인덱스 생성
create index `idx_name_gender` on `user` (`name`, gender);   # name 다음 gender (Cardinality 수치가 높은 순서대로)

-- explain   ## 어떤 index를 사용하였는지 확인 (possible_keys에 idx_name_gender)
select `name`, gender from `user`
use index(`idx_name_gender`)   ## 사용할 인덱스 지정 (조회 시간 단축)
where `name`='ab1d8e3b' and gender=2;