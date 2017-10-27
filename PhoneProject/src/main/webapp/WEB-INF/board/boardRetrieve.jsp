<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<div id="div" align="center">


<div align="right" style="padding-right: 20px">
<button id="List" class="btn btn-default" onclick="boardList()">목록</button>
<c:if test="${!empty sessionScope.login}">
<button id="Delete" class="btn btn-default" onclick="boardDelete()">삭제</button>
</c:if>
</div>
<hr>

<input type="hidden" name="author" value="${retrieve.author}">
<table class="table">
	<colgroup>
		<col width="300"/>
		<col width="1000"/>
<tr>
<th>글번호</th><td>${retrieve.boardnum}</td>
</tr>
<tr>
<th>작성일</th><td>${retrieve.writeday}</td>
</tr>
<tr>
<th>조회수</th><td>${retrieve.readCnt}</td>
</tr>
<tr>
<th>제목</th><td>${retrieve.title}</td>
</tr>
<tr>
<th>작성자</th><td>${retrieve.author}<br></td>
</tr>
<tr>
<th>내용</th><td><div id="content"><c:if test="${retrieve.board_image != null}"><img src="../images/${retrieve.board_image}" width="200" height="200"></c:if><br>${retrieve.content}</div></td>
</tr>
</table>
<div align="right">
<c:if test="${sessionScope.login.userid==retrieve.userid}">
<a href="boardUpdateForm?title=${retrieve.title}&content=${retrieve.content}&num=${retrieve.boardnum}&boardnum=${retrieve.boardnum}">수정</a>
</c:if>
</div>


<br>
<div align="left">댓글: ${comment.size()}</div> 
<table class="table">
<c:if test="${comment.size()!=0}">
<c:forEach var="comment" items="${comment}">
<tr>
<td colspan="2">${comment.username}&nbsp;&nbsp;&nbsp;${comment.commentday}&nbsp;&nbsp;
<c:if test="${!empty sessionScope.login}"><a href="commentDelete?userid=${comment.userid}&num=${comment.num}">삭제</a></c:if></td>
</tr>
<tr>
<td colspan="2">${comment.content}</td>
</tr>
</c:forEach>
</c:if>
<tr>
<c:if test="${empty sessionScope.login}">
<td><textarea rows="3" cols="150" id="comment1" disabled="disabled" class="form-control" placeholder="댓글은 로그인 후에 작성이 가능합니다"></textarea></td>
<td><button class="btn btn-default" disabled="disabled">comment</button></td>
</c:if>
<c:if test="${!empty sessionScope.login}">
<td><textarea rows="3" cols="150" id="comment2" class="form-control"></textarea></td>
<td><button class="btn btn-default" onclick="boardComment(event)">comment</button></td>
</c:if>
</tr>
</table>

</div>


<script>
	function boardReply(){
		location.href="boardReply?title=${retrieve.title}&content=${retrieve.content}";	
	}
	
	function boardList(){
		location.href="boardList";
	}
	
	function boardDelete(){
		location.href="boardDelete?boardnum=${retrieve.boardnum}&userid=${retrieve.userid}";
	}
	function boardComment(e){
		console.log($("textarea:last").val());
		if($("textarea:last").val()==''){
			e.preventDefault();
		}
		else{
			var x=$("textarea:last").val();
			console.log(x);
			location.href="boardComment?boardnum=${retrieve.boardnum}&content="+x;
		}
	}
</script>