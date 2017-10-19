<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form action="AddFile" method="post" enctype="multipart/form-data">
<table border="0">
			<tr>
				<td>카테고리&nbsp;<input type="text" name="telecom_num"></td>
			</tr>
			<tr>
				<td>폰 모델&nbsp;&nbsp;&nbsp;<input type="text" name="phone_model_num"></td>
			</tr>
			<tr>
				<td>폰 이름&nbsp;&nbsp;&nbsp;<input type="text" name="phone_name"></td>
			</tr>
			<tr>
				<td>내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="phone_content"></td>
			</tr>
			<tr>
				<td>가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="phone_price"></td>
			</tr>
			<tr>
				<td>이미지 파일 등록 : <input type="file" name="phone_image"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="등록"><input type="reset" value="취소"></td>
			</tr>
		</table>
		<a href="home.jsp">홈으로 가기</a>
	</form>