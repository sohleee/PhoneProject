package com.dto.phone;

import org.apache.ibatis.type.Alias;

@Alias("phoneDTO")
public class PhoneDTO {

	private String telecom_num;
	private String phone_model_num;
	private String phone_name;
	private String phone_content;
	private int phone_price;
	private String phone_image;
	
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
	public String getPhone_name() {
		return phone_name;
	}
	public void setPhone_name(String phone_name) {
		this.phone_name = phone_name;
	}
	public String getPhone_content() {
		return phone_content;
	}
	public void setPhone_content(String phone_content) {
		this.phone_content = phone_content;
	}
	public int getPhone_price() {
		return phone_price;
	}
	public void setPhone_price(int phone_price) {
		this.phone_price = phone_price;
	}
	public String getPhone_image() {
		return phone_image;
	}
	public void setPhone_image(String phone_image) {
		this.phone_image = phone_image;
	}
	public PhoneDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PhoneDTO(String telecom_num, String phone_model_num, String phone_name, String phone_content,
			int phone_price, String phone_image) {
		super();
		this.telecom_num = telecom_num;
		this.phone_model_num = phone_model_num;
		this.phone_name = phone_name;
		this.phone_content = phone_content;
		this.phone_price = phone_price;
		this.phone_image = phone_image;
	}
	@Override
	public String toString() {
		return "PhoneDTO [telecom_num=" + telecom_num + ", phone_model_num=" + phone_model_num + ", phone_name="
				+ phone_name + ", phone_content=" + phone_content + ", phone_price=" + phone_price + ", phone_image="
				+ phone_image + "]";
	}
	
	
}
