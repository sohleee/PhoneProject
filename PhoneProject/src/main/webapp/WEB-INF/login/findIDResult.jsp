<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.button_2{
			text-align: center;}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#login").on("click", function(event) {
			location.href = "loginForm";
		});
		$("#findPasswd").on("click", function(event) {
			location.href = "findPasswdForm";
		});
		$("#memberform").on("click", function(event) {
			location.href = "memberForm";
		});
	});
</script>
<p align="center">
		<a href="/phone/"><img src="images/ddd.png" height="50"
			width="50"></a>
	</p>
<p align="center"><strong>아이디 찾기결과</strong></p>

<!-- 아이디 존재 -->
<c:if test="${! empty mesg}">

	
	<table align="center">
	 <tr>
	  <td>
	   <p align="center">${mesg}</p><br>
	  </td>
	 </tr>
	 <tr>
	  <td align="center">
	   	<button id="login" class="button">로그인</button> &nbsp;
		<button id="findPasswd" class="button">비밀번호 찾기</button>
	  </td>
	 </tr>
	
	</table>
</c:if>


<!-- 아이디 존재x -->
<c:if test="${! empty mesg2}">
	
	<table align="center">
	
	<tr>
	 <td>
	  <p align="center">${mesg2}</p><br>
	 </td>
	</tr>
	
	<tr>
	 <td align="center">
	  <button id="memberform" class="button button_2">회원가입</button> &nbsp;
	 </td>
	</tr>
	</table>
</c:if>



