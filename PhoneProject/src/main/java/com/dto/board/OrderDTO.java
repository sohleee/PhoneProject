package com.dto.board;

import org.apache.ibatis.type.Alias;

@Alias("OrderDTO")
public class OrderDTO {
	
	int num;
	String userid;
	String gCode;
	String gSize;
	String gColor;
	int gPrice;
	String gName;
	String gImage;
	int gAmount;
	
	String orderName;
	String post1;
	String post2;
	String addr1;
	String addr2;
	String phone;
	String payMethod;
	String orderDay;
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
	public String getgCode() {
		return gCode;
	}
	public void setgCode(String gCode) {
		this.gCode = gCode;
	}
	public String getgSize() {
		return gSize;
	}
	public void setgSize(String gSize) {
		this.gSize = gSize;
	}
	public String getgColor() {
		return gColor;
	}
	public void setgColor(String gColor) {
		this.gColor = gColor;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgImage() {
		return gImage;
	}
	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	public int getgAmount() {
		return gAmount;
	}
	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
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
	public String getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int num, String userid, String gCode, String gSize, String gColor, int gPrice, String gName,
			String gImage, int gAmount, String orderName, String post1, String post2, String addr1, String addr2,
			String phone, String payMethod, String orderDay) {
		super();
		this.num = num;
		this.userid = userid;
		this.gCode = gCode;
		this.gSize = gSize;
		this.gColor = gColor;
		this.gPrice = gPrice;
		this.gName = gName;
		this.gImage = gImage;
		this.gAmount = gAmount;
		this.orderName = orderName;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
		this.payMethod = payMethod;
		this.orderDay = orderDay;
	}
	@Override
	public String toString() {
		return "OrderDTO [num=" + num + ", userid=" + userid + ", gCode=" + gCode + ", gSize=" + gSize + ", gColor="
				+ gColor + ", gPrice=" + gPrice + ", gName=" + gName + ", gImage=" + gImage + ", gAmount=" + gAmount
				+ ", orderName=" + orderName + ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", phone=" + phone + ", payMethod=" + payMethod + ", orderDay=" + orderDay + "]";
	}
	
	
	
}
