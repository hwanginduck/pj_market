package pjmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.OfficialBoard;

@Repository
public class OfficialDaoImpl implements OfficialDao {

	@Autowired
	public SqlSession session;

	public int insert(OfficialBoard off)  {
		return session.insert("off_insert", off);
	}

	public int getCount()  {
		return session.selectOne("off_count");
	}

	public List<OfficialBoard> getoff_list(int page) {
		return session.selectList("off_list", page);
	}

	public void updatecount(int off_num)  {
		 session.update("off_hit", off_num);
	}
	
	public OfficialBoard getOfficialBoard(int off_num) {
		return session.selectOne("off_content", off_num);
	}
	
	public int off_update(OfficialBoard off) {
			return session.update("off_update", off);
	}

	public int off_delete(int off_num)  {
		return session.delete("off_delete", off_num);
	}

}
