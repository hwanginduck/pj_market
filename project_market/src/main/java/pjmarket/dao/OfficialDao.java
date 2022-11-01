package pjmarket.dao;

import java.util.List;

import pjmarket.model.OfficialBoard;

public interface OfficialDao {
	
	  public int insert(OfficialBoard off);
	
	  public int getCount();
	 
	  public List<OfficialBoard> getoff_list(int page);
	  
	  public void updatecount(int num);
	  
	  public OfficialBoard off_cont(int num);
	  
	public int off_updatecont(OfficialBoard off);
	
	public int off_delete(int of_num);


}
