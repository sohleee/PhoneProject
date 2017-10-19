<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("form").on("submit",function(event){
			if($("#username").val()==null || $("#username").val().length == 0){
				alert("이름을 입력하세요");
				$("#username").focus();
				event.preventDefault();
			} else if($("#email").val()==null || $("#email").val().length == 0){
				alert("이메일을 입력하세요");
				$("#email").focus();
				event.preventDefault();
			} 
			//console.log(this);
			this.action="findIDResult";		
			
		});
	});
</script>

<form onsubmit="formchecked" method="post">
 <table align="center">
 	<tr>
 	 <td>이름 </td>
 	 <td><input type="text" name="username" id="username"></td>
 	</tr>
 	<tr>
 	 <td>이메일 </td>
 	 <td><input type="email" name="email" id="email"></td>
 	</tr>
 	<tr>
 	 <td colspan="2" align="center"><input type="submit" value="아이디 찾기" class="button"></td>
 	</tr>
 </table>
</form>

