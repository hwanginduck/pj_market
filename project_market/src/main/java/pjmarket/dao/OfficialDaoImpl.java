package pjmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.OfficialBoard;

@Repository
public class OfficialDaoImpl implements OfficialDao {

	@Autowired
	public SqlSession session;

	public int insert(OfficialBoard off) {
		return session.insert("off_insert", off);
	}

	public int getCount() {
		return session.selectOne("off_count");
	}

	public List<OfficialBoard> getoff_list(int page) {
		return session.selectList("off_list", page);
	}

	public void updatecount(int num) {
		session.update("off_hit", num);
	}

	public OfficialBoard off_cont(int num) {
		return session.selectOne("off_content", num);
	}

	public int off_updatecont(OfficialBoard off) {
		return session.selectOne("off_updatecont", off);
	}

	public int off_delete(int of_num) {
		return session.selectOne("off_delete", of_num);
	}

}
