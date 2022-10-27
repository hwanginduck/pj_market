package pjmarket.service;

import java.util.List;

import pjmarket.model.LikeList;

public interface LikeService {

	//찜목록 리스트 형태
	List<LikeList> getLikeList(String member_id) throws Exception;
	
	//찜목록 지우기
	int deleteLikes(int likes_num) throws Exception;
}
