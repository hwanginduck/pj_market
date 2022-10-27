package pjmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.CartList;

@Repository
public class CartDaoImpl implements CartDao{

	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public List<CartList> getCartList(String member_id) {
		// TODO Auto-generated method stub
		System.out.println("진행 상황 Cart Dao");
		
		List<CartList> list = sqlSession.selectList("cartns.cart_list", member_id);
		
		return list;
	}
	
	@Override
	public int insertCart(int likes_num){
		System.out.println("insertCart dao 진입");
		
		int result = sqlSession.insert("cartns.cart_insert", likes_num);
		
		System.out.println("result 값 출력 : " +result);		
				
		return result;
	}
	
	@Override
	public int deleteCart(int cart_num) {
		System.out.println("deleteCart dao 진입");
		
		int result = sqlSession.delete("cartns.cart_delete", cart_num);
		
		System.out.println("result 값 출력 : " +result);
		
		return result;
	}
}
