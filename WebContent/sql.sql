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

insert into pills values('≈∞¡Ó∆∞∆∞ ∏÷∆º∫Ò≈∏πŒ','≈∞¡Ó∆∞∆∞','∞¯øÎ','¿Øæ∆/√ªº“≥‚','∫Ò≈∏πŒA, ∫Ò≈∏πŒD, ∫Ò≈∏πŒE, ∫Ò≈∏πŒB1, ∫Ò≈∏πŒB2, ∫Ò≈∏πŒB6, ∫Ò≈∏πŒB12, ∫Ò≈∏πŒC, √∂, ∏¡∞£','º∫¿Âπﬂ¿∞','12,900','')

select * from pills