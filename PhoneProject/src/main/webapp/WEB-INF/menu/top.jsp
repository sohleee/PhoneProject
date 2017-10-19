<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
a{text-decoration: none; margin-right: 20px;}
a:hover{color:#242424}
</style>

<c:if test="${empty sessionScope.login}">
<a href="loginForm"> login </a>
<a href="memberForm"> join </a>
<a href=BoardListServlet> 게시판 </a>
<a href="QNAListServlet"> Q&A </a>
<a href="FAQListServlet"> FAQ </a>
</c:if>

<c:if test="${! empty sessionScope.login}">
${sessionScope.login.username}님 &nbsp;
<a href="/Phone82/loginX/mypage"> mypage </a> 
<a href="/Phone82/loginX/logout"> logout</a> 
<a href="BoardListServlet"> 게시판 </a>
<a href="QNAListServlet"> Q&A </a>
<a href="FAQListServlet"> FAQ </a>
<a href="CartListView">장바구니</a>
<a href="OrderHistoryListServlet">주문내역</a>
</c:if>

<hr style="color=#cecece">