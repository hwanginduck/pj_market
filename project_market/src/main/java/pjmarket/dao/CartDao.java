package pjmarket.dao;

import java.util.List;

import pjmarket.model.CartList;

public interface CartDao {

	List<CartList> getCartList(String member_id);
	
	int insertCart(int likes_num);
	
	int deleteCart(int cart_num);
}
