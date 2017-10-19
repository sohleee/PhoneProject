<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<hr>
<div id="div" align="center">
<form action="QNAUpdateServlet" method="post">
<input type="hidden" name="num" value="${retrieve.num}">
<input type="hidden" name="author" value="${retrieve.author}">
<table>
<tr>
<td bgcolor="silver">글번호</td><td>${retrieve.num}</td>
</tr>
<tr>
<td bgcolor="silver">작성일</td><td>${retrieve.writeday}</td>
</tr>
<tr>
<td bgcolor="silver">조회수</td><td>${retrieve.readCnt}</td>
</tr>
<tr>
<td bgcolor="silver">제목</td><td><input type="text" name="title" value="${retrieve.title}" size="50"><br></td>
</tr>
<tr>
<td bgcolor="silver">작성자</td><td>${retrieve.author}<br></td>
</tr>
<tr>
<td bgcolor="silver">내용</td><td><textarea rows="30" cols="100" name="content">${retrieve.content}</textarea></td>
</tr>
</table>
<input type="submit" value="수정">
</form>
<hr>
<c:if test="${sessionScope.userid.equals('admin')}">
<button onclick="qnaReply()">답변달기</button>
<button id="List" onclick="boardList()">목록</button>
<button id="Delete" onclick="boardDelete()">삭제</button>
</c:if>

<c:if test="${!sessionScope.userid.equals('admin')}">
<button id="List" onclick="boardList()">목록</button>
<button id="Delete" onclick="boardDelete()">삭제</button>
</c:if>
</div>

<script>
	function qnaReply(){
		location.href="QNAReplyServlet?title=${retrieve.title}&content=${retrieve.content}";
	}
	
	function boardList(){
		location.href="BoardListServlet";
	}
	
	function boardDelete(){
		location.href="BoardDeleteServlet?num=${retrieve.num}";
	}
</script>