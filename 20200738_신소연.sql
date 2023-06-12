# 1
create database FinalExam;
use FinalExam;

# 2
select * from buy_history;
select * from buy_info;
select * from customer_service;
select * from products;
select * from users;

# 3
# products 테이블의 status 컬럼은 제품이 판매 중인지, 제품들록 중인지, 판매 대기 중인지, 판매가 중지되었는지의 현재 판매 상태를 나타낸다.
select `status` from products group by `status`;

# 4
# customer_service 테이블의 status 컬럼은 구매자의 문의 사항에 응답을 하였는지, 아직 하지 않았는지의 문의 응답 상태를 나타낸다.
select `status` from customer_service group by `status`;

# 5
# buy_history 테이블의 buy_status 컬럼은 구매자가 상품을 구매할 때 상품을 장바구니에 넣었는데, 결제 중인지, 결제를 완료하였는지의 구매 절차를 나타낸다. 
select buy_status from buy_history group by buy_status;
# delivery_status 컬럼은 구매자가 구매한 상품이 배송 중인지, 배송이 완료되었는지의 배송 상태를 나타낸다.
select delivery_status from buy_history where delivery_status != '' group by delivery_status;
# refund_status 컬럼은 구매자가 상품을 환불 신청했을 때 환불을 신청했는지, 신청을 접수했는지, 환불을 완료했는지의 환불 상태를 나타낸다.
select refund_status from buy_history where refund_status != '' group by refund_status;

# 6
select sum((price-promotion)*quantity)-(select sum((price-promotion)*quantity) from buy_history left join buy_info on buy_info.pkey = buy_history.buy_info_id where refund_status = '환불완료')  as total_price 
from buy_info
left join buy_history on buy_info.pkey = buy_history.buy_info_id
where buy_status = '결제완료' and delivery_status = '배송완료' and refund_status = '';

# 7
select `name` from (select customer_id from customer_service group by customer_id order by count(customer_id) desc limit 1) as black_customer
left join users on users.pkey = black_customer.customer_id
where `type` = '유저' limit 1;

# 8
# 문의가 처리되지 않은 이 문의의 주제는 배송 상태이다. 구매 아이디(buy_info_id)는 8번이며 5번(customer_id) 고객이 구매한 상품인 5번 떡볶이가 배송 중(delivery_status)이며, 이는 배송되는 데 3일(delivery_time)이 소요된다.
UPDATE `customer_service`
SET
`staff_id` = 2,
`staff_response` = "구매하신 상품은 3일 이내로 배송욉니다.",
`status` = "응답완료",
`update_date` = now()
WHERE `status` = '응답요청';

# 9
select `name` from users 
where users.pkey = (select customer_id from buy_info group by customer_id order by sum((price-promotion)*quantity) desc limit 1);

# 10
# friends 테이블은 친구 상태를 보여준다. friend_id 컬럼은 정수형이고 users의 pkey를 참조하며, status 컬럼은 문자형이고 친구 상태를 의미한다. 
# 만약 freind_id 1번 사용자가 3번 사용자에게 친구 신청을 했다면 1번의 friends 테이블에 frined_id는 3번, status는 '친구신청함'을 insert한다. 이때 3번 사용자의 테이블에는 friend_id 1번, status에는 '친구신청받음'을 insert한다.
# 친구 신청을 받아준다면 1번과 3번 모두 status는 '승인(친구됨)'으로 update하고, 3번이 친구 신청을 거절한다면 status는 '거절'로 변경한다. 
# 친구가 된 상태에서 1번 사용자가 3번 사용자를 '삭제'할 수 있고 '차단'할 수도 있으므로 이에 맞춰서 status를 update한다. 이때는 3번 사용자가 1번의 친구 목록에 뜨지 않는다.
CREATE TABLE friends (pkey int(4) NOT NULL AUTO_INCREMENT, friend_id int(4) NOT NULL, status char(100) NOT NULL comment '친구신청함, 친구신청받음, 승인(친구됨), 거절, 삭제, 차단', PRIMARY KEY (pkey), UNIQUE INDEX (pkey));