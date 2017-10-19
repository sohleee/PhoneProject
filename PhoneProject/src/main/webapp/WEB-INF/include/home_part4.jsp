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
					/* location.href="boardRetrieve?boardnum="+x;  */
			});
	});
		
		function boardSearch(f){
			f.action="boardList";
		};
		
		
</script>

<form name="myForm">
<div align="left"><h3>FAQ</h3></div>
<div align="right"><a href="/phone/faq/faqList?category=all"><span class="glyphicon glyphicon-plus"></span>더보기</a></div>
<table class="table table-hover">
		<thead>
		<tr>
			<th>제목</th>
		</tr>
		</thead>
	
		<c:set var="list" value="${fpage.getList()}"></c:set>
		<c:if test="${list.size()==0}">
			<tr>
			<td colspan="5" align="center">게시물이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach var="dto" items="${list}">
			<tr id="a${dto.num}">
				<td>${dto.title}</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</form>