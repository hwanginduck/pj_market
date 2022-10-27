package pjmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.ReviewDaoImpl;
import pjmarket.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDaoImpl reviewdao;

	// 게시판 저장
	@Override
	public int ReviewInsert(Review review) throws Exception {
		return reviewdao.ReviewInsert(review);

	}

	@Override
	public int getListCount() {
		return reviewdao.getListCount();
	}

	@Override
	public List<Review> getBoardList(int page) {
		return reviewdao.getBoardList(page);
	}

}
