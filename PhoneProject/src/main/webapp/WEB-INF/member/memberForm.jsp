<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
	
	
	
	 $("#passwd2").on("keyup",function(){
		var passwd2 = $("#passwd2").val();
		console.log(passwd2);
		if(passwd2 =='' || passwd2.length ==0){
			$("#passwd2").next().text('필수 입력 사항입니다.').css({"color":"blue", "font-size":"12px"});
		} else if(!re_pw.test(passwd2)){
			$("#passwd2").next().text('5자리 이상 15자리 이하 영문과 숫자를 입력하세요.').css({"color":"red", "font-size":"12px"});
		}  else {
			$("#passwd2").next().empty();
		}
	});
	
	//비밀번호 일치여부
	$("#passwdCheck").on("blur",function(event){
		var passwd2 = $("#passwd2").val();
		var passwdCheck = $("#passwdCheck").val();
		if(passwdCheck =='' || passwd2.length ==0){
			$("#passwdCheck").next().text('필수 입력 사항입니다.').css({"color":"red", "font-size":"12px"});
		} else if(passwd2 != passwdCheck){
			$("#passwdCheck").next().text('비밀번호가 일치하지 않습니다.').css({"color":"red", "font-size":"12px"});
		 } else {
			$("#passwdCheck").next().empty();
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
				$("#email").next().text(responseData).css({"color":"blue", "font-size":"12px"});
				//console.log("<<",$("#userid").val().length);
				if($("#email").val().length < 0){$("#resultCheckEmail").empty();}
			},
			error: function(xhr,status,e){
				console.log(status,e);
			} 
			});
	 }
	});
	 
	
	//submit
	 $("form").on("submit",function(event){
		 if($("#userid").val() == '' || $("#userid").val().length == 0){
		 		alert("아이디를 입력하세요");    
		 		$("#userid").focus();
		 		event.preventDefault();
		 } else if(!re_id.test($("#userid").val())){
		 		alert("아이디는 영문자로 시작하는 5~15자 영문자 또는 숫자이어야 합니다.");    
		 		$("#userid").focus();
		 		event.preventDefault();
		 } else if($("#passwd2").val() == '' || $("#passwd2").val().length == 0){
		 		alert("비밀번호를 입력하세요");
		 		$("#passwd").focus();
		 		event.preventDefault();
		 } else if(!re_pw.test($("#passwd2").val())){
			 alert("비밀번호에 5자리 이상 15자리 이하 영문과 숫자를 입력하세요.");    
		 		$("#passwd2").focus();
		 		event.preventDefault();
		 } else if($("#passwd2").val() != $("#passwdCheck").val()){
		 		alert("비밀번호가 일치하지 않습니다.");
		 		$("#passwdCheck").focus();
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
		 } else if($("#email").val() == '' || $("#email").val().length == 0){
		 		alert("email을 입력하세요");
		 		$("#email").focus();
		 		event.preventDefault();
		 } else if(!re_mail.test($("#email").val())){
		 		alert("email을 올바르게 입력하세요");
		 		$("#email").focus();
		 		event.preventDefault();
		 } else if($('div:contains("사용중")').length >0){
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

	<form class="form-horizontal" role="form" method="post"
		action="memberAdd">

		<div class="form-group" id="divID">
			<label for="inputId" class="col-lg-2 control-label">*아이디</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyAlphabetAndNumber"
					id="userid" data-rule-required="true" name="userid"
					placeholder="5~15자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="15">
				<div></div>
			</div>
		</div>
		
		<div class="form-group" id="divPassword">
			<label for="inputPassword" class="col-lg-2 control-label">*패스워드</label>
			<div class="col-lg-10">
			 <input type="password" class="form-control" id="passwd2" name="passwd" data-rule-required="true"
			  placeholder="패스워드" maxlength="18">
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
		
		<div class="form-group" id="divName">
			<label for="inputName" class="col-lg-2 control-label">*이름</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyHangul" id="username" name="username"
					data-rule-required="true"
					placeholder="2~16자이내의 알파벳, 한글, 숫자만 입력 가능합니다." maxlength="15">
				<div></div>
			</div>
		</div>

		<div class="form-group" id="divNickname">
			<label for="inputNickname" class="col-lg-2 control-label">*주소</label>
			<div class="col-lg-10">
				<!-- 다음주소 시작:다음에서 제공한것->id,name값 수정x-->
				<input width="5px" name="post1" id="post1" size="5" readonly="">
				- <input name="post2" id="post2" size="5" readonly=""> <input
					class="btn btn-sm" onclick="openDaumPostcode()" type="button"
					value="검색"> <br>
				<br> <input class="form-control ma-t" name="addr1"
					id="addr1" size="40" readonly="" placeholder="*도로명주소"> <br>
				<span style="line-height: 10%;"><br></span> <input
					class="form-control ma-t" name="addr2" id="addr2" size="40"
					placeholder="*지번주소">
				<!-- 다음주소 끝 -->
			</div>
		</div>
		
		<div class="form-group" id="divEmail">
			<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-10">
				<input type="email" class="form-control" id="email" name="email"
					data-rule-required="true" placeholder="이메일" maxlength="40">
				<div></div>
			</div>
			
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
				</td>

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
				<span><input type="submit" value="회원가입" class="button"
					class="btn btn-default">&nbsp; <input type="reset"
					value="취소" class="button"></span>
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
