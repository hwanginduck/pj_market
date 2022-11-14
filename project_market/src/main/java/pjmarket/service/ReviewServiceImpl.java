package pjmarket.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import pjmarket.dao.ReviewDaoImpl;
import pjmarket.model.Product;
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
	public int getListCount(int product_num) {
		return reviewdao.getListCount(product_num);
	}

	@Override
	public List<Review> getBoardList(int page, int product_num) {
		System.out.println("services page: " +page);
		return reviewdao.getBoardList(page,product_num);
	}

	public Product getProductNum(int product_num) throws Exception {

		return reviewdao.getProductNum(product_num);
	}

	public int updateHit(int review_no) {
		int result = reviewdao.updateHit(review_no);
		return result;
	}

	public Review select(int review_no) {
		Review review = reviewdao.select(review_no);
		return review;
	}

	public Review Reviewupdate(int review_no) {
		return reviewdao.getMember(review_no);
	}

	public int ReviewUpdateok(Review review) {
		System.out.println("review_updateresult");
		return reviewdao.Updatereview(review);
	}

	public Review ReviewDelete(int review_no) {
		return reviewdao.ReviewDelete(review_no);
	}

	public int ReviewDeleteOk(Review review) {
		System.out.println("ReviewDeleteOk");
		return reviewdao.ReviewDeleteOk(review);
	}


}
