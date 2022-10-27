
package pjmarket.dao;

import java.util.List;


import org.springframework.stereotype.Repository;

import pjmarket.model.Review;

@Repository
public interface ReviewDao {

	public int ReviewInsert(Review review) throws Exception;

	public int getListCount();

	public List<Review> getBoardList(int page) throws Exception;

}
