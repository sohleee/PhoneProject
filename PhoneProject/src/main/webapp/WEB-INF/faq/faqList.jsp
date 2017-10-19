<%@page import="com.dto.FAQPageDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("[id^='a']").on("click",function(){
			var x=$(this).children("td").eq(0).text();	
				$.ajax({
				type:"get",
				url:"faqRetrieve",
				dataType:"text",
				data:{
					num:x
				},
				success:function(responseData,status,xhr){
					console.log(responseData);
					$("#retrieve"+x).text(responseData).toggle();
				},
				error:function(xhr,status,e){
					console.log(status,e);
				}
			});
		});	 
	});
		
		function faqSearch(f){
			f.action="faqList";
			
		};
		
</script>

<div align="right">게시물수: ${page.totalCount}<br></div>
<form name="myForm">
<input type="hidden" name="category" value="${category}">
<table class="table">
	<colgroup>
	<col width="100"/>
	<col width="1200"/>
		<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
		</tr>
		</thead>
		<c:set var="list" value="${page.getList()}"></c:set>
		<c:if test="${list.size()==0}">
			<tr>
			<td colspan="5" align="center">게시물이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach var="dto" items="${list}">
			<tr id="a${dto.num}">
				<td>${dto.num}</td>
				<td><b>${dto.title}</b></td>
			</tr>
			<tr>
			<td></td><td id="retrieve${dto.num}" align="center" style="display:none;"></td>
			</tr>
			</c:forEach>
		</c:if>
		</table>
		
		<div align="center">
		<table>
		<tr>
		<td colspan="5" align="center"><jsp:include page="../faqPage.jsp"></jsp:include></td>
		</tr>
	</table>
<br>

<% FAQPageDTO bpage=(FAQPageDTO)request.getAttribute("page");
	int perPage=bpage.getPerPage();
	String searchValue=bpage.getSearchValue(); %>
			
<table>
	<tr>
			<td colspan="5">
				
			<input type="text" name="searchValue" value="${page.searchValue}">
			<button onclick="faqSearch(myForm)">검색</button>
			
			</td>
		</tr>
</table>
</div>
</form>




