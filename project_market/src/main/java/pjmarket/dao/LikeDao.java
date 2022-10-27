package pjmarket.dao;

import java.util.List;

import pjmarket.model.LikeList;

public interface LikeDao {

	List<LikeList> getLikeList(String member_id);
	
	int deleteLikes(int likes_num);
}
