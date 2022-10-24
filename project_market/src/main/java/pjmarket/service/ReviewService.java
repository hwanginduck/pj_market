
package pjmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.ReviewDaoImpl;
import pjmarket.model.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewDaoImpl reviewdao;

	// 게시판 저장
	public int ReviewInsert(Review review) {
		return reviewdao.ReviewInsert(review);

	}

}