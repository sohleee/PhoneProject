package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CartDAO;
import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;
	
	
	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
	}
	
	public MemberDTO login(HashMap<String,String> map) {
		return dao.login(map);
	}
	
	@Transactional
	public void deleteMember(String userid) {
		dao.deleteMember(userid);
	}
	
	public MemberDTO myPage(String userid) {
		return dao.myPage(userid);
	
	}
	public void updateMember(MemberDTO dto) {
		dao.updateMember(dto);
	}
	
	
}
