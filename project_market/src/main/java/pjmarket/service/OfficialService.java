package pjmarket.service;

import java.util.List;

import pjmarket.model.OfficialBoard;

public interface OfficialService {

	public int insert(OfficialBoard board);
	
	public int getCount();
	
	public List<OfficialBoard> getoff_list(int page);

	public void updatecount(int no);
	

}
