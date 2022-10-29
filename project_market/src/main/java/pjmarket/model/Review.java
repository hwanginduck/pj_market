package pjmarket.model;

import java.util.Date;

public class Review {

	/* 리뷰게시판 */
	private int review_no; /* 글번호 */
	private String review_sb;/* 글제목 */
	private String member_id; /* 아이디 */
	private int product_num; /* 상품코드 */
	private int options_num; /* 옵션코드 */
	private int review_star; /* 별점 */
	private String review_content; /* 내용 */
	private String review_img; /* 리뷰사진 */
	private Date review_date; /* 작성일 */
	

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_sb() {
		return review_sb;
	}

	public void setReview_sb(String review_sb) {
		this.review_sb = review_sb;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getOptions_num() {
		return options_num;
	}

	public void setOptions_num(int options_num) {
		this.options_num = options_num;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

}
