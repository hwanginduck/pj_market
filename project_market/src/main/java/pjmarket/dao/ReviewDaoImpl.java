
package pjmarket.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.Product;
import pjmarket.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate session;

	// 상품 코드  가져오기 
	public Product getProductNum(int product_num)throws Exception {
		return session.selectOne("review.getProductNum", product_num);
	}
	
	// 게시판에저장 //
	@Override
	public int ReviewInsert(Review review) throws Exception {
		System.out.println("review_insert.jsp------------");

		return session.insert("reviewns.review_insertresult", review);
//		int result = session.insert("reviewns.review_insertresult", review);
//		return result;
	}

	@Override
	public int getListCount() {
		
		return session.selectOne("reviewns.review_count");
	}

	@Override
	public List<Review> getBoardList(int page) {
		List<Review> list = session.selectList("reviewns.review_boardlist", page);
		return list;
	}


}
