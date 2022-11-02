package pjmarket.model;

public class Cart {

	private int cart_num;
	private int options_num;
	private int product_num;
	private String member_id;
	private int cart_count;
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getOptions_num() {
		return options_num;
	}
	public void setOptions_num(int options_num) {
		this.options_num = options_num;
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
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	
	
}
