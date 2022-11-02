package pjmarket.service;

import java.util.List;

import pjmarket.model.Cart;
import pjmarket.model.CartList;

public interface CartService {

	//장바구니 목록 리스트 형태
	List<CartList> getListCart(String member_id) throws Exception;
	
	//장바구니 추가(찜 - > 장바구니)
	int insertCart(int likes_num) throws Exception;
	
	//장바구니 추가(상품상세페이지 -> 장바구니)
	int insertCart(Cart cart) throws Exception;
	
	//장바구니 삭제
	int deleteCart(int cart_num) throws Exception;
}
