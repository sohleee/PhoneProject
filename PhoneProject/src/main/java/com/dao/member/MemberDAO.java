package com.dao.member;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.admin.AdminDTO;
import com.dto.member.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	
	//비밀번호찾기-> 임시비밀번호발급 
	public void updatePasswd(HashMap<String, String> map) {
		template.update("updatePasswd",map);
	}
	
	//로그인기능
	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto =  template.selectOne("login", map);
		return dto;
	}
	//회원가입기능
	public void insertMember(MemberDTO dto) {
		template.insert("insertMember",dto);
	}
	//마이페이지 접근
	public MemberDTO mypage(String userid) {
		MemberDTO dto = template.selectOne("mypage",userid); 
		return dto;
	}
	//회원정보수정
	public void updateMember(MemberDTO dto) {
		template.update("updateMember",dto);
	}
	//회원탈퇴
	public void deleteMember(String userid) {
		template.delete("deleteMember",userid);
	}
	//아이디 중복체크
	public String checkID(String userid) {
		String str = template.selectOne("checkID",userid);
		return str;
	}
	//이메일 중복체크
	public String checkEmail(String email) {
		String str = template.selectOne("checkEmail",email);
		return str;
	}
	//아이디찾기
	public MemberDTO findID(Map<String, String> map) {
		MemberDTO dto = template.selectOne("findID",map);
		return dto;
	}
	//비번찾기
	public MemberDTO findPasswd(Map<String, String> map) {
		MemberDTO dto = template.selectOne("findPasswd",map);
		return dto;
	}
	//sns회원 회원가입
	public void insertSNSMember(MemberDTO dto) {
		template.insert("insertSNSMember",dto);
	}
	//sns회원 중복체크
	public MemberDTO snsMember(String str) {
		return template.selectOne("snsMember", str);
	}
	

}
