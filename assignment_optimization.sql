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
INSERT INTO `database`.`snstype` (`name`) VALUES ('Email');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Kakao');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Google');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Instagram');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Facebook');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Naver');

# 유저 추가(아이디 가입)
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`) VALUES
("김민수", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3),"010-4610-6033","cicef56437@saeoil.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("이지은", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3),"010-5445-0589","vibiran958@saeoil.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2), 
("박준호", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3),"010-7950-6803","bodogar948@pixiil.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2), 
("최유리", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3),"010-8915-3691","tomen79492@pixiil.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("정태민", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3),"010-4142-5881","miyowa6044@pixiil.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("김하은", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3),"010-2845-2043","xacora2844@soombo.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("이현우", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-1234-5678", "abc123@gmail.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("박지현", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-9876-5432", "xyz456@hotmail.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("최민재", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-4567-8910", "qwe789@yahoo.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("정수연", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-7890-1234", "rty456@naver.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("김영준", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-6543-2109", "uio123@daum.net", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("이서연", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-3210-9876", "asd789@hanmail.net", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("박성민", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-8765-4321", "fgh456@outlook.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("김지원", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-2468-1357", "bluebird@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("박민수", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-8642-9751", "sunnyday@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("이유진", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-3333-6666", "oceanwave@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("정수빈", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-1591-2483", "stargazer@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("최영희", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-3729-5184", "moonlight@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("윤승민", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-7531-4982", "rainbowsky@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("강예린", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-4516-2398", "greenthumb@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("조도윤", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-7851-6394", "tinydancer@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("장영재", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-3412-6758", "sweetdream@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2),
("남혜진", FROM_UNIXTIME(FLOOR(unix_timestamp('1980-01-01 00:00:00')+(RAND()*(unix_timestamp('2010-12-31 00:00:00')-unix_timestamp('1980-01-01 00:00:00'))))), floor(rand()*3), "010-9274-5816", "secretgarden@example.com", SUBSTR(MD5(RAND()),1,8), SUBSTR(MD5(RAND()),1,8), floor(rand()*2), floor(rand()*5)-2);

# 프로필 사진 추가
INSERT INTO `database`.`profile`(`imageName`,`status`,`userID`) VALUES
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), 
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), 
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), 
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), 
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)),
(CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24)), (CONCAT(SUBSTR(MD5(RAND()),1,6), '.png'), floor(rand()*4), floor(rand()*24));

# 게시글 추가
INSERT INTO `database`.`board`(`title`,`writer`,anonymous,`subject`,`postStatus`,viewCount) VALUES
("카페에서 어제 산 커피",1,floor(rand()*2),"플라스틱 컵 씻어서 다시 커피 담아도 되나?ㅋㅋ 세균 번식했으려나",floor(rand()*5)-2, 132),
("헐 나 지금 알았는데",2,floor(rand()*2),"해품달이랑 킬미힐이 쓰신 진수완 작가님 우리 학교 선배님이었어..",floor(rand()*5)-2, 46),
("내일 시험 끝나고 첫 수업인데",3,floor(rand()*2),"영화 보는거죠? 과자 뭐 챙겨가지",floor(rand()*5)-2, 54),
("제시라는 이름에는 무슨 성이 제일 잘 어울려?",4,floor(rand()*2),"김제시, 박제시 뭐 이런 거 있잖아. 아무거나 던져줘봐",floor(rand()*5)-2, 51),
("와 나는 진짜 답이 없다.",5,floor(rand()*2),"페트병 버리러 나와서 페트병 말고 핸드폰 버리고 옴. 진짜 한참 찾았네",floor(rand()*5)-2, 59),
("집순이의 기준이 뭐임?",2,floor(rand()*2),"슈퍼가 안 가고 집에만 있는거? 아님 동네 아니면 안 돌아다니는거? 아님 친구들 안 만나는거?",floor(rand()*5)-2, 36),
("퉁퉁이 엄마 이름 모퉁이래 ㅋㅋㅋㅋㅋㅋ",1,floor(rand()*2),"진짜 웃겨ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ",floor(rand()*5)-2, 5),
("나 지금 중국집에서 혼밥 중인데 웃음 참고있어 도와줘",6,floor(rand()*2),"주인 분이 전화받더니 짜장밥에 짜장이 안 갔다구요?함ㅋㅋㅋㅋ",floor(rand()*5)-2, 35),
("우리 강아지 오늘 역대급.. 72번 불렀는데 안 옴",3,floor(rand()*2),"날 뭐로 보는 걸까",floor(rand()*5)-2, 46),
("연기파배우 실력파가수 진짜 웃기지 않냐ㅋㅋ",4,floor(rand()*2),"요리파 주방장도 나올 기세",floor(rand()*5)-2, 31),
("덕우들은",5,floor(rand()*2),"한글 영어 제외하고 개인적으로 가장 매력적인 언어가 뭐라고 생각해?",floor(rand()*5)-2, 56),
("다비치 의리 있다",6,floor(rand()*2),"약속 지키네 언니들 사랑해요",floor(rand()*5)-2, 24),
("강아지 보다가 버스 놓침",5,floor(rand()*2),"주인분이 어이쿠하며 다음 버스 올 때까지 만지게 해주심 행복하다",floor(rand()*5)-2, 32),
("아침에 인문대",3,floor(rand()*2),"몇 시에 문 열어? 8시엔 열리나",floor(rand()*5)-2, 5),
("우이천에 분수 나오는 거 알았어?",4,floor(rand()*2),"나도 오늘 알았음",floor(rand()*5)-2, 3),
("교정하고",1,floor(rand()*2),"재발하는 경우 있어? 유지장치 잘 껴도",floor(rand()*5)-2, 3),
("지금날씨",4,floor(rand()*2),"어떤가요 선생님들..",floor(rand()*5)-2, 4),
("오늘의 메뉴",2,floor(rand()*2),"나오면 후기 좀 알려줄 사람",floor(rand()*5)-2, 6),
("티빙 더디저트",4,floor(rand()*2),"재밌다",floor(rand()*5)-2,6),
("오늘 날씨",6,floor(rand()*2),"어제랑 비슷해?",floor(rand()*5)-2, 9),
("자연광에서 찍는 사진이",5,floor(rand()*2),"진심 잘 나온다",floor(rand()*5)-2, 4),
("공차 뭐 마실까",4,floor(rand()*2),"추천 좀!!!",floor(rand()*5)-2, 26),
("여권발급",1,floor(rand()*2),"보통 얼마나 걸리려나",floor(rand()*5)-2, 16),
("도플갱어를 만나면 죽는다잖아..",2,floor(rand()*2),"도플갱어 믿어?",floor(rand()*5)-2, 5),
("치킨 주문한지 1시간",1,floor(rand()*2),"지친다ㅎ",floor(rand()*5)-2, 16),
('Title 1', FLOOR(RAND()*24), floor(rand()*2), 'Content 1', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 2', FLOOR(RAND()*24), floor(rand()*2), 'Content 2', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 3', FLOOR(RAND()*24), floor(rand()*2), 'Content 3', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 4', FLOOR(RAND()*24), floor(rand()*2), 'Content 4', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 5', FLOOR(RAND()*24), floor(rand()*2), 'Content 5', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 6', FLOOR(RAND()*24), floor(rand()*2), 'Content 6', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 7', FLOOR(RAND()*24), floor(rand()*2), 'Content 7', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 8', FLOOR(RAND()*24), floor(rand()*2), 'Content 8', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 9', FLOOR(RAND()*24), floor(rand()*2),'Content 9', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 10', FLOOR(RAND()*24), floor(rand()*2), 'Content 10', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 11', FLOOR(RAND()*24), floor(rand()*2), 'Content 11', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 12', FLOOR(RAND()*24), floor(rand()*2),'Content 12', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 13', FLOOR(RAND()*24), floor(rand()*2),'Content 13', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 14', FLOOR(RAND()*24), floor(rand()*2),'Content 14', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 15', FLOOR(RAND()*24), floor(rand()*2), 'Content 15', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 16', FLOOR(RAND()*24), floor(rand()*2), 'Content 16', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 17', FLOOR(RAND()*24), floor(rand()*2), 'Content 17', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 18', FLOOR(RAND()*24), floor(rand()*2), 'Content 18', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 19', FLOOR(RAND()*24), floor(rand()*2), 'Content 19', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 20', FLOOR(RAND()*24), floor(rand()*2), 'Content 20', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 21', FLOOR(RAND()*24), floor(rand()*2), 'Content 21', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 22', FLOOR(RAND()*24), floor(rand()*2), 'Content 22', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 23', FLOOR(RAND()*24), floor(rand()*2), 'Content 23', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 24', FLOOR(RAND()*24), floor(rand()*2), 'Content 24', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 25', FLOOR(RAND()*24), floor(rand()*2), 'Content 25', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 26', FLOOR(RAND()*24), floor(rand()*2), 'Content 26', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 27', FLOOR(RAND()*24), floor(rand()*2), 'Content 27', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 28', FLOOR(RAND()*24), floor(rand()*2), 'Content 28', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 29', FLOOR(RAND()*24), floor(rand()*2), 'Content 29', FLOOR(RAND()*5)-2, FLOOR(RAND()*100)),
('Title 30', FLOOR(RAND()*24), floor(rand()*2),'Content 30', FLOOR(RAND()*5)-2, FLOOR(RAND()*100));

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
(3,"불어! 발음이 고급진 느낌",11,0,floor(rand()*5)-2), (2,"연어...부드러워",11,0,floor(rand()*5)-2), (2,"ㅋㅋㅋ그래도 다행이네",13,0,floor(rand()*5)-2),
(FLOOR(RAND()*24), 'subject 1', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 2', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 3', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 4', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 5', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 6', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 7', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 8', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 9', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 10', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 11', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 12', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 13', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 14', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 15', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 16', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 17', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 18', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 19', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 20', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 21', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 22', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 23', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 24', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 25', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 26', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 27', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 28', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 29', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 30', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 31', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 32', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 33', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 34', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 35', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 36', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 37', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 38', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 39', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 40', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 41', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 42', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 43', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 44', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 45', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 46', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 47', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 48', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 49', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2),
(FLOOR(RAND()*24), 'subject 50', FLOOR(RAND()*56), FLOOR(RAND()*3), FLOOR(RAND()*5)-2);

# 게시글이나 댓글에 좋아요를 누른 사람 추가
INSERT INTO `database`.`like` (`userID`,`contentID`,`commentID`) VALUES
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), (floor(rand()*24),floor(rand()*26),0), 
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),
(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25)),(floor(rand()*24),0,floor(rand()*25));


## 1. 게시판 테이블과, 댓글 테이블을 최적화하고 인덱스가 처리된 컬럼과 처리되지 않은 컬럼들을 선택한 이유에 대해 각각 설명하시오(날짜 데이터는 제외)
create index `idx_board_writer` on `board` (`writer`);
create index `idx_comment_boardFKey` on `comment` (`boardFKey`);
# 게시판 테이블에서 writer 컬럼을 보조인덱스로 설정하였다. 사용자의 게시글 내역을 확인할 때와 특정 글쓴이의 글을 검색하는 등의 주요 기능을 사용할 때, 다른 컬럼보다 사용자 기준으로 정렬된 인덱스 테이블에서 조회하는 것이 빠를 것이라고 생각하였다. 
# 댓글 테이블에서는 boardFKey 컬럼을 보조인덱스로 설정하였다. 게시글에 들어가서 댓글을 불러올 때를 고려하였을 때, 다른 컬럼보다 게시글참조키를 기준으로 정렬된 인덱스 테이블에서 각 게시글에 달린 댓글들을 불러오는 것이 가장 적합하다고 생각하였다.


## 2. 적극적으로 활동하는 유저 순으로 정렬하고 출력
select `name`, (select count(*) from `board` where `user`.PKey = `board`.writer) as 'board', 
	(select count(*) from `comment` where `user`.PKey = `comment`.writer) as 'comment', 
    (select count(*) from `like` where `user`.PKey = `like`.userID) as 'like', 
    (select count(*) from `board` where `user`.PKey = `board`.writer)+(select count(*) from `comment` where `user`.PKey = `comment`.writer)+(select count(*) from `like` where `user`.PKey = `like`.userID) as total
from `user`
order by total desc;
-- 출력 결과
-- name, board, comment, like, total
-- '이지은', '5', '10', '9', '24'
-- '박준호', '5', '7', '11', '23'
-- '정태민', '6', '4', '11', '21'
-- '김하은', '4', '8', '8', '20'
-- '최유리', '7', '4', '7', '18'
-- '김민수', '6', '4', '4', '14'
-- '김지원', '3', '3', '6', '12'
-- '최영희', '0', '2', '10', '12'
-- '정수연', '2', '2', '6', '10'
-- '박민수', '3', '3', '4', '10'
-- '박성민', '2', '2', '5', '9'
-- '이유진', '0', '3', '6', '9'
-- '윤승민', '3', '0', '6', '9'
-- '장영재', '3', '2', '4', '9'
-- '남혜진', '1', '3', '5', '9'
-- '박지현', '2', '2', '4', '8'
-- '김영준', '2', '2', '4', '8'
-- '조도윤', '0', '2', '6', '8'
-- '이현우', '0', '2', '5', '7'
-- '이서연', '1', '1', '5', '7'
-- '정수빈', '0', '2', '5', '7'
-- '최민재', '0', '1', '5', '6'
-- '강예린', '0', '3', '3', '6'


## 3. 가입자들의 성별 나이 별 개수 출력하고, 연령, 성별 순으로 정렬 (미해결)
select gender, count(*) as 'count', age
from (select gender, year(now())-year(`birth`) as age from `user` order by age) as subquery
group by age, gender
order by age;
-- 출력 결과
-- gender, count, age
-- '2', '2', '14'
-- '1', '1', '15'
-- '0', '1', '16'
-- '1', '1', '17'
-- '0', '1', '19'
-- '1', '1', '19'
-- '0', '2', '21'
-- '1', '1', '21'
-- '2', '1', '22'
-- '2', '2', '23'
-- '0', '1', '24'
-- '1', '1', '24'
-- '0', '1', '25'
-- '2', '1', '29'
-- '1', '1', '33'
-- '2', '1', '36'
-- '0', '1', '37'
-- '2', '1', '37'
-- '2', '1', '38'
-- '0', '1', '42'


## 4. 뷰 카운트가 가장 높은 글 중 상위 5개의 글 출력
select (select `name` from `user` where `board`.writer = `user`.PKey) as 'name', title, viewCount, (select count(writer) from `comment` where `board`.PKey = `comment`.`boardFKey`) as 'comment'
from `board`
order by viewCount desc limit 5;
-- 출력 결과
-- name, title, viewCount, comment
-- '김민수', '카페에서 어제 산 커피', '132', '6'
-- '정수연', 'Title 5', '99', '1'
-- '박민수', 'Title 20', '96', '0'
-- '김지원', 'Title 24', '92', '0'
-- '박지현', 'Title 23', '91', '0'


## 5. 좋아요를 가장 많이 받은 글 출력
select (select `name` from `user` where `board`.writer = `user`.PKey) as 'name', title, viewCount, 
	(select count(`contentID`) from `like` where `board`.PKey = `like`.`contentID`) as 'like'
from `board`
order by `like` desc limit 1;
-- 출력 결과
-- name, title, viewCount, like
-- '이지은', '헐 나 지금 알았는데', '46', '5'


## 6. 1~10번 유저가 작성한 글과 댓글 중 차단당하거나 삭제되지 않은 글의 개수 출력
select `name`, (select count(postStatus) from `board` where `board`.writer = `user`.PKey and `postStatus` >= 0) as board, 
	(select count(writer) from `comment` where `comment`.writer = `user`.PKey and `postStatus` >= 0) as 'comment'
from `user`
where PKey <= 10;
-- 출력 결과
-- name, board, comment
-- '김민수', '5', '2'
-- '이지은', '3', '5'
-- '박준호', '4', '5'
-- '최유리', '5', '4'
-- '정태민', '3', '2'
-- '김하은', '3', '6'
-- '이현우', '0', '1'
-- '박지현', '2', '1'
-- '최민재', '0', '0'
-- '정수연', '0', '1'