package pjmarket.service;

import java.util.List;

import pjmarket.model.Product;
import pjmarket.model.Review;

public interface ReviewService {

	public int ReviewInsert(Review review) throws Exception;

	public int getListCount() throws Exception;

	public List<Review> getBoardList(int page) throws Exception;

	public Product getProductNum(int product_num) throws Exception;

	public int updateHit(int review_no);

	public Review select(int review_no);
	public Review Reviewupdate(int review_no) ;
	

}
