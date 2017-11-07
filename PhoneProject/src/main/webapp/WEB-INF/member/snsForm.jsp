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
		 } else {
			 this.action="snsAdd";
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
		
		<div class="form-group" id="divID">
			<label for="inputId" class="col-lg-2 control-label">*아이디</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyAlphabetAndNumber"
					id="userid" data-rule-required="true" name="userid"
					value="${email}" readonly>
			</div>
		</div>
		
		<div class="form-group" id="divName">
			<label for="inputName" class="col-lg-2 control-label">*이름</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyHangul" id="username" name="username"
					data-rule-required="true"
					value="${username}" readonly>
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
			<div class="col-lg-offset-2 col-lg-10">
				<span><input type="submit" value="회원가입" class="button"
					class="btn btn-default">&nbsp; <input type="reset"
					value="취소" class="button"></span>
				<button type="submit" class="btn btn-default">Sign in</button>
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
