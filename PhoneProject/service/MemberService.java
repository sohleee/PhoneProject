package com.Phone82.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.member.MemberDAO;
import com.dto.member.MemberDTO;

@Service("memberService")
public class MemberService {
	
	@Autowired
	MemberDAO dao;
	
	public MemberDTO  login(Map<String, String> map) {
		
		return dao.login(map);
	}
}
