package pjmarket.dao;

import java.util.List;

import pjmarket.model.OfficialBoard;

public interface OfficialDao {
	
	  public int insert(OfficialBoard off);
	
	  public int getCount();
	 
	  public List<OfficialBoard> getoff_list(int page);
	  
	  public void updatecount(int off_num);
	  
	  public OfficialBoard off_cont(int off_num);
	  
	public int off_updatecont(OfficialBoard off_num);
	
	public int off_delete(int off_num);


}
