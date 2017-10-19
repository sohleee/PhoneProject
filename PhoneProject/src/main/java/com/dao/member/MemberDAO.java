package com.dao.member;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.member.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public MemberDTO  login(Map<String, String> map) {
		MemberDTO dto =  template.selectOne("login", map);
		return dto;
	}
	
	public void insertMember(MemberDTO dto) {
		template.insert("insertMember",dto);
	}
	
	public MemberDTO mypage(String userid) {
		MemberDTO dto = template.selectOne("mypage",userid); 
		return dto;
		
	}
	
	public void updateMember(MemberDTO dto) {
		template.update("updateMember",dto);
	}
	
	public void deleteMember(String userid) {
		template.delete("deleteMember",userid);
	}
	
	public String checkID(String userid) {
		String str = template.selectOne("checkID",userid);
		return str;
	}

	public String checkEmail(String email) {
		String str = template.selectOne("checkEmail",email);
		return str;
	}
	
	public MemberDTO findID(Map<String, String> map) {
		MemberDTO dto = template.selectOne("findID",map);
		return dto;
	}
	
	public MemberDTO findPasswd(Map<String, String> map) {
		MemberDTO dto = template.selectOne("findPasswd",map);
		return dto;
	}

}
