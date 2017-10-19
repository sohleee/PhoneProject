<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <script>
 $(document).ready(function(){
	 
var re_pw = /^[A-Za-z0-9_]{5,15}$/; // 비밀번호 검사식
var re_nums = /^[0-9]{3,4}$/; //숫자 검사식
var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식

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

/* //이메일 중복검사
	$("#email").on("blur",function(){
 var email = $(this).val();
 if(email != '' || email.length != 0 ){
	 $.ajax({
		type:"get",
		url : "CheckEmailServlet",
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
}); */

//회원 정보 수정
 $("#memberUpdate").on("click",function(event){
    
	 if($("#passwd").val() == '' || $("#passwd").val().length == 0){
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
	 } else if($("#post1").val() == '' || $("#post1").val().length == 0){
	 		alert("올바른 우편번호를 입력하세요");
	 		$("#post1").focus();
	 		event.preventDefault();
	 }  else if($("#post2").val() == null || $("#post2").val().length == 0){
	 		alert("올바른 우편번호를 입력하세요");
	 		$("#post2").focus();
	 		event.preventDefault();
	 } else if($("#addr1").val() == '' || $("#addr1").val().length == 0){
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
	 } else if(!re_nums.test($("#phone2").val())){
	 		alert("휴대전화 항목이 숫자 형식이 아닙니다");
	 		console.log($("#phone2").val());
	 		$("#phone2").val()="";
	 		$("#phone2").focus();
	 		event.preventDefault();
	 } else if($("#phone2").val() == '' || $("#phone2").val().length == 0){
	 		alert("전화번호을 다시 입력하세요");
	 		$("#phone2").focus();
	 		event.preventDefault();
	 } else if($("#phone3").val() == '' || $("#phone3").val().length == 0){
	 		alert("전화번호을 다시 입력하세요");
	 		$("#phone3").focus();
	 		event.preventDefault();
	 } else if(! re_nums.test($("#phone3").val())){
		 	alert("휴대전화 항목이 숫자 형식이 아닙니다");
	 		console.log($("#phone3").val());
	 		//$("#phone3").val()="";
	 		$("#phone3").focus();
	 		event.preventDefault();
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




<p align="center"><a href="/Phone82/"><img src="images/ddd.png" height="50" width="50"></a></p>
<form name="myform" action="memberUpdate">
<p style="font-size:12px; color:blue; margin-top:-2px; margin-left:10px;" align="center">*는 필수입력사항입니다.</p>
<table align="center">

 <tr>
  <th>*아이디</th>
  <td colspan="3" >${login.userid}<input type="hidden" name="userid" id="userid" value="${login.userid}"></td>
 </tr>
 <tr>
  <th>*비밀번호</th>
  <td colspan="3"><input type="password" name="passwd" id="passwd" placeholder="*비밀번호" value="${login.passwd}" ><div></div></td>
 </tr>
 <tr> 
  <th>*비밀번호 재확인</th>
  <td colspan="3"><input type="password" name="passwd2" id="passwd2" placeholder="*비밀번호 재확인 " ><div></div></td>
 </tr>
 <tr>
  <th>*이름</th>
  <td colspan="3">${login.username}<input type="hidden" name="username" id="username" value="${login.username}"></td>
 </tr>
 <tr>
  <th>*주소</th>
  <td colspan="3">
 <!-- 다음주소 시작:다음에서 제공한것->id,name값 수정x-->
	<input name="post1" id="post1" size="5" readonly="" value="${login.post1}"> -
	<input name="post2" id="post2" size="5" readonly="" value="${login.post2}">
	<input onclick="openDaumPostcode()" type="button" value="*우편번호찾기" >
	<br>
	<input name="addr1" id="addr1" size="40" readonly=""
		placeholder="*도로명주소" value="${login.addr1}">
	<br>
	<span style="line-height: 10%;"><br></span>
	<input name="addr2" id="addr2" size="40" placeholder="*지번주소" value="${login.addr2}">
<!-- 다음주소 끝 -->
  </td>
 </tr>
  <tr>
   <th>*전화번호</th>
   <td nowrap>
   <select name="phone1" id="phone1">
      <c:choose>
       <c:when test="${login.phone1 == '010'}">
         <option value="010" selected>010</option>
         <option value="011">011</option>
         <option value="017">>017</option>
       </c:when>
       <c:when test="${login.phone1 == '011'}">
         <option value="010" >010</option>
         <option value="011" selected>011</option>
         <option value="017">017</option>
       </c:when>
      <c:when test="${login.phone1 == '017'}">
         <option value="010" >010</option>
         <option value="011" >011</option>
         <option value="017" selected>017</option>
      </c:when>
    </c:choose>
     </select>
  
  - <input type="text" name="phone2" id="phone2" placeholder="" SIZE="3" placeholder="*" value="${login.phone2}" maxlength="4">
  - <input type="text" name="phone3" id="phone3" SIZE="3" placeholder="*" value="${login.phone3}" maxlength="4">
  </td>
 </tr>
 <tr>
  <th>*이메일</th>
  <%-- <td colspan="3"><input type="email" name="email" id="email" placeholder="*이메일"  value="${login.email}"  readonly="readonly"><div id="resultCheckEmail"></div></td> --%>
  <td colspan="3"><input type="text" name="email" id="email" value="${login.email}" readonly></td>
 </tr>
 <tr>
  <td colspan="2" align="center" nowrap>
  <span><button  id="memberUpdate" class="button">수정</button> &nbsp;<button onclick="memberDelete(myform)" class="button">탈퇴</button></span>
  </td>
 </tr> 
</table>
 

</form>
<script>

function memberDelete(f){
	  if($("#passwd").val() != $("#passwd2").val()){
	 		alert("비밀번호가 일치하지 않습니다.");
	 		$("#passwd2").focus();
	 		event.preventDefault();
	 } else{
	 f.action="memberDelete"; 
	 }
}
  </script>
  
 