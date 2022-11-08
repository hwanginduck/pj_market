
package pjmarket.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pjmarket.model.Review;

@Repository
public interface ReviewDao {

	public int ReviewInsert(Review review) throws Exception;

	public int getListCount();

	public List<Review> getBoardList(int page) throws Exception;

	public int updateHit(int review_no);

	public Review select(int review_no);

	public Review getMember(int review_no);

	public int Updatereview(Review review);

	public Review ReviewDelete(int review_no);

	public int ReviewDeleteOk(Review review);

}
