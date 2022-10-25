package pjmarket.service;

import java.util.List;

import pjmarket.model.CartList;

public interface CartService {

	//장바구니 목록 리스트 형태
	List<CartList> getCartList(String member_id) throws Exception;
	
}
