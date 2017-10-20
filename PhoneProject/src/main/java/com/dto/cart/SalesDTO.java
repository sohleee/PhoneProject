package com.dto.cart;

public class SalesDTO {

		
	private String ordername;
	private String telecom_num;
	private String phone_model_num;
	private int phone_price;
	private int phone_amount;
	private String orderdate;
	public SalesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getTelecom_num() {
		return telecom_num;
	}
	public void setTelecom_num(String telecom_num) {
		this.telecom_num = telecom_num;
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
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public SalesDTO(String ordername, String telecom_num, String phone_model_num, int phone_price, int phone_amount,
			String orderdate) {
		super();
		this.ordername = ordername;
		this.telecom_num = telecom_num;
		this.phone_model_num = phone_model_num;
		this.phone_price = phone_price;
		this.phone_amount = phone_amount;
		this.orderdate = orderdate;
	}
	@Override
	public String toString() {
		return "SalesDTO [ordername=" + ordername + ", telecom_num=" + telecom_num + ", phone_model_num="
				+ phone_model_num + ", phone_price=" + phone_price + ", phone_amount=" + phone_amount + ", orderdate="
				+ orderdate + "]";
	}
	
}
