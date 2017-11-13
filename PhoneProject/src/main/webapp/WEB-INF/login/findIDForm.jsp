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
			this.action="findID";		
			
		});
	});
</script>

<style>

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>

<div class="container">

      <form class="form-signin" onsubmit="formchecked" method="post">
        <h3 class="form-signin-heading">Find your ID</h3>
        <hr width="300px;">
        <label for="username" class="sr-only">username</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Name" required>
        <label for="email" class="sr-only">Email</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
        <br><br>
        <button type="submit" value="로그인" class="button" style="width: 300px; height: 45.31px; border-radius: 4px;">아이디 찾기</button>
      </form>

    </div> <!-- /container -->

