package pjmarket.service;

import java.util.List;

import pjmarket.dao.OfficialDao;
import pjmarket.model.OfficialBoard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


public class OfficialServiceImpl implements OfficialService{
	
	@Autowired
	private OfficialDao dao;

	public int insert(OfficialBoard off) {
		return dao.insert(off);
	}

	public int getCount() {
		return dao.getCount();
	}

	public List<OfficialBoard> getoff_list(int page) {
		return dao.getoff_list(page);
	}
	
	public void updatecount(int no) {
		dao.updatecount(no);
	}
	
	public OfficialBoard off_cont(int no) {
		return dao.off_cont(no);

}
}
