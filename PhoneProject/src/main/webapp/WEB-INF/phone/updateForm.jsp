<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String telecom_num = request.getParameter("telecom_num");
%>
<form action="PhoneUpdate">
<input type="text" name="telecom_num" value="<%=telecom_num%>"><br>
내용 : <input type="text" name="phone_content"><br>
가격 : <input type="text" name="phone_price"><br>
<input type="submit" value="수정하기">  <input type="reset" value="취소">
</form>