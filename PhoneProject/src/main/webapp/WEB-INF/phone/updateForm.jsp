<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String telecom_num = request.getParameter("telecom_num");
	String phone_name = request.getParameter("phone_name");
%>
<form action="PhoneUpdate">
<input type="hidden" name="telecom_num" value="<%=telecom_num%>" readonly="readonly"><br>
내용 : <input type="text" name="phone_content"><br>
가격 : <input type="text" name="phone_price"><br>
<input type="submit" value="수정하기">  <input type="reset" value="취소">
</form>