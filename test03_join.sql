use univ;

CREATE TABLE Board (pkey int(4) NOT NULL AUTO_INCREMENT, title varchar(255), `subject` text, writer int(4) NOT NULL, insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, view_count int(4) DEFAULT 0 NOT NULL, `status` int(1) NOT NULL comment '-2 delete
-1 block
0 temp save
1 appear
2 disappear', PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE BoardImage (pkey int(4) NOT NULL AUTO_INCREMENT, board_id int(4) NOT NULL, `name` varchar(255), `order` int(2), insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE `Like` (pkey int(4) NOT NULL AUTO_INCREMENT, user_id int(4) NOT NULL, content_id int(4) NOT NULL, `like` int(1), insert_date datetime DEFAULT now() NOT NULL, `type` int(1), PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE `Profile` (pkey int(4) NOT NULL AUTO_INCREMENT, image varchar(255), `profile` varchar(500) comment '상태글', `status` int(1) DEFAULT 0 NOT NULL comment '0 not using
1 current using
2 disappear(나만보기)
3 drop(delete 아님)

동시에 두 개의 상태가 될 수 없음', userFKey int(4) NOT NULL, insertDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE reply (pkey int(4) NOT NULL AUTO_INCREMENT, board_id int(4) NOT NULL, parent_id int(4) NOT NULL, writer int(4) NOT NULL, reply varchar(500), `status` int(1) DEFAULT 1 NOT NULL comment '-2 delete
-1 block
1 appear
2 disappear', insert_date datetime DEFAULT now() NOT NULL, update_date datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE sns_type (pkey int(1) NOT NULL AUTO_INCREMENT, `name` varchar(50) comment 'naver, kakao, instagram, facebook, apple ...', PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE `user` (PKey int(4) NOT NULL AUTO_INCREMENT, `name` varchar(50), id varchar(50), pwd varchar(100), birth date, email varchar(100), certificatedEmail int(1) DEFAULT 0 NOT NULL comment '0은 not yet
1은 certificated', certificatedDate datetime NULL, gender int(1) DEFAULT 0 NOT NULL comment '0은 입력 안 함
1은 여성
2는 남성', snsKey varchar(50), snsType int(1) NOT NULL, insertDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, lastestLoginDate datetime NULL, privacyAgreementDate datetime NULL, privacyVersion int(1), `status` int(1) DEFAULT 0 NOT NULL comment '가입상태
-2는 탈퇴 (resign)
-1은 차단 (block)
0은 가입 전 (before register)
1은 가입완료 (register)
2는 휴면 (sleep)', PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
# insert 편의성을 위해 참조키 무시
-- ALTER TABLE `Profile` ADD INDEX FKProfile360077 (userFKey), ADD CONSTRAINT FKProfile360077 FOREIGN KEY (userFKey) REFERENCES `user` (PKey);
-- ALTER TABLE `user` ADD INDEX FKuser639360 (snsType), ADD CONSTRAINT FKuser639360 FOREIGN KEY (snsType) REFERENCES sns_type (pkey);
-- ALTER TABLE Board ADD INDEX FKBoard160914 (writer), ADD CONSTRAINT FKBoard160914 FOREIGN KEY (writer) REFERENCES `user` (PKey);
-- ALTER TABLE BoardImage ADD INDEX FKBoardImage383511 (board_id), ADD CONSTRAINT FKBoardImage383511 FOREIGN KEY (board_id) REFERENCES Board (pkey);
-- ALTER TABLE reply ADD INDEX FKreply966445 (board_id), ADD CONSTRAINT FKreply966445 FOREIGN KEY (board_id) REFERENCES Board (pkey);
-- ALTER TABLE reply ADD INDEX FKreply396353 (parent_id), ADD CONSTRAINT FKreply396353 FOREIGN KEY (parent_id) REFERENCES reply (pkey);
-- ALTER TABLE reply ADD INDEX FKreply115522 (writer), ADD CONSTRAINT FKreply115522 FOREIGN KEY (writer) REFERENCES `user` (PKey);
-- ALTER TABLE `Like` ADD INDEX FKLike706698 (user_id), ADD CONSTRAINT FKLike706698 FOREIGN KEY (user_id) REFERENCES `user` (PKey);
-- ALTER TABLE `Like` ADD INDEX FKLike719579 (content_id), ADD CONSTRAINT FKLike719579 FOREIGN KEY (content_id) REFERENCES Board (pkey);

# user 테이블의 snsType컬럼 참조 무결성 방지
# sns type
INSERT INTO `univ`.`sns_type`(`name`) VALUES("email");   # 이메일 가입 
INSERT INTO `univ`.`sns_type`(`name`) VALUES("naver");
INSERT INTO `univ`.`sns_type`(`name`) VALUES("kakao");
INSERT INTO `univ`.`sns_type`(`name`) VALUES("google");
select * from `sns_type`;

# user 회원가입
INSERT INTO `univ`.`user`(`name`,`id`,`pwd`,`birth`,`email`,`gender`,`status`,`snsKey`,`snsType`)
VALUES("name01","id01","pwd01","2001-12-11","name01@naver.com",1,1,"",1);
INSERT INTO `univ`.`user`(`name`,`id`,`pwd`,`birth`,`email`,`gender`,`status`,`snsKey`,`snsType`)
VALUES("name02","id02","pwd02","2005-08-17","name02@gmail.com",1,-1,"",1);
INSERT INTO `univ`.`user`(`name`,`id`,`pwd`,`birth`,`email`,`gender`,`status`,`snsKey`,`snsType`)
VALUES("name03","id03","pwd03","1974-01-04","name03@gmail.com",1,1,"",1);
select * from `user`;

# 2번 유저 게시글 작성
INSERT INTO `univ`.`board`(`title`,`subject`,`writer`,`view_count`,`status`) VALUES("스즈메 재미없다","ㅈㄱㄴ",2,55,-1);
select * from `board`;
# 1번 글에 대한 댓글, 대댓글
INSERT INTO `univ`.`reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`) VALUES(1,0,3,"재밌던데",1);
INSERT INTO `univ`.`reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`) VALUES(1,0,1,"솔직히 노잼...",1);
INSERT INTO `univ`.`reply`(`board_id`,`parent_id`,`writer`,`reply`,`status`) VALUES(1,1,2,"노잼",1);
select * from `reply`;

# 2번 유저가 작성한 게시글 불러오기
select `user`.`name`, board.title, board.`subject` from `user`, board   # 유저 이름과 게시글 제목, 글 불러오기
where `user`.pkey = board.writer;