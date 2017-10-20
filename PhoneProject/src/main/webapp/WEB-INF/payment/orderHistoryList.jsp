<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>

<table style="margin: auto">
	<tr>
		<td>번호</td>
		<td>이미지</td>
		<td>아이디</td>
		<td>모델명</td>
		<td>가격</td>
		<td>개수</td>
		<td>구입날짜</td>
	</tr>
	<c:forEach items="${list}" var="item">
	<tr>
		<td>${item.num}</td>
		<td><img src="images/${item.phone_image}" width="50" height="50"/></td>
		<td>${item.userid}</td>
		<td>${item.phone_name}</td>
		<td>${item.phone_price}</td>
		<td>${item.phone_amount}</td>
		<td>${item.orderdate}</td>
	</tr>
	</c:forEach>
</table>