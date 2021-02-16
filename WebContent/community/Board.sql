CREATE TABLE board (
	num number,
	username varchar2(15),
	password varchar2(15),
	title varchar2(100),
	content NCLOB,
	b_date date,
	b_view number,
	ref number,
	indent number,
	step number
)

// b_date : 작성일
// b_view : 조회수(= 구col에서는 hit)

DROP TABLE board
DROP SEQUENCE num_board

SELECT * FROM board

SELECT COUNT(*) FROM board

DELETE FROM board WHERE username = '???2'

create sequence num_board
start with 1
increment by 1

INSERT INTO board values (num_board.nextval, '익명0001', '1234', '테스트제목', '테스트 내용', sysdate, 0, 0, 0, 0)