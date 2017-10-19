<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
.b {
	font-size: 12px;
	color: #363636
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		var userInputId = getCookie("userInputId");
		$("input[name='userid']").val(userInputId);

		if ($("input[name='userid']").val() != "") {
			$("#saveid").attr("checked", true);
		}

		// 체크
		$("#saveid").change(function() {
			if ($("#saveid").is(":checked")) {
				var userInputId = $("input[name='userid']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력.
		$("input[name='userid']").keyup(function() {
			if ($("#saveid").is(":checked")) {
				var userInputId = $("input[name='userid']").val();
				setCookie("userInputId", userInputId, 7);
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>



<div>

	<p align="center">
		<a href="/phone/"><img src="images/ddd.png" height="50"
			width="50"></a>
	</p>

	<p id="title" align="center">MEMBER LOGIN</p>
	<form action="login" method="post">

		<table align="center">

			<tr>
				<td>ID</td>
				<td><input type="text" name="userid" id="userid"></td>
			</tr>
			<tr>
				<td>PASSWORD</td>
				<td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td class="b"><input type="checkbox" name="saveid" id="saveid">아이디
					저장</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인"
					class="button"></td>


			</tr>




		</table>
	</form>
</div>
<p align="center">
	<a href="memberForm" class="a">회원가입 &nbsp;&nbsp;&nbsp;|</a> <a
		href="findIDForm" class="a">아이디 찾기 &nbsp;&nbsp;&nbsp;|</a> <a
		href="findPasswdForm" class="a"> 비밀번호 찾기</a>
</p>
