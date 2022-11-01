package pjmarket.dao;

import java.util.HashMap;
import java.util.List;

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
	
	@Override
	public int getProductCount(String product_l) throws Exception{
		System.out.println("카테고리 상품 갯수 검색 dao 진입");
		System.out.println("dao product_l 확인 : " +product_l);
		int count = 0;	
		count = ((Integer)sqlSession.selectOne("productns.product_count", product_l)).intValue();

		System.out.println("카테고리 상품 갯수 검색 DB 에서 가져온 count 값 : " +count);
		
		return count;
		
	}
	
	@Override
	public List<Product> getProductlist(int page, String product_l) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("product_l", product_l);
		
		List<Product> list = sqlSession.selectList("productns.product_list", map);
		
		return list;
	}
	
	@Override
	public Product getProductDetail(int product_num) {
		System.out.println("product detail dao start");
		return (Product)sqlSession.selectOne("productns.product_detail", product_num);
	}
	
}
