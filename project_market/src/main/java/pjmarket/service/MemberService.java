package pjmarket.service;

import pjmarket.model.MemberDTO;

public interface MemberService {
	
	public abstract int MemberInsert(MemberDTO member) throws Exception;
}
