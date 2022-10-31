package pjmarket.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import pjmarket.model.OfficialBoard;

public class OfficialDaoImpl implements OfficialDao{
	
	@Autowired
	public SqlSessionTemplate session;
	
	   public int insert(OfficialBoard off) {
				return session.insert("off_insert",off);
			}
	   
		   public int getCount() {
				return session.selectOne("off_count");
			}
		   
		   public List<OfficialBoard> getoff_list(int page){
				return session.selectList("off_list", page);
			}
		   
		   public void updatecount(int no) {
				session.update("hit", no);
			}
		   
		   public OfficialBoard off_cont(int no) {
				return session.selectOne("content",no);

}
}
