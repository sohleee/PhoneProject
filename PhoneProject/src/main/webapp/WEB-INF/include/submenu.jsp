<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <jsp:include page="../include/check.jsp"></jsp:include>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="/phone/">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Phone
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li><a href="/phone/phoneList">All</a></li>
          <li><a href="/phone/List?telecom=KT">KT</a></li>
          <li><a href="/phone/List?telecom=SKT">SKT</a></li>
          <li><a href="/phone/List?telecom=LG_UPLUS">LG_UPLUS</a></li>
        </ul>
      </li>
      <li><a href="/phone/board/boardList">Board</a></li>
      <c:if test="${!empty sessionScope.login}">
      	<li><a href="/phone/qna/qnaList">QNA</a></li>
      </c:if>
      <c:if test="${empty sessionScope.login}">
      	<li><a href="#" data-toggle="modal" data-target="#myModal">QNA</a></li>
      </c:if>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="/phone/faq/faqList">FAQ
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
       		<li class="nav-item"><a href="/phone/faq/faqList?category=all">All</a></li>
			<li class="nav-item"><a href="/phone/faq/faqList?category=member">회원정보</a></li>
			<li class="nav-item"><a href="/phone/faq/faqList?category=order">주문/결제</a></li>
			<li class="nav-item"><a href="/phone/faq/faqList?category=cancel">취소/반품</a></li>
		</ul>
    </ul>
    
    
  </div>
</nav>
