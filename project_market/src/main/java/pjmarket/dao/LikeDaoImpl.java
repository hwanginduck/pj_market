package pjmarket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.LikeList;

@Repository
public class LikeDaoImpl implements LikeDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LikeList> getLikeList(String member_id) {
		// TODO Auto-generated method stub
		System.out.println("like_list Dao 진입");
		
		List<LikeList> list = sqlSession.selectList("likens.like_list", member_id);
		
		return list;
	}
	
	@Override
	public int deleteLikes(int likes_num) {
		System.out.println("deleteLike dao 진입");
		
		int result = 0;
		
		result = sqlSession.delete("likens.like_delete", likes_num);		
		
		System.out.println("result : " +result);
		
		return result;
	}
	
	@Override
	public int insertLike(int product_num, int options_num, String member_id) {
		System.out.println("insert Like dao");
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("product_num", product_num);
		map.put("options_num", options_num);
		map.put("member_id", member_id);
		
		int result = sqlSession.insert("likens.insertlike", map);
		
		return result;
		
	}
	
}
