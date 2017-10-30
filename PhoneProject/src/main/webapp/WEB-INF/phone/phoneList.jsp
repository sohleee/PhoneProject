<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">

.imgst {
	width : 300px;
	height : 400px;
	display : inline-table;
	border : 0px;
}
</style>

<table  cellspacing="1000" cellpadding="1000">

	<tr>
		<td>
			<table align="center"  cellspacing="50" cellpadding="50"
				border="0">

				<tr>
					<td height="50"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
					<c:forEach var="xxx" items="${list}" varStatus="status">

						<td>
							<table style='padding: 15px' border="1" bordercolor="CECECE">
								<tr>
									<td><a href="PhoneRetrieve?telecom_num=${xxx.telecom_num}"  class="no-uline" >
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
									</a> <!-- <font color="gray"> -------------------- </font> --></td>

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
									<td class="td_red" align="center"><font color="orange"><strong>
												${xxx.phone_price / 24} </strong></font></td>
									<td><fmt:parseNumber var="totalNum" integerOnly="true" value="${xxx.phone_price / 24}"></fmt:parseNumber></td>
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
		<td height="10"><a href="phoneAddForm">휴대폰 등록하기</a></td>
	</tr>
</table>
