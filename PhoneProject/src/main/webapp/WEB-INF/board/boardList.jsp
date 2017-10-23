<%@page import="com.dto.board.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#perPage").on("change",function(){
			var x=$("#perPage").val();
			location.href="boardList?perPage="+x;
			
		});
		$("[id^='a']").on("click",function(){
			var x=$(this).children("td").eq(0).text();
					location.href="boardRetrieve?boardnum="+x; 
			});
	});
		
		function boardSearch(f){
			f.action="boardList";
		};
		
		function boardWrite(){
			location.href="boardWriteForm";
		}
</script>


<div align="center">
<form name="myForm">
<table class="table table-hover">

	
		<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
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
			<tr id="a${dto.boardnum}">
				<td>${dto.boardnum}</td>
				<td>${dto.title}</td>
				<td>${dto.author}</td>
				<td>${dto.writeday}</td>
				<td>${dto.readCnt}</td>
			</tr>
			</c:forEach>
		</c:if>
		<tfoot>
		<tr>
		<td colspan="5" align="center"><jsp:include page="../page.jsp"></jsp:include></td>
		</tr>
		</tfoot>
		</table>
		
		<table>
		
	</table>
<br>

<% PageDTO bpage=(PageDTO)request.getAttribute("page");
				int perPage=bpage.getPerPage();
				String searchName=bpage.getSearchName();%>
<table>
	<tr align="center">
			<td><select name="searchName">
					<option value="title" <%if(searchName.equals("title")){ %>selected <% }%>>제목</option>
					<option value="author" <%if(searchName.equals("author")){ %>selected <% }%>>작성자</option>
			</select>
			<input type="text" name="searchValue" value="${page.searchValue}">
			<button class="btn btn-default" onclick="boardSearch(myForm)">검색</button>
			
			
			
			<select id="perPage">
			<option value="10" <%if(perPage==10){ %>selected <% }%>>10</option>
			<option value="20" <%if(perPage==20){ %>selected <% }%>>20</option>
			<option value="30" <%if(perPage==30){ %>selected <% }%>>30</option>
			</select>
		</tr>
</table>
</form>

<c:if test="${!empty sessionScope.login}">
<div align="right"><button class="btn btn-default" onclick="boardWrite()">글쓰기</button></div>
</c:if>
<c:if test="${empty sessionScope.login}">
<div align="right"><button class="btn btn-default" data-toggle="modal" data-target="#myModal">글쓰기</button></div>
</c:if>
</div>

 <jsp:include page="../include/check.jsp"></jsp:include>




