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

// b_date : �ۼ���
// b_view : ��ȸ��(= ��col������ hit)

DROP TABLE board
DROP SEQUENCE num_board

SELECT * FROM board

SELECT COUNT(*) FROM board

DELETE FROM board WHERE username = '???2'

create sequence num_board
start with 1
increment by 1

INSERT INTO board values (num_board.nextval, '�͸�0001', '1234', '�׽�Ʈ����', '�׽�Ʈ ����', sysdate, 0, 0, 0, 0)