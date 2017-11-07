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
$("#passwdCheck").on("keyup",function(event){
	var passwd = $("#passwd").val();
	var passwdCheck = $("#passwdCheck").val();
	if(passwdCheck =='' || passwd.length ==0){
		$("#passwdCheck").next().text('필수 입력 사항입니다.').css({"color":"red", "font-size":"12px"});
	} else if(passwd != passwdCheck){
		$("#passwdCheck").next().text('비밀번호가 일치하지 않습니다.').css({"color":"red", "font-size":"12px"});
	 } else {
		$("#passwdCheck").next($("div")).empty();
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
	 } else if($("#passwd").val() != $("#passwdCheck").val()){
	 		alert("비밀번호가 일치하지 않습니다.");
	 		$("#passwdCheck").focus();
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

<div class="container">

	<br> <br>
	<!-- 페이지title -->
	<div class="tit-subpage">
		<h2>회원 정보</h2>
	</div>
	<!-- 모달자리 -->
	<hr />
	<br>
	<!-- 본문 들어가는 부분 -->

<form name="myform" class="form-horizontal" role="form" method="post" action="memberUpdate">

<div class="form-group" id="divID">
			<label for="inputId" class="col-lg-2 control-label">*아이디</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyAlphabetAndNumber"
					id="userid" data-rule-required="true" name="userid"
					value="${login.userid}" maxlength="15" readonly>
				<div></div>
			</div>
		</div>
		<div class="form-group" id="divPassword">
			<label for="inputPassword" class="col-lg-2 control-label">*패스워드</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="passwd"
					name="passwd" data-rule-required="true" value="${login.passwd}"
					maxlength="18">
				<div></div>
			</div>
		</div>
		<div class="form-group" id="divPasswordCheck">
			<label for="inputPasswordCheck" class="col-lg-2 control-label">*패스워드
				확인</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="passwdCheck"
					name="passwdCheck" data-rule-required="true"
					maxlength="18">
				<div></div>
			</div>
			<div></div>
		</div>
		<div class="form-group" id="divName">
			<label for="inputName" class="col-lg-2 control-label">*이름</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyHangul" id="username" name="username"
					data-rule-required="true"
					value="${login.username}" readonly maxlength="15">
				<div></div>
			</div>
		</div>

		<div class="form-group" id="divNickname">
			<label for="inputNickname" class="col-lg-2 control-label">*주소</label>
			<div class="col-lg-10">
				<!-- 다음주소 시작:다음에서 제공한것->id,name값 수정x-->
				<input width="5px" name="post1" id="post1" size="5" readonly="" value="${login.post1}">
				- <input name="post2" id="post2" size="5" readonly="" value="${login.post2}"> 
				<input class="btn btn-sm" onclick="openDaumPostcode()" type="button" value="검색"> <br>
				<br> <input class="form-control ma-t" name="addr1"
					id="addr1" size="40" readonly="" value="${login.addr1}"> <br>
				<span style="line-height: 10%;"><br></span> <input
					class="form-control ma-t" name="addr2" id="addr2" size="40"
					value="${login.addr2}">
				<!-- 다음주소 끝 -->
			</div>
		</div>

		<div class="form-group" id="divPhoneNumber">
			<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
				번호</label>
			<div class="col-lg-10">
				<select name="phone1" id="phone1">
      <c:choose>
       <c:when test="${login.phone1 == '010'}">
         <option value="010" selected>010</option>
         <option value="011">011</option>
         <option value="017">017</option>
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
     </select> - 
     <input type="text" name="phone2" id="phone2" SIZE="3"
					value="${login.phone2}" maxlength="4"> - <input type="text"
					name="phone3" id="phone3" SIZE="3" value="${login.phone3}" maxlength="4">
				</td>

			</div>
		</div>
		<div class="form-group" id="divEmail">
			<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-10">
				<input type="email" class="form-control" id="email" name="email"
					data-rule-required="true" value="${login.email}"  maxlength="40">
				<div></div>
			</div>
			
		</div>

		<div class="form-group">
			<label for="inputEmailReceiveYn" class="col-lg-2 control-label">이메일
				수신여부</label>
			<div class="col-lg-10">
				<label class="radio-inline"> <input type="radio"
					id="emailReceiveYn" name="emailReceiveYn" value="Y" checked>
					동의합니다.
				</label> <label class="radio-inline"> <input type="radio"
					id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지
					않습니다.
				</label>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPhoneNumber" class="col-lg-2 control-label">SMS
				수신여부</label>
			<div class="col-lg-10">
				<label class="radio-inline"> <input type="radio"
					id="smsReceiveYn" name="smsReceiveYn" value="Y" checked>
					동의합니다.
				</label> <label class="radio-inline"> <input type="radio"
					id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
				</label>
			</div>
		</div>
		<div class="form-group">
		<br>
			<div class="col-lg-offset-2 col-lg-10">
				  <span><button  id="memberUpdate" class="button">수정</button>
				   &nbsp;<button onclick="memberDelete(myform)" class="button">탈퇴</button></span>
			</div>
		</div>
	</form>
	<br><br>
	<hr />
	<div>
		<p class="text-center">
			<small><strong> phone</strong></small><br> <small>대표 :
				대표 ㆍ 주소 : 에이콘 ㆍ 사업자등록번호:123-12-12345 ㆍ 전화 : 000-000-0000</small><br> <small>Copyrightⓒ
				test.com All rights reserved.</small>
		</p>
	</div>
	<!--// 푸터 들어가는 부분 -->
</div>
  
 