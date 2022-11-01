package pjmarket.dao;

import java.util.List;

import pjmarket.model.LikeList;

public interface LikeDao {

	List<LikeList> getLikeList(String member_id);
	
	int deleteLikes(int likes_num);
	
	int insertLike(int product_num, int options_num, String member_id);
}
