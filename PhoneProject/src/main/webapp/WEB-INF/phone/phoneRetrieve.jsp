<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../xxx.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">
   .important{
     font-weight: bold;
     font-size;
   }
   .blue{
     border-color:blue;
   }
   .imgst1 {
	width : 220px;
	height : 400px;
	display : inline-table;
	border : 0px;
}
   
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		/* $(".typeButton").on("click",function(event){
			$(this).siblings().css("border","2px outset rgb(221, 221, 221)");
			$(this).css("border","2px solid black");
			
    	});
		$(".m24").on("click",function(event){
			$(this).siblings().css("border","2px outset rgb(221, 221, 221)");
			$(this).css("border","2px solid black");
			
    	});
		$(".color").on("click",function(event){
			$(this).siblings().css("border","2px outset rgb(221, 221, 221)");
			$(this).css("border","2px solid black");
			
    	});
		$(".support").on("click",function(event){
			$(this).siblings().css("border","2px outset rgb(221, 221, 221)");
			$(this).css("border","2px solid black");
			
    	});
		$(".type").on("click",function(event){
			$(this).siblings().css("border","2px outset rgb(221, 221, 221)");
			$(this).css("border","2px solid black");
			
    	});
		$(".aaa").on("click",function(event){
			$(this).siblings().css("border","2px outset rgb(221, 221, 221)");
			$(this).css("border","2px solid black");
			
    	}); */
	});
	$(document).ready(function(){
		$("[data-rate]").on("click",function(){
			$.ajax({
				type:"get",
				url:"calc",
				data:{
					v1:$(this).val(),
					v2:$("#price").val()
				},
				dataType:"text",
				success:function(responseData,status,xhr){
					console.log(responseData);
					$("#result").text(responseData);
				},
				error:function(xhr,status,error){
					console.log(error);
				}
			});
		});
	});
	
	$(document).ready(function(){
		$(".rate").on("click",function(){
			
			$.ajax({
				type:"get",
				url:"calc1",
				data:{
					v1:$(".rate").val()
				},
				dataType:"text",
				success:function(responseData,status,xhr){
					console.log(responseData);
					$("#result1").text(responseData);
				},
				error:function(xhr,status,error){
					console.log(error);
				}
			});
		});
	});
	$(document).ready(function(){
		$("#plus").on("click",function(){
			console.log(">>>>>>>>>>>"+$("#result").text()+$("#result1").text());
			$.ajax({
				type:"get",
				url:"calc2",
				data:{
					v1:$("#result").text(),
					v2:$("#result1").text()
				},
				dataType:"text",
				success:function(responseData,status,xhr){
					console.log(responseData);
					$("#result2").text(responseData);
				},
				error:function(xhr,status,error){
					console.log(error);
				}
			});
		});
		
	});
	$(document).ready(function(){
		$("#img_black").on("click", function(){
			 $("#img").attr("src", "images/${dto.phone_image}_black.jpg");
		});
		$("#img_white").on("click", function(){
			 $("#img").attr("src", "images/${dto.phone_image}.jpg");
		});
	});
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<table border="0" align="center" >
		<tr>
			<td rowspan="9">
				<table border="0">
					<tr>
						<td><input type="button" value="<" class="btn btn-default btn-sm"></td>
						<td><img id="img" src="images/${dto.phone_image}" class="imgst1"></td>
						<td><input type="button" value=">" class="btn btn-default btn-sm"></td>
					</tr>
				</table>
			</td>
			<th colspan="2">${dto.phone_name }</th>
			<td colspan="2"></td>
		</tr>
		
		<tr>
			<td>색상,용량 </td>
			<td>
				<!-- <a href="" id="img_black"><i class="xi-radiobox-blank xi-2x" style="color:black"></i></a>
				<a href=""><i class="xi-full-moon xi-2x" style="color:black"></i></a> -->
				<button id="img_black" class="btn btn-default btn-sm">검은색</button>
				<button id="img_white" class="btn btn-default btn-sm">흰색</button> 
				<%-- &nbsp;&nbsp;&nbsp;&nbsp;<a href="PhoneColorServlet?telecom_num=${dto.telecom_num}&color=black" ><img src="images/black.png" width="30"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="PhoneColorServlet" ><img src="images/white.png" width="30"></a> --%>
			</td>
			
		</tr>
		
		<tr>
			<td>가입유형</td>
			<td>
				<input type="button" value="기기변경" class="btn btn-default btn-sm" title="기기변경은 이 버튼을 눌러주세요!">
				<input type="button" value="신규가입" class="btn btn-default btn-sm" title="신규가입 환영합니다!!">
				<input type="button" value="번호이동" class="btn btn-default btn-sm" title="번호 이동하실 분은 이 버튼을 클릭!">
			</td>
			<td>
				<font size="2">&nbsp;&nbsp;&nbsp;기기 값</font><br>
				<div id="result">&nbsp;&nbsp;&nbsp;</div>
			</td>
		</tr>
		<tr>
			<td>분할상환기간</td>
			<td><input type="button" value="24" data-rate="m24" class="btn btn-default btn-sm">
			<input type="button" value="30" data-rate="m24" class="btn btn-default btn-sm">
			<input type="button" value="36"  data-rate="m24" class="btn btn-default btn-sm"></td>
			<td colspan="">
				<font size="2">&nbsp;&nbsp;&nbsp;요금</font><br>
				<div id="result1">&nbsp;&nbsp;&nbsp;</div>
			</td>
		</tr>
		<tr>
			<td>요금제</td>
			<td >
				<select class="rate">
					<option value="87890">LTE 데이터 선택 87.8</option>
					<option value="76890">LTE 데이터 선택 76.8</option>
					<option value="65890">LTE 데이터 선택 65.8</option>
					<option value="54890">LTE 데이터 선택 54.8</option>
					<option value="54890">LTE 데이터 선택 49.3</option>
					<option value="43890">LTE 데이터 선택 43.8</option>
					<option value="38890">LTE 데이터 선택 38.3</option>
					<option value="32890">LTE 데이터 선택 32.8</option>
					<option value="109890" selected>LTE 데이터 선택 109</option>
				</select>&nbsp;&nbsp;&nbsp;
				 <input type="button" id="plus" class="btn btn-default btn-sm" value="계산">
			</td>
			<td colspan="4">
				<font size="2">&nbsp;&nbsp;&nbsp;총합 </font><br>
				&nbsp;&nbsp;&nbsp;<div id="result2">&nbsp;&nbsp;&nbsp;</div>
			</td>
		</tr>
		<tr>
			<td>지원금 유형</td>
			<td>
				<input type="button" id="a" value="단말할인" class="btn btn-default btn-sm" title="단말기 요금 할인은 여기!">
				<input type="button"  value="요금할인" class="btn btn-default btn-sm" title="요금 할인을 원하시는 분은 여기!">
			</td>
		</tr>
		
		
		<tr>
			<td>단말기 가격</td>

			

			<td><input type="text" value="${dto.phone_price}" id="price" readonly="readonly"></td>

		</tr>
		<tr>
			<td></td>
			<td colspan="3"><a href="order?phone_model_num=${dto.phone_model_num}
			&phone_name=${dto.phone_name}&phone_price=${dto.phone_price}&phone_image=${dto.phone_image}
			&telecom_num=${dto.telecom_num}&telecom=${dto.telecom}&phone_amount=1">주문하기</a>  
			<a href="cartAdd?phone_model_num=${dto.phone_model_num}
			&phone_name=${dto.phone_name}&phone_price=${dto.phone_price}&phone_image=${dto.phone_image}
			&telecom_num=${dto.telecom_num}&telecom=${dto.telecom}">장바구니 담기</a>
			<br><a href="updateForm?telecom_num=${dto.telecom_num}">수정</a>    &nbsp;
			 <a href="PhoneDelete?telecom_num=${dto.telecom_num}">삭제</a></td>
			
		</tr>
	</table>

</body>
</html>