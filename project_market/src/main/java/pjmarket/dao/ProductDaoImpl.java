package pjmarket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertProduct(Product product) throws Exception {
		System.out.println("insertProduct dao 진입");
		int result = sqlSession.insert("productns.product_insert", product);
		
		System.out.println("insertProduct sql 실행 result 값 확인 : "  + result);
		
		return result;
	}
	
}
