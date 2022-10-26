--예시문
--member 테이블
insert into member values('아이디컬럼','비밀번호컬럼','이름컬럼','010-0000-0000','test@test.net','N','N','user',sysdate);
select*from member;
--product 테이블
insert into product values(product_seq.nextval,'대분류컬럼','중분류컬럼','소분류컬럼','상품명',50000,'색상컬럼','상품내용컬럼','상품내용서브','이미지공간',10);
select*from product;
--options 테이블
insert into options values(options_seq.nextval,1,'옵션이름',5000,10);
select*from options;
--addr 테이블
insert into addr values(addr_seq.nextval,'아이디컬럼','여기주소','415-709','100동100호','Y');
select*from addr;
--review 테이블
insert into review values(review_seq.nextval,'아이디컬럼',1,1,5,'리뷰내용','리뷰이미지',sysdate);
select*from review;
--qna 테이블
insert into qna values(qna_seq.nextval,'아이디컬럼',1,0,'리뷰내용',sysdate);
select*from qna;
--likes 테이블
insert into likes values(1,'아이디컬럼');
select*from likes;
--review_re 테이블
insert into review_re values('아이디컬럼',1,'리댓글내용',sysdate,0,0,0);
select*from review_re;
--cart 테이블
insert into cart values(1,1,'아이디컬럼',5);
select*from cart;
--orders 테이블
insert into orders values(1,1,1,'아이디컬럼');
select*from orders;

------------- 일괄 테이블 드랍 ---------------
select * from tab;

drop table qna purge;
drop table review purge;
drop table review_re purge;
drop table cart purge;
drop table likes purge;
drop table addr purge;
drop table orders purge;
drop table member PURGE;
drop table options purge;
drop table product purge;

select*from user_sequences;
drop SEQUENCE addr_seq;
drop SEQUENCE options_seq;
drop SEQUENCE product_seq;
drop SEQUENCE qna_seq;
drop SEQUENCE review_seq;

---------------------- 일괄 생성-----------------------------
/* 상품코드 */
CREATE SEQUENCE product_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;

/* 옵션코드 */
CREATE SEQUENCE options_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;

/* 배송지코드 */
CREATE SEQUENCE addr_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;

/* 리뷰글번호 */
CREATE SEQUENCE review_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;

/* 문의번호 */
CREATE SEQUENCE qna_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;

/* 구매(회원) */
CREATE TABLE member (
	member_id VARCHAR2(30) NOT NULL, /* 아이디 */
	member_pw VARCHAR2(30), /* 비밀번호 */
	member_name VARCHAR2(38), /* 이름 */
	member_tel VARCHAR2(38), /* 연락처 */
	member_email VARCHAR2(50), /* 이메일 */
	member_hyu VARCHAR2(5), /* 휴면계정 */
	member_stop VARCHAR2(5), /* 강제정지 */
	member_tiers VARCHAR2(20), /* 관리자 */
	member_date DATE /* 가입일 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		member_id ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_id
		);

/* 주문내역 */
CREATE TABLE orders (
	product_num NUMBER NOT NULL, /* 상품코드 */
	addr_num NUMBER NOT NULL, /* 배송지코드 */
	options_num NUMBER NOT NULL, /* 옵션코드 */
	member_id VARCHAR2(30) NOT NULL /* 아이디 */
);

/* 상품 */
CREATE TABLE product (
	product_num NUMBER NOT NULL, /* 상품코드 */
	product_l VARCHAR2(50), /* 대분류 */
	product_m VARCHAR2(50), /* 중분류 */
	product_s VARCHAR2(50), /* 소분류 */
	product_name VARCHAR2(50), /* 상품명 */
	product_price NUMBER, /* 가격 */
	product_color VARCHAR2(30), /* 색상 */
	product_content VARCHAR2(400), /* 상품내용 */
	product_sub VARCHAR2(4000), /* 상품내용서브 */
	product_img VARCHAR2(4000), /* 상품사진 */
	product_stock NUMBER /* 재고수량 */
);

CREATE UNIQUE INDEX PK_product
	ON product (
		product_num ASC
	);

ALTER TABLE product
	ADD
		CONSTRAINT PK_product
		PRIMARY KEY (
			product_num
		);

/* 옵션 */
CREATE TABLE options (
	options_num NUMBER NOT NULL, /* 옵션코드 */
	product_num NUMBER NOT NULL, /* 상품코드 */
	options_name VARCHAR2(60), /* 옵션 */
	options_price NUMBER, /* 변동가격 */
	options_sale NUMBER /* 할인율 */
);

CREATE UNIQUE INDEX PK_options
	ON options (
		options_num ASC
	);

ALTER TABLE options
	ADD
		CONSTRAINT PK_options
		PRIMARY KEY (
			options_num
		);

/* 배송지 */
CREATE TABLE addr (
	addr_num NUMBER NOT NULL, /* 배송지코드 */
	member_id VARCHAR2(30), /* 아이디 */
	addr_main VARCHAR2(100), /* 주소 */
	addr_post VARCHAR2(100), /* 우편번호 */
	addr_sub VARCHAR(100), /* 상세주소 */
	addr_default VARCHAR2(5) /* 기본배송지 */
);

CREATE UNIQUE INDEX PK_addr
	ON addr (
		addr_num ASC
	);

ALTER TABLE addr
	ADD
		CONSTRAINT PK_addr
		PRIMARY KEY (
			addr_num
		);

/* 장바구니 */
CREATE TABLE cart (
	options_num NUMBER NOT NULL, /* 옵션코드 */
	product_num NUMBER, /* 상품코드 */
	member_id VARCHAR2(30), /* 아이디 */
	cart_count NUMBER(20) /* 상품수량 */
);
 

/* 찜 */
CREATE TABLE likes (
	product_num NUMBER NOT NULL, /* 상품코드 */
	member_id VARCHAR2(30) /* 아이디 */
);
----------------------------------------??
/* 리뷰게시판 */
CREATE TABLE review (
	review_no NUMBER NOT NULL, /* 글번호 */
	member_id VARCHAR2(30), /* 아이디 */
	product_num NUMBER, /* 상품코드 */
	options_num NUMBER, /* 옵션코드 */
	review_star NUMBER, /* 별점 */
	review_content VARCHAR2(500), /* 내용 */
	review_img VARCHAR2(4000), /* 리뷰사진 */
	review_date DATE /* 작성일 */
);

CREATE UNIQUE INDEX PK_review
	ON review (
		review_no ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			review_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_product_TO_review
		FOREIGN KEY (
			product_num
		)
		REFERENCES product (
			product_num
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_options_TO_review
		FOREIGN KEY (
			options_num
		)
		REFERENCES options (
			options_num
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);
----------------------------------------??
/* 리뷰게시판댓글 */
CREATE TABLE review_re (
	member_id VARCHAR2(30), /* 아이디 */
	re_no NUMBER, /* 글번호 */
	re_content VARCHAR2(300), /* 내용 */
	re_date DATE, /* 작성일 */
	ref_num NUMBER, /* ref_num */
	re_step NUMBER, /* re_step */
	re_level NUMBER /* re_level */
);

/* 상품문의 */
CREATE TABLE qna (
	qna_no NUMBER NOT NULL, /* 문의번호 */
	member_id VARCHAR2(30), /* 아이디 */
	product_num NUMBER, /* 상품코드 */
	qna_re NUMBER, /* 댓글여부 */
	qna_content VARCHAR2(500), /* 내용 */
	qna_date DATE /* 작성일 */
);

CREATE UNIQUE INDEX PK_qna
	ON qna (
		qna_no ASC
	);

ALTER TABLE qna
	ADD
		CONSTRAINT PK_qna
		PRIMARY KEY (
			qna_no
		);

ALTER TABLE orders
	ADD
		CONSTRAINT FK_product_TO_orders
		FOREIGN KEY (
			product_num
		)
		REFERENCES product (
			product_num
		);

ALTER TABLE orders
	ADD
		CONSTRAINT FK_addr_TO_orders
		FOREIGN KEY (
			addr_num
		)
		REFERENCES addr (
			addr_num
		);

ALTER TABLE orders
	ADD
		CONSTRAINT FK_options_TO_orders
		FOREIGN KEY (
			options_num
		)
		REFERENCES options (
			options_num
		);

ALTER TABLE orders
	ADD
		CONSTRAINT FK_member_TO_orders
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE options
	ADD
		CONSTRAINT FK_product_TO_options
		FOREIGN KEY (
			product_num
		)
		REFERENCES product (
			product_num
		);

ALTER TABLE addr
	ADD
		CONSTRAINT FK_member_TO_addr
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE cart
	ADD
		CONSTRAINT FK_options_TO_cart
		FOREIGN KEY (
			options_num
		)
		REFERENCES options (
			options_num
		);

ALTER TABLE cart
	ADD
		CONSTRAINT FK_product_TO_cart
		FOREIGN KEY (
			product_num
		)
		REFERENCES product (
			product_num
		);

ALTER TABLE cart
	ADD
		CONSTRAINT FK_member_TO_cart
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE likes
	ADD
		CONSTRAINT FK_product_TO_like
		FOREIGN KEY (
			product_num
		)
		REFERENCES product (
			product_num
		);

ALTER TABLE likes
	ADD
		CONSTRAINT FK_member_TO_like
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);


ALTER TABLE review_re
	ADD
		CONSTRAINT FK_review_TO_review_re
		FOREIGN KEY (
			re_no
		)
		REFERENCES review (
			review_no
		);

ALTER TABLE review_re
	ADD
		CONSTRAINT FK_member_TO_review_re
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);


ALTER TABLE qna
	ADD
		CONSTRAINT FK_product_TO_qna
		FOREIGN KEY (
			product_num
		)
		REFERENCES product (
			product_num
		);

ALTER TABLE qna
	ADD
		CONSTRAINT FK_member_TO_qna
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);	
		
		-----------------------------------------------------------
		
		
		drop table review purge;
drop SEQUENCE review_seq;
select * from REVIEW;
/* 리뷰게시판 */
CREATE TABLE review (
	review_no NUMBER NOT NULL, /* 글번호 */
	review_sb VARCHAR2(30), /* 글제목 */
	member_id VARCHAR2(30), /* 아이디 */
	product_num NUMBER, /* 상품코드 */
	options_num NUMBER, /* 옵션코드 */
	review_star NUMBER, /* 별점 */
	review_content VARCHAR2(500), /* 내용 */
	review_img VARCHAR2(4000), /* 리뷰사진 */
	review_date DATE /* 작성일 */
);

/* 리뷰글번호 */
CREATE SEQUENCE review_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;


CREATE UNIQUE INDEX PK_review
	ON review (
		review_no ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			review_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_product_TO_review
		FOREIGN KEY (
			product_num
		)
		REFERENCES product (
			product_num
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_options_TO_review
		FOREIGN KEY (
			options_num
		)
		REFERENCES options (
			options_num
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);
