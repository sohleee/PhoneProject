package com.dto.admin;

public class AdminDTO {

	private String userid;
	private String passwd;
	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminDTO(String userid, String passwd) {
		super();
		this.userid = userid;
		this.passwd = passwd;
	}
	public String getAdminid() {
		return userid;
	}
	public void setAdminid(String adminid) {
		this.userid = adminid;
	}
	public String getAdminpw() {
		return passwd;
	}
	public void setAdminpw(String adminpw) {
		this.passwd = adminpw;
	}
	@Override
	public String toString() {
		return "AdminDTO [" + (userid != null ? "userid=" + userid + ", " : "")
				+ (passwd != null ? "passwd=" + passwd : "") + "]";
	}
	
}
