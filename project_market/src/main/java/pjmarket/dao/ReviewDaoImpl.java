
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

	// 상품 코드 가져오기
	public Product getProductNum(int product_num) throws Exception {
		return session.selectOne("review.getProductNum", product_num);
	}

	// 게시판에저장 //
	@Override
	public int ReviewInsert(Review review) throws Exception {
		System.out.println("review_insert.jsp------------");

		return session.insert("reviewns.review_insertresult", review);
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

	public int updateHit(int review_no) {
		return session.update("reviewns.updateHit", review_no);
	}

	public Review select(int review_no) {
		return session.selectOne("reviewns.select", review_no);
	}

	public Review getMember(int review_no) {
		Review review = session.selectOne("reviewns.updateselect", review_no);
		return review;
	}

	public int Updatereview(Review review) {
		System.out.println("review_updateresult");
		int result = session.update("reviewns.review_update", review);
		return result;
	}

	public Review ReviewDelete(int review_no) {
		Review review = session.selectOne("reviewns.deleteselect", review_no);
		return review;
	}

	public int ReviewDeleteOk(Review review) {
		System.out.println("ReviewDeleteOk");
		int result = session.update("reviewns.review_delete", review);
		return result;
	}

}
