package pjmarket.service;

import java.util.List;

import pjmarket.dao.OfficialDao;
import pjmarket.model.OfficialBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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
	
	public void updatecount(int off_num) {					// 조회수
		dao.updatecount(off_num);
	}
	
	public OfficialBoard off_cont(int off_num) {
		return dao.off_cont(off_num);
	}
	
	public int off_updatecont(OfficialBoard off_num) {		// 공지사항 수정
		return dao.off_updatecont(off_num);
	}

	public int off_delete(int off_num) {
		return dao.off_delete(off_num);
	}

}

