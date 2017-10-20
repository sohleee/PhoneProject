package com.dto.cart;

public class CartDTO {
	
	private int num;
	private String userid;
	private String phone_model_num;
	private String phone_name;
	private int phone_price;
	private int phone_amount;
	private String phone_image;
	private String telecom_num;
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartDTO(int num, String userid, String phone_model_num, String phone_name, int phone_price, int phone_amount,
			String phone_image, String telecom_num) {
		super();
		this.num = num;
		this.userid = userid;
		this.phone_model_num = phone_model_num;
		this.phone_name = phone_name;
		this.phone_price = phone_price;
		this.phone_amount = phone_amount;
		this.phone_image = phone_image;
		this.telecom_num = telecom_num;
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
	public String getPhone_model_num() {
		return phone_model_num;
	}
	public void setPhone_model_num(String phone_model_num) {
		this.phone_model_num = phone_model_num;
	}
	public String getPhone_name() {
		return phone_name;
	}
	public void setPhone_name(String phone_name) {
		this.phone_name = phone_name;
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
	public String getTelecom_num() {
		return telecom_num;
	}
	public void setTelecom_num(String telecom_num) {
		this.telecom_num = telecom_num;
	}
	
	
	
}
