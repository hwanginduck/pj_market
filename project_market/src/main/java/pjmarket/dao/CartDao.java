package pjmarket.dao;

import java.util.List;

import pjmarket.model.CartList;

public interface CartDao {

	List<CartList> getCartList(String member_id);
	
}
