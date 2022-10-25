package pjmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.MemberDaoImpl;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDaoImpl dao;

}
