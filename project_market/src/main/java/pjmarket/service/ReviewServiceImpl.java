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

//		int result = reviewdao.ReviewInsert(review);

//		return result;
	}

	@Override
	public int getListCount() {
		return reviewdao.getListCount();
	}

	@Override
	public List<Review> getBoardList(int page) {
		return reviewdao.getBoardList(page);
	}

	public Product getProductNum(int product_num) throws Exception{
	
		Product product= reviewdao.getProductNum(product_num);
		return product;
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
		// TODO Auto-generated method stub
		return reviewdao.getMember(review_no);
	}

	public int ReviewUpdateok(Review review) {
		// TODO Auto-generated method stub
		return reviewdao.Updatereview(review);
	}

	
	

}
