package pjmarket.service;

import java.util.List;

import pjmarket.model.OfficialBoard;

public interface OfficialService {

	public int insert(OfficialBoard board);
	
	public int getCount();
	
	public List<OfficialBoard> getoff_list(int page);

	public void updatecount(int off_num);
	
	public int off_updatecont(OfficialBoard off_num);
	
	public int off_delete(int off_num);

}
