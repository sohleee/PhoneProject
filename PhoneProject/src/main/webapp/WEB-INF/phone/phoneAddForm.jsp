<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
@import url('http://fonts.googleapis.com/earlyaccess/hanna.css');


html, body, h1, h2, h3, h4, h5, h6, li, p {font-family:'Hanna';}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
// <![CDATA[
$(document).ready( function($) { 
	var re_phonename = /^[a-z0-9_-]{3,16}$/; 
	var re_price = /^[0-9]{1,11}$/; 
	
	
	var 
		form = $('.form'), 
		uid = $('#uid'), 
		tel = $('#tel');
		
	
	form.submit( function() {
		if (re_id.test(uid.val()) != true) { // 아이디 검사
			alert('[ID 입력 오류] 유효한 ID를 입력해 주세요.');
			uid.focus();
			return false;
		} else if(re_tel.test(tel.val()) != true) { // 전화번호 검사
			alert('[Tel 입력 오류] 유효한 전화번호를 입력해 주세요.');
			tel.focus();
			return false;
		}
	});
	
	
	$('#uid').after('<strong></strong>');
	$('#tel').after('<strong></strong>');
	
	uid.keyup( function() {
		var s = $(this).next('strong'); // strong 요소를 변수에 할당
		if (uid.val().length == 0) { // 입력 값이 없을 때
			s.text(''); // strong 요소에 포함된 문자 지움
		} else if (uid.val().length < 3) { // 입력 값이 3보다 작을 때
			s.text('너무 짧아요.'); // strong 요소에 문자 출력
		} else if (uid.val().length > 16) { // 입력 값이 16보다 클 때
			s.text('너무 길어요.'); // strong 요소에 문자 출력
		}  else { // 입력 값이 3 이상 16 이하일 때
			s.text('적당해요.'); // strong 요소에 문자 출력
		}
	});
	tel.keyup( function() {
		var s = $(this).next('strong'); // strong 요소를 변수에 할당
		var num = parseInt(tel.val());
		if (tel.val().length == 0) { // 입력 값이 없을 때
			s.text(''); // strong 요소에 포함된 문자 지움
		} 
		if (Number.isInteger(num)) { // 입력 값이 3보다 작을 때
			s.text('좋아용'); // strong 요소에 문자 출력
		}else {
			s.text('제발 숫자만!!')
			alert("숫자만 입력해주세요");
		}
	});
	
	
	
});
// ]]>
</script>



<form action="AddFile" method="post" enctype="multipart/form-data">
<table border="0" align="center" height=300 width=500>
			<tr>
				
				<td>통신사&nbsp;&nbsp;&nbsp;</td>
				<td>
					<select name="telecom">
						<option>SKT</option>
						<option>KT</option>
						<option>LG_UPLUS</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>카테고리</td><td><select name="telecom_num">
					<option>G6</option>
					<option>G6E</option>
					<option>G7</option>
					<option>G7E</option>
					<option>G8</option>
					<option>G8E</option>
					<option>I5</option>
					<option>I5s</option>
					<option>I6</option>
					<option>I6s</option>
					<option>I7</option>
					<option>I7s</option>
					<option>I8</option>
					<option>I8s</option>
					<option>IX</option>
				</select></td>
			</tr>
			<tr>
				<td>폰 모델&nbsp;&nbsp;&nbsp;</td><td><select name="phone_model_num">
					<option>iphone</option>
					<option>galaxy</option>
				</select></td>
			</tr>
			<tr>
				<td>폰 이름&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="phone_name" id="uid" required="required"></td>
			</tr>
			<tr>
				<td>내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="phone_content" required="required"></td>
			</tr>
			<tr>
				<td>가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="phone_price" id="tel" required="required"></td>
			</tr>
			<tr>
				<td colspan=2>이미지 파일 등록 : <input type="file" name="phone_image" required="required"></td>
			</tr>
			<tr>
				<td></td><td><input type="submit" value="등록"><input type="reset" value="취소" ></td>
			</tr>
		</table>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/phone/">홈으로 가기</a>
	</form>