package com.dto.cart;

public class OrderDTO {
	
	private int num ;
	private String userid;
	private String phone_name ;
	private String phone_model_num ;
	private int phone_price;
	private int phone_amount;
	private String phone_image;
	private String orderName ;
	private String post1  ;
	private String post2;
	private String addr1 ;
	private String addr2 ;
	private String phone;
	private String payMethod ;
	private String telecom_num;
	private String orderdate;
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int num, String userid, String phone_name, String phone_model_num, int phone_price,
			int phone_amount, String phone_image, String orderName, String post1, String post2, String addr1,
			String addr2, String phone, String payMethod, String telecom_num, String orderdate) {
		super();
		this.num = num;
		this.userid = userid;
		this.phone_name = phone_name;
		this.phone_model_num = phone_model_num;
		this.phone_price = phone_price;
		this.phone_amount = phone_amount;
		this.phone_image = phone_image;
		this.orderName = orderName;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
		this.payMethod = payMethod;
		this.telecom_num = telecom_num;
		this.orderdate = orderdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPhone_name() {
		return phone_name;
	}
	public void setPhone_name(String phone_name) {
		this.phone_name = phone_name;
	}
	public String getPhone_model_num() {
		return phone_model_num;
	}
	public void setPhone_model_num(String phone_model_num) {
		this.phone_model_num = phone_model_num;
	}
	public int getPhone_price() {
		return phone_price;
	}
	public void setPhone_price(int phone_price) {
		this.phone_price = phone_price;
	}
	public int getPhone_amount() {
		return phone_amount;
	}
	public void setPhone_amount(int phone_amount) {
		this.phone_amount = phone_amount;
	}
	public String getPhone_image() {
		return phone_image;
	}
	public void setPhone_image(String phone_image) {
		this.phone_image = phone_image;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getPost1() {
		return post1;
	}
	public void setPost1(String post1) {
		this.post1 = post1;
	}
	public String getPost2() {
		return post2;
	}
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getTelecom_num() {
		return telecom_num;
	}
	public void setTelecom_num(String telecom_num) {
		this.telecom_num = telecom_num;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	
}
