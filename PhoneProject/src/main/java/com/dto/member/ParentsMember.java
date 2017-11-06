package com.dto.member;

public abstract class ParentsMember {

	protected String userid;
	protected String passwd;
	protected String username;
	public ParentsMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ParentsMember(String userid, String passwd, String username) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	
	
}
