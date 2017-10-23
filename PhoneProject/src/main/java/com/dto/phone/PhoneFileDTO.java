package com.dto.phone;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Alias("phoneFileDTO")
public class PhoneFileDTO {

	private String telecom_num,phone_model_num,phone_name,phone_content,phone_price,telecom;
	private CommonsMultipartFile phone_image;
	
	
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
	public String getPhone_price() {
		return phone_price;
	}
	public void setPhone_price(String phone_price) {
		this.phone_price = phone_price;
	}
	public CommonsMultipartFile getPhone_image() {
		return phone_image;
	}
	public void setPhone_image(CommonsMultipartFile phone_image) {
		this.phone_image = phone_image;
	}
	public String getTelecom() {
		return telecom;
	}
	public void setTelecom(String telecom) {
		this.telecom = telecom;
	}
	
	
	
	
}
