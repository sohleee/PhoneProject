<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
<h1>답변달기</h1>
<form action="QNAWriteServlet" method="post">
<table>
<tr>
<td bgcolor="silver">제목</td><td><input type="text" name="title" value="└RE:${title}"><br></td>
</tr>
<tr>
<td bgcolor="silver">작성자</td><td><input type="text" name="author" value="관리자"><br></td>
</tr>
<tr>
<td bgcolor="silver">내용</td><td><textarea rows="30" cols="100" name="content">
${content}
----------------------------------------------------

</textarea></td>
</tr>
</table>
<input type="submit" value="쓰기">
<input type="reset" value="취소">

</form>
<hr>
<div align="left"><button onclick="qnaList()">목록</button></div>
</div>


<script>
	function qnaList(){
		location.href="QNAListServlet";
	}
</script>