package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository 
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int insertMember(MemberDTO dto) {
		int n=template.insert("insertMember",dto);
		return n;
	}
	
	public MemberDTO login(HashMap<String,String> map) {
		return template.selectOne("login",map);
	}
	
	public void deleteMember(String userid) {
		int n=template.delete("deleteMember",userid);
		int n2=template.delete("com.mybatis.CartMapper.deleteMemberCart",userid);
	}
	
	public MemberDTO myPage(String userid) {
		return template.selectOne("myPage",userid);
	}
	
	public int updateMember(MemberDTO dto) {
		int n= template.update("updateMember",dto);
		return n;
	}
}
