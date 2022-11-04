package pjmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.CartDaoImpl;
import pjmarket.model.Cart;
import pjmarket.model.CartList;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDaoImpl cartdao;
	
	
	@Override
	public List<CartList> getListCart(String member_id) throws Exception{
		System.out.println("getListCart Service");
		return cartdao.getListCart(member_id);
	}
	
	@Override
	public int insertCart(int likes_num) throws Exception{
		System.out.println("insertCart service 진입 일루와야함");
		
		return cartdao.insertCart(likes_num);
	}
	
	@Override
	public int insertCart(Cart cart) throws Exception{
		System.out.println("insert Cart service 진입");
		return cartdao.insertCart(cart);
	}
	
	@Override
	public int deleteCart(int cart_num) throws Exception{
		System.out.println("deleteCart service 진입");
		
		return cartdao.deleteCart(cart_num);
	}
	
}
