<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/phone/css/adminCss.css">
<style>

</style>
<script>
	$(this).mousemove(function(e) {
		//	 console.log(e.pageX,e.pageY);
		/*
		      e.pageX : x좌표
		              e.pageY : y좌표
		 */
		//console.log(e.pageX, e.pageY);
		if (e.pageX < 100) {

			$('.sidenav').css("width", "200px");

		} else if (e.pageX > 180) {
			$('.sidenav').css("width", "0");
		}
	});
</script>

</head>
<body>

	<c:if test="${!empty requestScope.result}">
		<script>
			alert("${requestScope.result}");
		</script>
	</c:if>
	<div class="container-fluid"
		style="background-color: gray; color: #fff; height: 100px;">
		<h1>관리자 페이지</h1>
	안녕하세요 ${sessionScope.login.username}<br>
	</div>
	<jsp:include page="admin/adminForm.jsp" flush="false" />
	<jsp:include page="admin/qnaResponse.jsp"></jsp:include>

</body>
</html>