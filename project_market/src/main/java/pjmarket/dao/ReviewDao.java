
package pjmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.Review;

@Repository
public interface ReviewDao {

	public int ReviewInsert(Review review) throws Exception;

	public int getListCount();

	public List getBoardList(int page) throws Exception;

}
