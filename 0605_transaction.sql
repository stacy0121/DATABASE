-- use univ;
-- select * from `board`;   # 트랜잭션과 무관 (실패해도 상관없음)

### 1번 글 읽고 좋아요 누르기
start transaction;          # 시작 부분 아래로 모두 트랜잭션과 연관
set autocommit = 0;         # 자동 영구 저장 False 

## 오류 만들기 (like, view_count가 바뀌지 않음)
/*INSERT INTO `univ`.`like`(`user_id`,`content_id`,`like`,`type`) VALUES(10,1,5,0);   # 동작 안 함

UPDATE `univ`.`board`
SET
`update_date` = now(,           # 문법 오류
`view_count` = view_count + 1   # 해당 행의 값을 가져옴
WHERE `pkey` = 1;

rollback;                       # 트랜잭션 취소
*/

## 오류 수정
INSERT INTO `univ`.`like`(`user_id`,`content_id`,`like`,`type`) VALUES(10,1,5,0);
lock tables `like` read;        # 테이블 읽기 잠금
lock tables `like` write;       # 쓰기 잠금 (pkey 중복 방지)

do sleep(600);                  # 10분 멈추기. 다른 커넥터에서 조회하면 멈추는 이유?

UPDATE `univ`.`board`
SET
`update_date` = now(),
`view_count` = view_count + 1   # 해당 행의 값을 가져옴
WHERE `pkey` = 1;
lock tables `board` read;       # 테이블 입력 잠금

commit;   # 트랜잭션 완료 및 영구적으로 반영

select * from `like` where `user_id` = 10 and `content_id` = 1;
-- select * from board WHERE `pkey` = 1;