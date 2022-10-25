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