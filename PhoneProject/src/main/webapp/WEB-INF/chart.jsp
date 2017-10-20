<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chart</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script src="chart/highcharts.js"></script>
<script src="chart/highcharts-3d.js"></script>
<script type="text/javascript">
	$(document).ready(()=>{
		$("#dateSearch").on("click",function(){
			console.log($("#start").val());
			var dataa ={
				/* 	start:encodeURI($("#start").val()),
					finish:encodeURI($("#finish").val()) */
					start:$("#start").val(),
					finish:$("#finish").val()
				};
			var result="";
		$.ajax({
			type:"get",
			url:"chartData",
			dataType:"text",
			data:dataa,
			success:(responseData,status,xhr)=>{
				console.log(responseData);
				$("#result").html(responseData);
			},
			error:(xhr,status,e)=>{
				console.log("bbbbbbbbb");
				console.log(e);
				
			}// httpxml,errorState, message
			});
		});
	});
</script>
</head>
<body>
	<h1>관리자페이지</h1>
	<jsp:include page="admin/adminForm.jsp" flush="true" /><br>
	<hr>
	<input type="text" name="start" id="start" value="2017/01/01">~
	<input type="text" name="finish" id="finish" value="2017/12/31">
	<input type="button" id="dateSearch" value="검색" />
	<div id="result"></div>
</body>
</html>