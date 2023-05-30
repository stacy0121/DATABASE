use `database`;

## 테이블 생성 쿼리
CREATE TABLE Board (PKey int(4) NOT NULL AUTO_INCREMENT, title char(255), writer int(4) NOT NULL, anonymous int(1) DEFAULT 0 NOT NULL comment '0 - public
1 - anonymous', `subject` text, createdDate datetime DEFAULT now() NOT NULL, updatedDate datetime NULL, readLevel int(1) DEFAULT 1 NOT NULL comment '글을 읽을 수 있는 레벨
user 테이블의 level을 참고하여
1 - 1 or more
2 - 2 or more
3 - 3 or more', postStatus int(1) DEFAULT 0 NOT NULL comment '-2 delete
-1 block
0 temp save
1 appear
2 disappear', viewCount int(4) DEFAULT 0 NOT NULL comment '조회수', PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE BoardImage (PKey int(4) NOT NULL AUTO_INCREMENT, boardID int(4) DEFAULT 0 NOT NULL, commentID int(4), `name` varchar(255), `order` int(2), insertDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE `Comment` (PKey int(4) NOT NULL AUTO_INCREMENT, writer int(4) NOT NULL, anonymous int(1) DEFAULT 1 comment '0 - public
1 - anonymous', `subject` varchar(500), createdDate datetime DEFAULT now() NOT NULL, updatedDate datetime NULL, boardFKey int(4) NOT NULL comment '댓글이 속한 게시글 참조', parentFKey int(4) NOT NULL comment '대댓글이 속한 상위 댓글', postStatus int(1) DEFAULT 1 NOT NULL comment '-2 delete
-1 block
1 appear
2 disappear', PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE `Like` (PKey int(4) NOT NULL AUTO_INCREMENT, userID int(4) DEFAULT 0 NOT NULL, contentID int(4) DEFAULT 0 NOT NULL comment '게시글 아이디', commentID int(4) comment '댓글 아이디', insertDate datetime DEFAULT now() NOT NULL, PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE `Profile` (PKey int(4) NOT NULL AUTO_INCREMENT, imageName varchar(255), profileMassage varchar(500), `status` int(1) NOT NULL comment '0 not using
1 using
2 no exposure (only see me)
3 delete status (not real deleted)', userID int(4) NOT NULL, insertDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE SNSType (PKey int(1) NOT NULL AUTO_INCREMENT, `name` varchar(50) comment 'Kakao, Google, Instagram, Facebook, Naver ...', PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE `User` (PKey int(4) NOT NULL AUTO_INCREMENT, `name` char(50), birth date, gender int(1) comment '0 - private
1 - female
2 - male', phoneNumber varchar(15), email varchar(200), emailCertification int(1) DEFAULT 0 NOT NULL comment '0은 not yet
1은 certificated', emailCertificatedDate datetime NULL, id char(50) comment 'null은 sns가입 시', pwd char(150), pwd2 char(150), pwdHint char(30), pwdAnswer varchar(200), dateChangedPWD datetime NULL, marketing int(1) NOT NULL comment '마케팅동의 여부
0 - agree
1 - disagree', smsMarketing int(1) comment 'null은 동의
0은 비동의', appMarketing int(1) comment 'null은 동의
0은 비동의', emailMarketing int(1) comment 'null은 동의
0은 비동의', joinDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, lastestActivityDate datetime DEFAULT now() NOT NULL, privacyUsageDate datetime NULL, privacyUsageVersion int(1) DEFAULT 23.2 NOT NULL comment '개인정보이용동의 내용 버전', `status` int(1) DEFAULT 0 NOT NULL comment '가입상태
-2는 탈퇴 (resign)
-1은 차단 (block)
0은 가입 전 (before register) - 이메일 미인증
1은 가입완료 (register)
2는 휴면 (sleep', `level` int(1) DEFAULT 1 NOT NULL comment '1 - level1
2 - level2
3 - level3
.
.
.', snsKey varchar(50), snsType int(1) DEFAULT 1 NOT NULL, snsFirstLogin int(1) DEFAULT 0 NOT NULL comment 'sns 최초 로그인 여부
0 - sns 로그인 안 함
1 - first login
2 - not first login', PRIMARY KEY (PKey), UNIQUE INDEX (PKey));

## 데이터 추가 쿼리
# user 테이블에 snstype 참조키가 있기 때문에 먼저 insert
# PKey는 자동 증가
INSERT INTO `database`.`snstype` (`name`) VALUES ('Email');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Kakao');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Google');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Instagram');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Facebook');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Naver');

select * from `user`;
# 유저 6명 추가(아이디 가입)
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`) VALUES
("김민수","1982-8-23", 1,"010-4610-6033","cicef56437@saeoil.com","zpcirdf","OMDyMkRu",0, 1),
("이지은","1973-10-15",1,"010-5445-0589","vibiran958@saeoil.com","p9v59eu","sjRwxIhy",1, 1), 
("박준호","2007-4-20", 0,"010-7950-6803","bodogar948@pixiil.com","h51fi0a","LtIeBdBj",1, 1), 
("최유리","1979-9-4",  0,"010-8915-3691","tomen79492@pixiil.com","5t4iuw6","uvJRo3TR",1, 1),
("정태민","1976-2-19", 1,"010-4142-5881","miyowa6044@pixiil.com","gpp2ujm","RfcoPggv",1, -1),
("김하은","2001-5-23", 0,"010-2845-2043","xacora2844@soombo.com","ofz5k85","zezC2p5k",0, 2),
("이현우", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-1234-5678", "abc123@gmail.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), 0, floor(rand()*5)-2),
("박지현", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-9876-5432", "xyz456@hotmail.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), 0, floor(rand()*5)-2),
("최민재", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-4567-8910", "qwe789@yahoo.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), 0, floor(rand()*5)-2),
("정수연", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-7890-1234", "rty456@naver.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), 0, floor(rand()*5)-2),
("김영준", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-6543-2109", "uio123@daum.net", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), 0, floor(rand()*5)-2),
("이서연", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-3210-9876", "asd789@hanmail.net", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), 0, floor(rand()*5)-2),
("박성민", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2015-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-8765-4321", "fgh456@outlook.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), 0, floor(rand()*5)-2)
;

# 프로필 사진 추가
INSERT INTO `database`.`profile`(`imageName`,`status`,`userID`) VALUES
("262409.jpg",1,1), ("921815.png",0,2), ("892870.png",1,3), ("488246.png",0,4), ("539162.png",0,5), ("749264.png",1,6),
("165483.png",1,2), ("418471.png",0,4), ("82542.png",1,5), ("40852.png",1,4)
;

# 게시글 추가
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`, viewCount) VALUES
("카페에서 어제 산 커피",1,"플라스틱 컵 씻어서 다시 커피 담아도 되나?ㅋㅋ 세균 번식했으려나",floor(rand()*5)-2, 132),
("헐 나 지금 알았는데",2,"해품달이랑 킬미힐이 쓰신 진수완 작가님 우리 학교 선배님이었어..",floor(rand()*5)-2, 46),
("내일 시험 끝나고 첫 수업인데",3,"영화 보는거죠? 과자 뭐 챙겨가지",floor(rand()*5)-2, 54),
("제시라는 이름에는 무슨 성이 제일 잘 어울려?",4,"김제시, 박제시 뭐 이런 거 있잖아. 아무거나 던져줘봐",floor(rand()*5)-2, 51),
("와 나는 진짜 답이 없다.",5,"페트병 버리러 나와서 페트병 말고 핸드폰 버리고 옴. 진짜 한참 찾았네",floor(rand()*5)-2, 59),
("집순이의 기준이 뭐임?",2,"슈퍼가 안 가고 집에만 있는거? 아님 동네 아니면 안 돌아다니는거? 아님 친구들 안 만나는거?",floor(rand()*5)-2, 36),
("퉁퉁이 엄마 이름 모퉁이래 ㅋㅋㅋㅋㅋㅋ",1,"진짜 웃겨ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ",floor(rand()*5)-2, 5),
("나 지금 중국집에서 혼밥 중인데 웃음 참고있어 도와줘",6,"주인 분이 전화받더니 짜장밥에 짜장이 안 갔다구요?함ㅋㅋㅋㅋ",floor(rand()*5)-2, 35),
("우리 강아지 오늘 역대급.. 72번 불렀는데 안 옴",3,"날 뭐로 보는 걸까",floor(rand()*5)-2, 46),
("연기파배우 실력파가수 진짜 웃기지 않냐ㅋㅋ",4,"요리파 주방장도 나올 기세",floor(rand()*5)-2, 31),
("덕우들은",5,"한글 영어 제외하고 개인적으로 가장 매력적인 언어가 뭐라고 생각해?",floor(rand()*5)-2, 56),
("다비치 의리 있다",6,"약속 지키네 언니들 사랑해요",floor(rand()*5)-2, 24),
("강아지 보다가 버스 놓침",5,"주인분이 어이쿠하며 다음 버스 올 때까지 만지게 해주심 행복하다",floor(rand()*5)-2, 32),
("아침에 인문대",3,"몇 시에 문 열어? 8시엔 열리나",floor(rand()*5)-2, 5),
("우이천에 분수 나오는 거 알았어?",4,"나도 오늘 알았음",floor(rand()*5)-2, 3),
("교정하고",1,"재발하는 경우 있어? 유지장치 잘 껴도",floor(rand()*5)-2, 3),
("지금날씨",4,"어떤가요 선생님들..",floor(rand()*5)-2, 4),
("오늘의 메뉴",2,"나오면 후기 좀 알려줄 사람",floor(rand()*5)-2, 6),
("티빙 더디저트",4,"재밌다",floor(rand()*5)-2,6),
("오늘 날씨",6,"어제랑 비슷해?",floor(rand()*5)-2, 9),
("자연광에서 찍는 사진이",5,"진심 잘 나온다",floor(rand()*5)-2, 4),
("공차 뭐 마실까",4,"추천 좀!!!",floor(rand()*5)-2, 26),
("여권발급",1,"보통 얼마나 걸리려나",floor(rand()*5)-2, 16),
("도플갱어를 만나면 죽는다잖아..",2,"도플갱어 믿어?",floor(rand()*5)-2, 5),
("치킨 주문한지 1시간",1,"지친다ㅎ",floor(rand()*5)-2, 16)
;
# 댓글 대댓글 추가
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`, postStatus) VALUES
(2,"뭐어때 내 눈에 안 보임(지나가던 바이오)",1,0,floor(rand()*5)-2),
(3,"근데 세제로 씻으면 괜찮을듯?(지나가던 화학)",1,0,floor(rand()*5)-2),
(4,"덕우의 마음이 편하면 그걸로 됐어(지나가던 심리)",1,0,floor(rand()*5)-2),
(5,"그냥 새로 사~(지나가던 경영)",1,0,floor(rand()*5)-2),
(6,"안돼~ 쟤 파산하면 어쩌려구(지나가던 국통)",1,4,floor(rand()*5)-2),
(6,"국문과의 자랑!!",2,0,floor(rand()*5)-2),
(3,"우와 대박이다. 킬미힐미 재밌었는데",2,0,floor(rand()*5)-2),(4,"헐 해품달이...? 대박이네",2,0,floor(rand()*5)-2),(5,"드라마화 하신 작가님이실걸? 원작 말고",2,8,floor(rand()*5)-2),
(2,"맞아 드라마로 각본하신 거",2,8,floor(rand()*5)-2),
(4,"맛동산이지",3,0,floor(rand()*5)-2),(1,"낼 영화 세얼간이 맞나요?",3,0,floor(rand()*5)-2),(6,"하울의 움직이는 성 아니에요?",3,12,floor(rand()*5)-2),(3,"또 세얼간이야?",3,12,floor(rand()*5)-2), 
(1,"선",4,0,floor(rand()*5)-2),(6,"ㅋㅋ선제시",4,15,floor(rand()*5)-2),
(3,"ㅋㅋㅋ쓰레기통에 들어가서 찾음?",5,0,floor(rand()*5)-2), (5,"쓰레기통에서 하이 빅스비 외쳤다",5,17,floor(rand()*5)-2),(2,"어디야?하고 물어볼 가치도 없을때",6,0,floor(rand()*5)-2), (6,"그걸 셌어?",9,0,floor(rand()*5)-2), 
(1,"해외파 외국인",10,0,floor(rand()*5)-2),
(3,"불어! 발음이 고급진 느낌",11,0,floor(rand()*5)-2), (2,"연어...부드러워",11,0,floor(rand()*5)-2), (2,"ㅋㅋㅋ그래도 다행이네",13,0,floor(rand()*5)-2)
;
# 게시글이나 댓글에 좋아요를 누른 사람 추가
INSERT INTO `database`.`like` (`userID`,`contentID`,`commentID`) VALUES
(2,1,0), (3,1,0), (1,1,0), (4,1,0), (6,1,0),(5,1,0),(6,1,0),(3,2,0),(2,2,0),(4,2,0),(2,2,0),(1,3,0),(2,3,0),(3,3,0),
(4,4,0),(5,4,0),(6,4,0),(1,5,0),(2,5,0),(3,5,0),(4,5,0),(6,5,0),
(2,0,7),(3,0,7),(4,0,7),(5,0,8),(4,0,14),(3,0,14),(2,0,14),(1,0,14),(5,0,14),(6,0,14),(5,0,21),(6,0,21),(2,0,6),
(5,0,6),(2,0,6),(3,0,6),(4,0,6),(2,0,7),(3,0,7),(2,0,7),(2,0,8),(4,0,8),(5,0,8),(6,0,8),(7,0,8),(2,0,2),(4,0,1),(5,0,1)
;

select * from `user`;
## 1. 게시판 테이블과, 댓글 테이블을 최적화하고 인덱스가 처리된 컬럼과 처리되지 않은 컬럼들을 선택한 이유에 대해 각각 설명하시오(날짜 데이터는 제외)
create index `idx_board_writer` on `board` (`writer`);
create index `idx_comment_boardFKey` on `comment` (`boardFKey`);
# 중복률이 낮다고 생각됨. 사용자의 게시글을 모아서 볼 때 편리할 것 같아서.
# 게시글의 댓글을 불러올 때 boardFKey로 정렬된 인덱스 테이블에서 불러오는 것이 편리할 것 같아서.

## 2. 적극적으로 활동하는 유저 순으로 정렬하고 출력
select `name`, (select count(*) from `board` where `user`.PKey = `board`.writer) as 'board', 
	(select count(*) from `comment` where `user`.PKey = `comment`.writer) as 'comment', 
    (select count(*) from `like` where `user`.PKey = `like`.userID) as 'like', 
    (select count(*) from `board` where `user`.PKey = `board`.writer)
    +(select count(*) from `comment` where `user`.PKey = `comment`.writer)
    +(select count(*) from `like` where `user`.PKey = `like`.userID) as total
from `user`
order by total desc;
-- 출력 결과
-- name, board, comment, like, total
-- '이지은', '4', '5', '13', '22'
-- '최유리', '6', '2', '9', '17'
-- '박준호', '3', '5', '8', '16'
-- '정태민', '4', '4', '8', '16'
-- '김하은', '3', '6', '7', '16'
-- '김민수', '5', '3', '4', '12'
-- '이현우', '0', '0', '1', '1'
-- '박지현', '0', '0', '0', '0'
-- '최민재', '0', '0', '0', '0'
-- '정수연', '0', '0', '0', '0'
-- '김영준', '0', '0', '0', '0'
-- '이서연', '0', '0', '0', '0'
-- '박성민', '0', '0', '0', '0'

## 3. 가입자들의 성별 나이 별 개수 출력하고, 연령, 성별 순으로 정렬 (미해결)
select gender, count(gender) as 'count', age
from (select gender, year(now())-year(`birth`) as age from `user` order by age) as subquery
group by gender, age
order by age
;
-- 출력 결과
-- gender, count, age
-- '0', '1', '15'
-- '0', '1', '16'
-- '0', '1', '22'
-- '2', '1', '22'
-- '1', '1', '34'
-- '2', '1', '35'
-- '1', '1', '37'
-- '0', '1', '40'
-- '1', '1', '41'
-- '2', '1', '43'
-- '0', '1', '44'
-- '1', '1', '47'
-- '1', '1', '50'

select count(gender) from `user` group by year(now())-year(`birth`) ;

## 4. 뷰 카운트가 가장 높은 글 중 상위 5개의 글 출력
select (select `name` from `user` where `board`.writer = `user`.PKey) as 'name', title, viewCount, (select count(writer) from `comment` where `board`.PKey = `comment`.`boardFKey`) as 'comment'
from `board`
order by viewCount desc limit 5;
-- 출력 결과
-- name, title, viewCount, comment
-- '김민수', '카페에서 어제 산 커피',                  '132', '5'
-- '정태민', '와 나는 진짜 답이 없다.',                '59',  '2'
-- '정태민', '덕우들은',                            '56',  '3'
-- '박준호', '내일 시험 끝나고 첫 수업인데',             '54',  '4'
-- '최유리', '제시라는 이름에는 무슨 성이 제일 잘 어울려?', '51',  '2'

## 5. 좋아요를 가장 많이 받은 글 출력
select (select `name` from `user` where `board`.writer = `user`.PKey) as 'name', title, viewCount, (select count(`contentID`) from `like` where `board`.PKey = `like`.`contentID`) as 'like'
from `board`
order by `like` desc limit 1;
-- 출력 결과
-- name, title, viewCount, like
-- '김민수', '카페에서 어제 산 커피', '132', '7'

## 6. 1~10번 유저가 작성한 글과 댓글 중 차단당하거나 삭제되지 않은 글의 개수 출력
select `name`, (select count(postStatus) from `board` where `board`.writer = `user`.PKey and `postStatus` >= 0) as board, (select count(writer) from `comment` where `comment`.writer = `user`.PKey and `postStatus` >= 0) as 'comment'
from `user`
where `name` <= 10
;
-- 출력 결과
-- name, board, comment
-- '김민수', '4', '1'
-- '이지은', '2', '3'
-- '박준호', '2', '5'
-- '최유리', '3', '2'
-- '정태민', '3', '2'
-- '김하은', '1', '2'
-- '이현우', '0', '0'
-- '박지현', '0', '0'
-- '최민재', '0', '0'
-- '정수연', '0', '0'
-- '김영준', '0', '0'
-- '이서연', '0', '0'
-- '박성민', '0', '0'
