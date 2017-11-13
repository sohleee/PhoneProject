<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chart</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/adminCss.css">

<script src="https://code.highcharts.com/highcharts.src.js"></script>

<script src="chart/highcharts-3d.js"></script>
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
	$(document).ready(()=>{
		$(this).one(function(){
			
		});
		var dataa ={
				/* 	start:encodeURI($("#start").val()),
					finish:encodeURI($("#finish").val()) */
					start:'2017-01-31',
					finish:'2017-12-31'
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
		$(this).mousemove(function(e) {
			//	 console.log(e.pageX,e.pageY);
			/*
			      e.pageX : x좌표
			              e.pageY : y좌표
			 */
			//console.log(e.pageX, e.pageY);
			if (e.pageX < 150) {
				
				$('.sidenav').css("width", "200px");
				
			} else if (e.pageX > 180) {
				$('.sidenav').css("width", "0");
			}
		});
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
	<div class="container-fluid"
		style="background-color: gray; color: #fff; height: 100px;">
		<h1>관리자 페이지</h1>
		안녕하세요 ${sessionScope.login.username}<br>
	</div>
	<jsp:include page="admin/adminForm.jsp" flush="false" />

	<div class="row">

		<div class=" col-lg-offset-4">

			<table border="1"
				style="text-align: center; font-weight: bold; margin-top: 3%;"
				width="400">
				<tr>
					<td>핸드폰 판매 실적</td>
				</tr>
				<tr>
					<td>
						<table border="1">
							<tr>
								<td>ToDay</td>
								<td>Month</td>
								<td class="col-lg-2"><input type="date" name="start"
									class="form-control" id="start" value="2017-01-01">~ <input
									type="date" class="form-control" name="finish" id="finish"
									value="2017-12-31"></td>
							</tr>
							<tr>
								<td>${today}개</td>
								<td>${month}개</td>
								<td><input type="button" class="btn btn-default"
									id="dateSearch" value="검색" /></td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<div id="result"></div>
</body>
</html>