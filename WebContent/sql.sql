create table user_info(
	id varchar2(40),
	pw varchar2(80),
	tel varchar2(80),
	license varchar2(40)
)

insert into user_info values('test','123','010-0000-0000','123456789')

select * from user_info

create table pills(
	name varchar2(100),
	brand varchar2(80),
	gender varchar2(40),
	age varchar2(30),
	ingredient varchar2(1500),
	efficacy varchar2(100),
	price varchar2(20),
	note varchar2(200)
)

insert into pills values('Ű��ưư ��Ƽ��Ÿ��','Ű��ưư','����','����/û�ҳ�','��Ÿ��A, ��Ÿ��D, ��Ÿ��E, ��Ÿ��B1, ��Ÿ��B2, ��Ÿ��B6, ��Ÿ��B12, ��Ÿ��C, ö, ����','�������','12,900','')

select * from pills