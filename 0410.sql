use univ;

CREATE TABLE `Profile` (pkey int(4) NOT NULL AUTO_INCREMENT, image varchar(255), `profile` varchar(500) comment '상태글', status int(1) DEFAULT 0 NOT NULL comment '0 사용안함
1 사용중
2 노출안함(나만보기)
3 삭제(delete 아님)

동시에 두 개의 상태가 될 수 없음', userFKey int(4) NOT NULL, insertDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE sns_type (pkey int(1) NOT NULL AUTO_INCREMENT, `name` varchar(50) comment 'naver, kakao, instagram, facebook, apple ...', PRIMARY KEY (pkey), UNIQUE INDEX (pkey));
CREATE TABLE `user` (PKey int(4) NOT NULL AUTO_INCREMENT, `name` varchar(50), id varchar(50), pwd varchar(100), birth date, profileImage varchar(255), email varchar(100), certificatedEmail int(1) DEFAULT 0 NOT NULL comment '0은 not yet
1은 certificated', certificatedDate datetime NULL, gender int(1) DEFAULT 0 NOT NULL comment '0은 입력 안 함
1은 여성
2는 남성', snsKey varchar(50), snsType int(1) NOT NULL, insertDate datetime DEFAULT now() NOT NULL, updateDate datetime NULL, lastestLoginDate datetime NULL, privacyAgreementDate datetime NULL, privacyVersion int(1), `status` int(1) DEFAULT 0 NOT NULL comment '가입상태
-2는 탈퇴 (resign)
-1은 차단 (block)
0은 가입 전 (before register)
1은 가입완료 (register)
2는 휴면 (sleep)', PRIMARY KEY (PKey), UNIQUE INDEX (PKey));
ALTER TABLE `Profile` ADD INDEX FKProfile360077 (userFKey), ADD CONSTRAINT FKProfile360077 FOREIGN KEY (userFKey) REFERENCES `user` (PKey);
ALTER TABLE `user` ADD INDEX FKuser639360 (snsType), ADD CONSTRAINT FKuser639360 FOREIGN KEY (snsType) REFERENCES sns_type (pkey);

# 참조키가 있기 때문에 sns_type 테이블 먼저 insert 
INSERT INTO `univ`.`sns_type` (`name`) VALUES ('kakao');
INSERT INTO `univ`.`sns_type` (`name`) VALUES ('google');
INSERT INTO `univ`.`sns_type` (`name`) VALUES ('facebook');
INSERT INTO `univ`.`sns_type` (`name`) VALUES ('naver');


INSERT INTO `univ`.`user`
(
`name`,
`id`,
`pwd`,
`birth`,
`email`,
`certificatedEmail`,
`certificatedDate`,
`gender`,
`privacyAgreementDate`,
`privacyVersion`,
`status`)
VALUES
(<{name: }>,
<{id: }>,
<{pwd: }>,
<{birth: }>,
<{email: }>,
<{certificatedEmail: 0}>,
<{certificatedDate: }>,
<{gender: 0}>,
<{privacyAgreementDate: }>,
<{privacyVersion: }>,
<{status: 0}>);
