package pjmarket.model;

public class Likes {

	private int likes_num;
	private int product_num;
	private String member_id;
	private int options_num;
	
	public int getLikes_num() {
		return likes_num;
	}
	public void setLikes_num(int likes_num) {
		this.likes_num = likes_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getOptions_num() {
		return options_num;
	}
	public void setOptions_num(int options_num) {
		this.options_num = options_num;
	}
	
}
