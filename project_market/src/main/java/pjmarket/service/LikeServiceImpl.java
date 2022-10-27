package pjmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.LikeDaoImpl;
import pjmarket.model.LikeList;

@Service
public class LikeServiceImpl implements LikeService  {

	@Autowired
	private LikeDaoImpl likedao;

	@Override
	public List<LikeList> getLikeList(String member_id) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("like_list Service 진입");
		return likedao.getLikeList(member_id);
	}
	
	@Override
	public int deleteLikes(int likes_num) throws Exception{
		System.out.println("deleteLikes service 진입");
		
		return likedao.deleteLikes(likes_num);
	}
}
