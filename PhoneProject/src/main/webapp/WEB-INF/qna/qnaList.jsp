<%@page import="com.dto.board.QNADTO"%>
<%@page import="com.dto.board.QNAPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("[id^='a']").on("click",function(){
		/* var x=$(this).children("td").eq(0).text();
				location.href="QNARetrieveServlet?num="+x;  */
			var x=$(this).children("td").eq(0).text();
				$.ajax({
					type:"get",
					url:"QNAReqeust",
					dataType:"text",
					data:{
						num:x
					},
					success:function(responseData,status,xhr){
						console.log(responseData);
					
						var answer ="";
						var result="";
						/* answer=responseData.split("-");
						
						for(i=0;i<answer.length;i++){
						
							result="<td>"+answer[i]+"</td>";
						}
						 */
						 $("#retrieve"+x).html(responseData).toggle();
						
					},
					error:function(xhr,status,e){
						console.log(status,e);
					}
				});
			
		});
	});
</script>

<c:if test="${!empty requestScope.key}">
	<script>
	alert("${requestScope.key}");
	</script>
</c:if>


<div align="center">
<form action="qnaWrite" method="post">
<input type="hidden" name="author" value="${sessionScope.login.username}">
<input type="hidden" name="userid" value="${sessionScope.login.userid}">
<br>
<h3 align="left">문의하기</h3>
<table class="table">
<tr>
<td>문의제목</td><td><input type="text" name="title" value="${dto.title}" size="50"><br></td>
</tr>
<tr>
<td>작성자</td><td>${username}</td>
</tr>
<tr>
<td>문의내용</td><td><textarea rows="20" cols="100" name="content">${dto.content}</textarea></td>
</tr>
</table>
<input class="btn btn-default" type="submit" value="문의하기">
<input class="btn btn-default" type="reset" value="취소">
</form>
<br><br>
<h3 align="left">나의 문의내역</h3>
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
			<tr id="a${dto.num}">
				<td>${dto.num}</td>
				<td>${dto.title}</td>
				<td>${dto.author}</td>
				<td>${dto.writeday}</td>
				<td>${dto.readCnt}</td>
			</tr>
			<tr id="retrieve${dto.num}" style="display:none;">
			</tr>
			
			</c:forEach>
			
		</c:if>
		</table>
		
		<table>
		<tr>
		<td colspan="5" align="center"><jsp:include page="../qnapage.jsp"></jsp:include></td>
		</tr>
	</table>
	<hr>

	
</div>
