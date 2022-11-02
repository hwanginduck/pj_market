package pjmarket.dao;

import java.util.List;

import pjmarket.model.Cart;
import pjmarket.model.CartList;

public interface CartDao {

	List<CartList> getListCart(String member_id) throws Exception;
	
	int insertCart(int likes_num) throws Exception;
	
	int insertCart(Cart cart) throws Exception;
	
	int deleteCart(int cart_num) throws Exception;
}
