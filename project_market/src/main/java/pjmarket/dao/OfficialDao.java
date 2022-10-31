package pjmarket.dao;

import java.util.List;

import pjmarket.model.OfficialBoard;

public interface OfficialDao {
	
	public int insert(OfficialBoard off);
	
	 public int getCount();
	 
	  public List<OfficialBoard> getoff_list(int page);
	  
	  public void updatecount(int no);
	  
	  public OfficialBoard off_cont(int no); 

}
