use `database`;

## 테이블 생성
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
CREATE TABLE `Like` (PKey int(4) NOT NULL AUTO_INCREMENT, userID int(4) DEFAULT 0 NOT NULL, contentID int(4) DEFAULT 0 NOT NULL comment '게시글 아이디', commentID int(4) comment '댓글 아이디', `like` int(1), insertDate datetime DEFAULT now() NOT NULL, `type` int(1), PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE `Profile` (PKey int(4) NOT NULL AUTO_INCREMENT, imageName varchar(255), profileMassage varchar(500), `status` int(1) NOT NULL comment '0 not using
1 using
2 no exposure (only see me)
3 delete status (not real deleted)', userFKey int(4) NOT NULL, insertDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE SNSType (PKey int(1) NOT NULL AUTO_INCREMENT, `name` varchar(50) comment 'Kakao, Google, Instagram, Facebook, Naver ...', PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
CREATE TABLE `User` (PKey int(4) NOT NULL AUTO_INCREMENT, `name` char(50), birth date, gender int(1) comment 'null - null, private
0 - female
1 - male', genderPrivate int(1) DEFAULT 0 NOT NULL comment '0은 공개
1은 비공개', phoneNumber varchar(15), email varchar(200), emailCertification int(1) DEFAULT 0 NOT NULL comment '0은 not yet
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

## 데이터 추가
# user 테이블에 snstype 참조키가 있기 때문에 먼저 insert
# PKey는 자동 증가
INSERT INTO `database`.`snstype` (`name`) VALUES ('Email');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Kakao');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Google');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Instagram');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Facebook');
INSERT INTO `database`.`snstype` (`name`) VALUES ('Naver');

# 유저 6명 추가(아이디 가입)
# 다 다르게 insert하기
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`)
VALUES("Cordell","1982-8-23",1,"010-4610-6033","cicef56437@saeoil.com","zpcirdf","OMDyMkRu",0, 1);
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`)
VALUES("Gabriel","1973-10-15",1,"010-5445-0589","vibiran958@saeoil.com","p9v59eu","sjRwxIhy",1, 1);
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`)
VALUES("Alexandro","2007-4-20",0,"010-7950-6803","bodogar948@pixiil.com","h51fi0a","LtIeBdBj",1, 1);
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`)
VALUES("Mustafa","1979-9-4",0,"010-8915-3691","tomen79492@pixiil.com","5t4iuw6","uvJRo3TR",1, 1);
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`)
VALUES("Markus","1976-2-19",1,"010-4142-5881","miyowa6044@pixiil.com","gpp2ujm","RfcoPggv",1, -1);
INSERT INTO `database`.`user` (`name`, `birth`, `gender`, `phoneNumber`, `email`, `id`, `pwd`,`marketing`, `status`)
VALUES("Omer","2001-5-23",0,"010-2845-2043","xacora2844@soombo.com","ofz5k85","zezC2p5k",0, 2);

# 프로필 사진 추가
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("262409.jpg",1,1);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("921815.png",0,2);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("892870.png",1,3);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("488246.png",0,4);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("539162.png",0,5);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("749264.png",1,6);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("165483.png",1,2);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("418471.png",0,4);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("82542.png",1,5);
INSERT INTO `database`.`profile`(`imageName`,`status`,`userFKey`) VALUES("40852.png",1,4);

# 게시글 추가
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("카페에서 어제 산 커피",1,"플라스틱 컵 씻어서 다시 커피 담아도 되나?ㅋㅋ 세균 번식했으려나",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("헐 나 지금 알았는데",2,"해품달이랑 킬미힐이 쓰신 진수완 작가님 우리 학교 선배님이었어..",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("내일 시험 끝나고 첫 수업인데",3,"영화 보는거죠? 과자 뭐 챙겨가지",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("제시라는 이름에는 무슨 성이 제일 잘 어울려?",4,"김제시, 박제시 뭐 이런 거 있잖아. 아무거나 던져줘봐",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("와 나는 진짜 답이 없다.",5,"페트병 버리러 나와서 페트병 말고 핸드폰 버리고 옴. 진짜 한참 찾았네",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("집순이의 기준이 뭐임?",2,"슈퍼가 안 가고 집에만 있는거? 아님 동네 아니면 안 돌아다니는거? 아님 친구들 안 만나는거?",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("퉁퉁이 엄마 이름 모퉁이래 ㅋㅋㅋㅋㅋㅋ",1,"진짜 웃겨ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("나 지금 중국집에서 혼밥 중인데 웃음 참고있어 도와줘",6,"주인 분이 전화받더니 짜장밥에 짜장이 안 갔다구요?함ㅋㅋㅋㅋ",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("우리 강아지 오늘 역대급.. 72번 불렀는데 안 옴",3,"날 뭐로 보는 걸까",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("연기파배우 실력파가수 진짜 웃기지 않냐ㅋㅋ",4,"요리파 주방장도 나올 기세",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("덕우들은",5,"한글 영어 제외하고 개인적으로 가장 매력적인 언어가 뭐라고 생각해?",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("다비치 의리 있다",6,"약속 지키네 언니들 사랑해요",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("강아지 보다가 버스 놓침",5,"주인분이 어이쿠하며 다음 버스 올 때까지 만지게 해주심 행복하다",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("아침에 인문대",3,"몇 시에 문 열어? 8시엔 열리나",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("우이천에 분수 나오는 거 알았어?",4,"나도 오늘 알았음",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("교정하고",1,"재발하는 경우 있어? 유지장치 잘 껴도",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("지금날씨",4,"어떤가요 선생님들..",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("오늘의 메뉴",2,"나오면 후기 좀 알려줄 사람",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("티빙 더디저트",4,"재밌다",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("오늘 날씨",6,"어제랑 비슷해?",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("자연광에서 찍는 사진이",5,"진심 잘 나온다",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("공차 뭐 마실까",4,"추천 좀!!!",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("여권발급",1,"보통 얼마나 걸리려나",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("도플갱어를 만나면 죽는다잖아..",2,"도플갱어 믿어?",1);
INSERT INTO `database`.`board`(`title`,`writer`,`subject`,`postStatus`) VALUES("치킨 주문한지 1시간",1,"지친다ㅎ",1);

## 댓글 대댓글 추가
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(2,"뭐어때 내 눈에 안 보임(지나가던 바이오)",1,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(3,"근데 세제로 씻으면 괜찮을듯?(지나가던 화학)",1,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(4,"덕우의 마음이 편하면 그걸로 됐어(지나가던 심리)",1,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(5,"그냥 새로 사~(지나가던 경영)",1,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(6,"안돼~ 쟤 파산하면 어쩌려구(지나가던 국통)",1,4);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(6,"국문과의 자랑!!",2,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(3,"우와 대박이다. 킬미힐미 재밌었는데",2,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(4,"헐 해품달이...? 대박이네",2,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(5,"드라마화 하신 작가님이실걸? 원작 말고",2,8);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(2,"맞아 드라마로 각본하신 거",2,8);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(6,"맛동산이지",3,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(1,"낼 영화 세얼간이 맞나요?",3,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(6,"하울의 움직이는 성 아니에요?",3,12);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(3,"또 세얼간이야?",3,12);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(1,"선",4,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(6,"ㅋㅋ선제시",4,15);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(3,"ㅋㅋㅋ쓰레기통에 들어가서 찾음?",5,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(5,"쓰레기통에서 하이 빅스비 외쳤다",5,17);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(2,"어디야?하고 물어볼 가치도 없을때",6,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(6,"그걸 셌어?",9,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(1,"해외파 외국인",10,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(3,"불어! 발음이 고급진 느낌",11,0);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(5,"나도 그렇게 생각해!",11,22);
INSERT INTO `database`.`comment`(`writer`,`subject`,`boardFKey`,`parentFKey`) VALUES(2,"연어...부드러워",11,0);


## 조회 
select * from `user`;
select * from `board`;
## 1. 최초에 가입한 유저와 가장 최근에 가입한 유저의 모든 정보를 출력
# 정렬해서 limit 1?
select * from `user` 
where pkey=(select min(pkey) from `user`) or pkey=(select max(pkey) from `user`);
## 2. 모든 유저의 나이와, 평균 나이, 평균 나이 대비 몇 년 차이 나는지 출력
select PKey, year(now())-year(`birth`) as age, 
	(select avg(year(now())-year(`birth`)) from `user`) as avgAge,
	(year(now())-year(`birth`)) - (select avg(year(now())-year(`birth`)) from `user`) as difference
from `user`;
## 3. 모든 유저의 모든 정보와 현재 사용 중인 프로필 이미지를 출력
select `user`.*, `profile`.`imageName` as image 
from `user` 
left join `profile` on `user`.PKey=`profile`.userFKey 
where `profile`.`status`=1
order by PKey asc;
## 4. 현재 가입 중인 유저들 중 여성과 남성이 각각 몇 명인지 출력
select (select count(gender) from `user` where gender = 0) as woman, 
	(select count(gender) from `user` where gender = 1) as man 
from `user` limit 1;
## 5. 차단당한 유저의 마지막 글과 댓글들을 출력
select board.PKey, board.writer, board.title, board.`subject`,
	comment1.PKey as PKey1, comment1.parentFKey, comment1.`subject`,
	comment2.PKey as PKey2, comment2.parentFKey, comment2.`subject` 
from `user`
left join board on `user`.PKey = `board`.writer
left join `comment` comment1 on board.PKey = comment1.boardFKey
left join `comment` comment2 on comment1.PKey = comment2.parentFKey
where `user`.`status` = -1;
## 6. 가장 많은 글을 작성한 유저의 이름과 작성한 글의 개수 출력 (댓글X)
# `user`.`name`이 같은 것끼리 group by해서 count? sum?
select `user`.`name`, (select count(*) from `board` group by `board`.writer order by count(*) desc limit 1) as post
from `user`
left join board on `user`.PKey = `board`.writer;