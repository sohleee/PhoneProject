package com.service.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.member.MemberDAO;
import com.dto.admin.AdminDTO;
import com.dto.member.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;
	

	public void updatePasswd(HashMap<String, String> map) {
		dao.updatePasswd(map);
	}
	
	public MemberDTO  login(Map<String, String> map) {
		return dao.login(map);
	}
	
	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
	}
	
	public MemberDTO mypage(String userid) {
		return dao.mypage(userid);
	}
	
	public void updateMember(MemberDTO dto) {
		dao.updateMember(dto);
	}
	
	public void deleteMember(String userid) {
		dao.deleteMember(userid);
	}
	
	public String checkID(String userid) {
		return dao.checkID(userid);
	}

	public String checkEmail(String email) {
		return dao.checkEmail(email);
	}
	
	public MemberDTO findID(Map<String, String> map) {
		return dao.findID(map);
	}
	
	public MemberDTO findPasswd(Map<String, String> map) {
		return dao.findPasswd(map);
	}
	
	public void insertSNSMember(MemberDTO dto) {
		dao.insertSNSMember(dto);
	}
	
	public MemberDTO snsMember(String str) {
		return dao.snsMember(str);
	}
	

}
