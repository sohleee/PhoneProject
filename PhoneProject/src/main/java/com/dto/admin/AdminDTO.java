package com.dto.admin;

import com.dto.member.ParentsMember;

public class AdminDTO extends ParentsMember{

	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminDTO(String userid, String passwd, String username) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.username=username;
	}
	
}
