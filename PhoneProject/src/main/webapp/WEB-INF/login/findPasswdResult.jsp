<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#login").on("click",function(event){
		location.href="loginForm";
	});
	$("#updatePasswd").on("click",function(event){
		location.href="passwdUpdateForm";
	});
	$("#memberform").on("click",function(event){
		location.href="memberForm";
	});
});
</script>

<p align="center">
		<a href="/phone/"><img src="images/ddd.png" height="50"
			width="50"></a>
	</p>
	<p align="center"><strong>비밀번호 찾기 결과</strong></p>

<!--  -->
<<c:if test="${! empty mesg}">

	<table align="center">
	 <tr>
	  <td>
	   <p align="center">${mesg}</p><br>
	  </td>
	 </tr>
	 <tr>
	  <td align="center">
	   	<button id="login" class="button">로그인</button> &nbsp;
	  </td>
	 </tr>
	</table>
	
</c:if>



<!--  -->
<c:if test="${! empty mesg2}">

<table align="center">
	 <tr>
	  <td>
	   <p align="center">${mesg2}</p><br>
	  </td>
	 </tr>
	 <tr>
	  <td align="center">
	   	<button id="memberform"  class="button">회원가입</button> &nbsp;
	  </td>
	 </tr>
	</table>

</c:if>



