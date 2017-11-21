<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->

<style>
.ma-t {
	margin-top: -17px;
}
</style>



<script>
$(document).ready(function(){
	//정규식 
	var re_nums = /^[0-9]{3,4}$/; //숫자 검사식
	var re_pw = /^[A-Za-z0-9_]{5,15}$/; // 비밀번호 검사식
	
	//submit
	 $("form").on("submit",function(event){
		if($("#phone1").val() == '' || $("#phone1").val().length == 0){
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
		 		$("#phone2").focus();
		 		event.preventDefault();
		 } else if($("#phone3").val() == '' || $("#phone3").val().length == 0){
		 		alert("전화번호을 다시 입력하세요");
		 		$("#phone3").focus();
		 		event.preventDefault();
		 } else if(! re_nums.test($("#phone3").val())){
			 	alert("전화번호 항목이 숫자 형식이 아닙니다");
		 		console.log($("#phone3").val());
		 		$("#phone3").focus();
		 		event.preventDefault();
		 } else if($('div:contains("사용중")').length >0){
			 alert("다른 sns계정으로 가입된 이메일입니다.");
			 	$("#userid").focus();
			 	console.log($("#userid").text());
		 		event.preventDefault();
		 } else if($("#passwd2").val() == '' || $("#passwd2").val().length == 0){
		 		alert("비밀번호를 입력하세요");
		 		$("#passwd2").focus();
		 		event.preventDefault();
		 } else if(!re_pw.test($("#passwd2").val())){
			 alert("비밀번호에 5자리 이상 15자리 이하 영문과 숫자를 입력하세요.");    
		 		$("#passwd2").focus();
		 		event.preventDefault();
		 } else {
			 this.action="snsAdd";
		 }
	 });
	
	
	//아이디 중복검사 
		$("#passwd2").on("blur",function(){
			 var userid = $(this).val();
			 //console.log(userid);
			 if(userid.length != 0){
				//ajax 코드
					$.ajax({ //설정값
						type:"get",
						url: "checkID",
						data: {
							userid:$("#userid").val()
						},
						dataType :"text",
						success : function(responseData, status, xhr){
							$("#userid").next().text(responseData).css({"color":"blue", "font-size":"12px"});
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
	
	//비번 유효성
		$("#passwd2").on("keyup",function(){
			var passwd2 = $("#passwd2").val();
			if(passwd2 =='' || passwd2.length ==0){
				$("#passwd2").next().text('필수 입력 사항입니다.').css({"color":"blue", "font-size":"12px"});
			} else if(!re_pw.test(passwd2)){
				$("#passwd2").next().text('5자리 이상 15자리 이하 영문과 숫자를 입력하세요.').css({"color":"red", "font-size":"12px"});
			}  else {
				$("#passwd2").next().empty();
			}
		});
	
		$("#passwdCheck").on("blur",function(event){
			var passwd2 = $("#passwd2").val();
			var passwd2Check = $("#passwdCheck").val();
			console.log(passwd2);
			console.log(passwd2Check);
			if(passwd2Check =='' || passwd2.length ==0){
				$("#passwdCheck").next().text('필수 입력 사항입니다.').css({"color":"red", "font-size":"12px"});
			} else if(passwd2 != passwd2Check){
				$("#passwdCheck").next().text('비밀번호가 일치하지 않습니다.').css({"color":"red", "font-size":"12px"});
			 } else {
				$("#passwdCheck").next().empty();
			}
		});
	
	
	
});
</script>


<!-- section전체 좌우측 공간 줌 -->
<div class="container">

	<br> <br>
	<!-- 페이지title -->
	<div class="tit-subpage">
		<h2>Join Us</h2>
	</div>
	<!-- 모달자리 -->
	<hr />
	<br>
	<!-- 본문 들어가는 부분 -->

	<form class="form-horizontal" role="form" method="post">

		<input type="hidden" value="${snsid}" name="snsid" id="snsid">
		<input type="hidden" value="${value}" name="value" id="value">
		<input type="hidden" value="${email}" name="email" id="email">
		
		<div class="form-group" id="divID">
			<label for="inputId" class="col-lg-2 control-label">*아이디</label>
			<div class="col-lg-10">
				<input type="text" class="form-control"
					id="userid" data-rule-required="true" name="userid" id="userid"
					value="${email}" readonly>
					<div></div>
			</div>
		</div>
		
		<div class="form-group" id="divName">
			<label for="inputName" class="col-lg-2 control-label">*이름</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="username" name="username"
					data-rule-required="true"
					value="${username}" readonly>
			</div>
		</div>
		
		<div class="form-group" id="divPassword">
			<label for="inputPassword" class="col-lg-2 control-label">*패스워드</label>
			<div class="col-lg-10">
			 <input type="password" class="form-control" id="passwd2" name="passwd" data-rule-required="true"
			  placeholder="회원 정보를 수정 및 탈퇴할 때 필요한 비밀번호입니다." maxlength="18">
			<div></div>
			</div>
		</div>
		
		<div class="form-group" id="divPasswordCheck">
			<label for="inputPasswordCheck" class="col-lg-2 control-label">*패스워드
				확인</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="passwdCheck"
					name="passwdCheck" data-rule-required="true" placeholder="패스워드 확인"
					maxlength="18">
				<div></div>
			</div>
			<div></div>
		</div>

		<div class="form-group" id="divPhoneNumber">
			<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
				번호</label>
			<div class="col-lg-10">
				<select name="phone1" id="phone1">
					<option value="010">010</option>
					<option value="010">011</option>
					<option value="010">017</option>
				</select> - <input type="text" name="phone2" id="phone2" SIZE="3"
					placeholder="*" maxlength="4"> - <input type="text"
					name="phone3" id="phone3" SIZE="3" placeholder="*" maxlength="4">
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
			<div class="col-lg-offset-2 col-lg-10">
				<span><input type="submit" value="회원가입" class="button"
					class="btn btn-default">&nbsp; <input type="reset"
					value="취소" class="button"></span>
			</div>
		</div>
	</form>


	
	<!--// 본문 들어가는 부분 -->
	<hr />
	<!-- 푸터 들어가는 부분 -->

	<div>
		<p class="text-center">
			<small><strong> phone</strong></small><br> <small>대표 :
				대표 ㆍ 주소 : 에이콘 ㆍ 사업자등록번호:123-12-12345 ㆍ 전화 : 000-000-0000</small><br> <small>Copyrightⓒ
				test.com All rights reserved.</small>
		</p>
	</div>
	<!--// 푸터 들어가는 부분 -->
</div>
