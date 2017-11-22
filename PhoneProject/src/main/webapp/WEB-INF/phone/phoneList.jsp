<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">

.imgst {
	width : 300px;
	height : 400px;
	display : inline-table;
	border : 0px;
}

</style>
<script>

	$(document).ready(function(){
		$("[data-color]").on("mouseover",function(){
			console.log("이미지 위에 마우스오버!");
			$(this).css("border","1px solid blue");
		});
		
		$("[data-color]").on("mouseout",function(){
			console.log("마우스아웃!");
			$(this).css("border","#CECECE");
		});
	});

</script>
<table  cellspacing="1000" cellpadding="1000">

	<tr>
		<td>
			<table align="center"  cellspacing="50" cellpadding="50"
				border="0">

				<tr>
					<td height="50"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
					<c:forEach var="xxx" items="${list}" varStatus="status">
					<fmt:parseNumber var="totalNum" integerOnly="true" value="${xxx.phone_price / 24}"></fmt:parseNumber>
						<td data-color="phoneSelect">
							<table style='padding: 15px' border="1" bordercolor="CECECE">
								<tr>
									<td><a href="PhoneRetrieve?telecom_num=${xxx.telecom_num}"  class="no-uline" >
											<div><c:if test="${xxx.telecom=='LG_UPLUS' }"><img src="images/lg-u_.png"  width=30 height=30></c:if>
											<c:if test="${xxx.telecom=='KT' }"><img src="images/kt.jpg"  width=30 height=30></c:if>
											<c:if test="${xxx.telecom=='SKT' }"><img src="images/skt.jpg"  width=30 height=30></c:if></div>
											<img src="images/${xxx.phone_image}" class="imgst">
											
									</a></td>
								</tr>
								<!-- <tr>

									<td height="10">
								</tr> -->
								<tr>
									<td class="td_default" align="center"><a class="a_black"
										href="PhoneRetrieve?telecom_num=${xxx.telecom_num}">
											${xxx.phone_name}<br>
									</a></td>

								</tr>
								<!-- <tr>
									<td height="30">
								</tr> -->
								<%-- <tr>
									<td class="td_gray" align="center">${xxx.phone_content}</td>
								</tr> --%>
								<!-- <tr>
									<td height="10">
								</tr> -->
								<tr>
									<td class="td_red" align="center"><div>${xxx.phone_price } 원</div>
									
									<span><font color="orange"><strong>
										24개월 할부시<br>기계 값 매달 ${totalNum}원 </strong></font></span>
									</td>
									
								</tr>
							</table>
						</td>
					
  					<c:if test="${(status.index+1)%4==0}">


							<tr>
								<td height="20">
							</tr>

						</c:if>
					</c:forEach>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
	<c:if test="${login.userid=='master' }">
		<td height="10"><a href="phoneAddForm">휴대폰 등록하기</a></td>
	</c:if>
	
	</tr>
</table>
