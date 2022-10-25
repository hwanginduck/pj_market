
package pjmarket.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate session;

	// 게시판에저장 //
	@Override
	public int ReviewInsert(Review review) throws Exception {
		return session.insert("reviewns.review_insert", review);
	}

}
