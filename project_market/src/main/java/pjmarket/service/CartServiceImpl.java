package pjmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.CartDaoImpl;
import pjmarket.model.CartList;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDaoImpl cartdao;
	
	
	@Override
	public List<CartList> getCartList(String member_id) throws Exception{
	
		return cartdao.getCartList(member_id);
	}
	
}
