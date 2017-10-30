<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<form action="AddFile" method="post" enctype="multipart/form-data">
<table border="0">
			<tr>
				
				<td>통신사&nbsp;&nbsp;&nbsp;<select name="telecom">
					<option>SKT</option>
					<option>KT</option>
					<option>LG_UPLUS</option>
				</select></td>
			</tr>
			<tr>
				<td>카테고리&nbsp;&nbsp;&nbsp;<select name="telecom_num">
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
				<td>폰 모델&nbsp;&nbsp;&nbsp;<select name="phone_model_num">
					<option>iphone</option>
					<option>galaxy</option>
				</select></td>
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