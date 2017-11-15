<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String telecom_num = request.getParameter("telecom_num");
	String phone_name = request.getParameter("phone_name");
%>
<style>
@import url('http://fonts.googleapis.com/earlyaccess/hanna.css');


html, body, h1, h2, h3, h4, h5, h6, li, p {font-family:'Hanna';}

</style>
<form action="PhoneUpdate">
<table border="0" align="center" height=300 width=500>
	<tr>
		<td><input type="hidden" name="telecom_num" value="<%=telecom_num%>"></td>
	</tr>
	<tr>
		<td>상품 정보 수정 화면입니다.</td>
	</tr>
	<tr>
		<td>휴대폰 상세 설명과 가격만 변경이 가능합니다.</td>
	</tr>
	<tr>
		<td>내용 : <input type="text" name="phone_content"></td>
	</tr>
	<tr>
		<td>가격 : <input type="text" name="phone_price"></td>
	</tr>
	<tr>
		<td><input type="submit" value="수정하기">  <input type="reset" value="취소"></td>
	</tr>
</table>
</form>



