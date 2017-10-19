<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
$(document).ready(function(){
	//정규식 
	var re_id = /^[A-Za-z]+[A-Za-z0-9]{4,14}$/;; // 아이디 검사식
	var re_pw = /^[A-Za-z0-9_]{5,15}$/; // 비밀번호 검사식
	var re_name = /^[A-Za-z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,16}$/; // 이름 검사식
	var re_nums = /^[0-9]{3,4}$/; //숫자 검사식
	var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식

	//아이디 유효성
	$("#userid").on("keyup",function(event){
		var userid = $("#userid").val();
		if(userid =='' || userid.length ==0){
			$("#userid").next().text('필수 입력 사항입니다.').css({"color":"red", "font-size":"12px"});
		} else if(!re_id.test(userid)){
			$("#userid").next().text('아이디는 영문자로 시작하는 5~15자 영문자 또는 숫자이어야 합니다.').css({"color":"red", "font-size":"12px"});
		} else {
			$("#userid").next($("div")).empty();
		}
	});
	
	//아이디 중복검사 
	$("#userid").on("blur",function(){
		 var userid = $(this).val();
		 //console.log(userid);
		 if(re_id.test(userid) && userid.length != 0){
			//ajax 코드
				$.ajax({ //설정값
					type:"get",
					url: "checkID",
					data: {
						userid:$("#userid").val()
					},
					dataType :"text",
					success : function(responseData, status, xhr){
						$("#userid").next($("div")).text(responseData).css({"color":"blue", "font-size":"12px"});
						//console.log("<<",$("#userid").val().length);
						if($("#userid").val().length < 0){$("#resultCheckID").empty();}
						// $("#resultCheckID").hide(800);
						
					},
					error: function(xhr,status,e){
						console.log(status,e);
					} 
				});//ajax
		 }
	});
	
	
	
	 $("#passwd").on("keyup",function(event){
		var passwd = $("#passwd").val();
		if(passwd =='' || passwd.length ==0){
			$("#passwd").next().text('필수 입력 사항입니다.').css({"color":"blue", "font-size":"12px"});
		} else if(!re_pw.test(passwd)){
			$("#passwd").next().text('5자리 이상 15자리 이하 영문과 숫자를 입력하세요.').css({"color":"red", "font-size":"12px"});
		}  else {
			$("#passwd").next().text('사용가능').css({"color":"blue", "font-size":"12px"});
		}
	});
	
	//비밀번호 일치여부
	$("#passwd2").on("keyup",function(event){
		var passwd = $("#passwd").val();
		var passwd2 = $("#passwd2").val();
		if(passwd2 =='' || passwd.length ==0){
			$("#passwd2").next().text('필수 입력 사항입니다.').css({"color":"red", "font-size":"12px"});
		} else if(passwd != passwd2){
			$("#passwd2").next().text('비밀번호가 일치하지 않습니다.').css({"color":"red", "font-size":"12px"});
		 } else {
			$("#passwd2").next($("div")).empty();
		}
	});
	
	//이메일 중복검사
 	$("#email").on("blur",function(){
	 var email = $(this).val();
	 if(email != '' || email.length != 0 ){
		 $.ajax({
			type:"get",
			url : "checkEmail",
			data : {
				email: $("#email").val()
			},
			success : function(responseData, status, xhr){
				console.log(responseData);
				$("#resultCheckEmail").text(responseData).css({"color":"blue", "font-size":"12px"});
			},
			error: function(xhr,status,e){
				console.log(status,e);
			} 
			});
	 }
	});
	 
	
	/* $("#username").on("keyup",function(event){
		var passwd = $("#username").val();
		if(passwd =='' || passwd.length ==0){
			$("#username").next().text('필수 입력 사항입니다.').css({"color":"blue", "font-size":"12px"});
		} else if(!re_name.test(passwd)){
			$("#username").next().text('2자리 이상 16자리 이하 영문과 숫자를 입력하세요.').css({"color":"red", "font-size":"12px"});
		} else {
			$("#username").next().text('사용가능').css({"color":"blue", "font-size":"12px"});
		}
	}); */
	
	//submit
	 $("form").on("submit",function(event){
		 if($("#userid").val() == '' || $("#userid").val().length == 0){
		 		alert("아이디를 입력하세요");    
		 		$("#userid").focus();
		 		event.preventDefault();
		 		//result=false;
		 } else if(!re_id.test($("#userid").val())){
		 		alert("아이디는 영문자로 시작하는 5~15자 영문자 또는 숫자이어야 합니다.");    
		 		$("#userid").focus();
		 		event.preventDefault();
		 		//result=false;
		 } else if($("#passwd").val() == '' || $("#passwd").val().length == 0){
		 		alert("비밀번호를 입력하세요");
		 		$("#passwd").focus();
		 		event.preventDefault();
		 } else if(!re_pw.test($("#passwd").val())){
			 alert("비밀번호에 5자리 이상 15자리 이하 영문과 숫자를 입력하세요.");    
		 		$("#passwd").focus();
		 		event.preventDefault();
		 } else if($("#passwd").val() != $("#passwd2").val()){
		 		alert("비밀번호가 일치하지 않습니다.");
		 		$("#passwd2").focus();
		 		event.preventDefault();
		 } else if($("#username").val() == '' || $("#username").val().length == 0){
		 		alert("이름을 입력하세요");
		 		$("#username").focus();
		 		event.preventDefault();
		 } else if(!re_name.test($("#username").val())){
				alert("이름에 2자리 이상 15자리 이하 영문과 숫자를 입력하세요.");    
		 		$("#username").focus();
		 		event.preventDefault();
		 } /* else if($("#post1").val() == '' || $("#post1").val().length == 0){
		 		alert("올바른 우편번호를 입력하세요");
		 		$("#post1").focus();
		 		event.preventDefault();
		 }  else if($("#post2").val() == null || $("#post2").val().length == 0){
		 		alert("올바른 우편번호를 입력하세요");
		 		$("#post2").focus();
		 		event.preventDefault();
		 } */ else if($("#addr1").val() == '' || $("#addr1").val().length == 0){
		 		alert("올바른 주소를 입력하세요");
		 		$("#addr1").focus();
		 		event.preventDefault();
		 } else if($("#addr2").val() == '' || $("#addr2").val().length == 0){
		 		alert("올바른 주소를 입력하세요");
		 		$("#addr2").focus();
		 		event.preventDefault();
		 } else if($("#phone1").val() == '' || $("#phone1").val().length == 0){
		 		alert("전화번호을 다시 입력하세요");
		 		$("#phone1").focus();
		 		event.preventDefault();
		 }else if($("#phone2").val() == '' || $("#phone2").val().length == 0){
		 		alert("전화번호을 다시 입력하세요");
		 		$("#phone2").focus();
		 		event.preventDefault();
		 }  else if(! re_nums.test($("#phone2").val())){
		 		alert("전화번호 항목이 숫자 형식이 아닙니다");
		 		console.log($("#phone2").val());
		 	//	$("#phone2").val()="";
		 		$("#phone2").focus();
		 		event.preventDefault();
		 	
		 } else if($("#phone3").val() == '' || $("#phone3").val().length == 0){
		 		alert("전화번호을 다시 입력하세요");
		 		$("#phone3").focus();
		 		event.preventDefault();
		 } else if(! re_nums.test($("#phone3").val())){
			 	alert("전화번호 항목이 숫자 형식이 아닙니다");
		 		console.log($("#phone3").val());
		 		//$("#phone3").val()="";
		 		$("#phone3").focus();
		 		event.preventDefault();
		 } else if($("#email").val() == '' || $("#email").val().length == 0){
		 		alert("email을 입력하세요");
		 		$("#email").focus();
		 		event.preventDefault();
		 } else if(!re_mail.test($("#email").val())){
		 		alert("email을 올바르게 입력하세요");
		 		$("#email").focus();
		 		event.preventDefault();
		 } 
		 	else if($('div:contains("사용중")').length >0){
			 alert("이미 사용중인 아이디입니다.");
			 	$("#userid").focus();
			 	console.log($("#userid").text());
		 		event.preventDefault();
		 }  else if($('div:contains("등록된")').length >0){
			 alert("등록된 이메일입니다.");
			 	$("#email").focus();
		 		event.preventDefault();
		 } 
		 else{
			 this.action="memberAdd";
		 }
		 
		 
	 });
	

	
	
	
	
});


</script>

<style>
 table {border: 2px solid gray; width: 650px; table-layout: fixed;
    /* border-collapse: collapse; */}
  th, td { padding: 15px;}
  th{background-color: #F6F6F6; text-align: left;} 

</style>

<!-- DAUM 주소 라이브러리 시작 -->  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script> 
<!-- DAUM 주소 라이브러리 끝 -->    
<p align="center"><a href="/phone/"><img src="images/ddd.png" height="50" width="50"></a></p>
<form name="myform" method="post" action="memberAdd" >
<p style="font-size:12px; color:blue; margin-top:-2px; margin-left:10px;" align="center" >*는 필수입력사항입니다.</p>
<table align="center">
 <tr>
  <th>*아이디</th>
  <td colspan="3"><input type="text" name="userid" id="userid" placeholder="*아이디"  ><div></div></td>
 </tr>
 <tr>
  <th>*비밀번호</th>
  <td colspan="3"><input type="password" name="passwd" id="passwd" placeholder="비밀번호"  ><div></div></td>
 </tr>
 <tr> 
  <th>*비밀번호 재확인</th>
  <td colspan="3"><input type="password" name="passwd2" id="passwd2" placeholder="*비밀번호 재확인 " ><div></div></td>
 </tr>
 <tr>
  <th>*이름</th>
  <td colspan="3"><input type="text" name="username" id="username" placeholder="*이름" ><div></div></td>
 </tr>
 <tr>
  <th>*주소</th>
  <td colspan="3">
 <!-- 다음주소 시작:다음에서 제공한것->id,name값 수정x-->
	<input name="post1" id="post1" size="5" readonly=""  > -
	<input name="post2" id="post2" size="5" readonly="" >
	<input onclick="openDaumPostcode()" type="button" value="*우편번호찾기">
	<br>
	<input name="addr1" id="addr1" size="40" readonly=""
		placeholder="*도로명주소" >
	<br>
	<span style="line-height: 10%;"><br></span>
	<input name="addr2" id="addr2" size="40" placeholder="*지번주소" >
<!-- 다음주소 끝 -->
  </td>
 </tr>
  <tr>
   <th>*전화번호</th>
  <td SIZE=	"3" nowrap><select name="phone1" id="phone1">
  			<option value="010">010</option>
  			<option value="010">011</option>
  			<option value="010">017</option>
  	</select>
  
  - <input type="text" name="phone2" id="phone2"  SIZE="3" placeholder="*"  maxlength="4">
  - <input type="text" name="phone3" id="phone3" SIZE="3" placeholder="*" maxlength="4"></td>
 </tr>
 <tr>
  <th>*이메일</th>
  <td colspan="3"><input type="email" name="email" id="email" placeholder="*이메일" ><div id="resultCheckEmail"></div></td>
 </tr>
 <tr>
  <td colspan="2" align="center" nowrap>
  <span><input type="submit" value="회원가입" class="button">&nbsp;<input type="reset" value="취소" class="button"></span>
  </td>
 </tr> 
</table>
 

</form>




