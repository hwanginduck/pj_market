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
	
	public void updatecount(int num) {					// 조회수
		dao.updatecount(num);
	}
	
	public OfficialBoard off_cont(int num) {
		return dao.off_cont(num);
	}
	
	public int off_updatecont(OfficialBoard off) {		// 공지사항 수정
		return dao.off_updatecont(off);
	}

	public int off_delete(int of_num) {
		return dao.off_delete(of_num);
	}

}

