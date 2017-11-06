<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/adminCss.css">
<style>

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$(this).mousemove(function(e) {
			//	 console.log(e.pageX,e.pageY);
			/*
			      e.pageX : x좌표
			              e.pageY : y좌표
			 */
			console.log(e.pageX, e.pageY);
			if (e.pageX < 150) {
				
				$('.sidenav').css("width", "200px");
				
			} else {
				$('.sidenav').css("width", "0");
			}
		});

	});
</script>
<link rel="shortcut icon" href="favicon.ico">
<title>Admin</title>

</head>
<body>
	<div class="container-fluid"
		style="background-color: gray; color: #fff; height: 100px;">
		<h1>관리자 페이지</h1>
		안녕하세요 ${sessionScope.login.getUserid()}<br>
	</div>
	
		<jsp:include page="admin/adminForm.jsp" flush="false"/>
<!-- 	<div id="mySidenav" class="sidenav">
		<div>

			<ul>
				<li><a href="chartForm">판매현황</a></li>
				<li><a href="memberMng">회원관리</a></li>
				<li><a href="QNAResponseForm">질의응답</a></li>
				<li><a href="LogoutServlet">로그아웃</a></li>
			</ul>
		</div>
	</div> -->
</body>
</html>