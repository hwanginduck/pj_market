package pjmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.ReviewDaoImpl;
import pjmarket.model.Review;

@Service
public class ReviewServiceImpl  implements ReviewService {

	@Autowired
	private ReviewDaoImpl reviewdao;

	// 게시판 저장
	@Override
	public int ReviewInsert(Review review) throws Exception {
		return reviewdao.ReviewInsert(review);

	}
}
