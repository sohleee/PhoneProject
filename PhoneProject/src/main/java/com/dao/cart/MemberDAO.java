package com.dao.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;

public class MemberDAO {

	
	


	public MemberDTO getMemberData(SqlSession session, String userid) {
		
		return session.selectOne("getMemberData",userid);
	}
}
