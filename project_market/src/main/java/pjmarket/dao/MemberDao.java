package pjmarket.dao;

import pjmarket.model.MemberDTO;

public interface MemberDao {
	
	public abstract int MemberInsert(MemberDTO member) throws Exception;

}
