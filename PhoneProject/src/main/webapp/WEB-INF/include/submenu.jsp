<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 2번 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="/phone/">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Phone
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li><a href="phoneList">All</a></li>
          <li><a href="/phone/List?phone_model_num=galaxy">Galaxy</a></li>
          <li><a href="/phone/List?phone_model_num=iphone">iPhone</a></li>
        </ul>
      </li>
      <li><a href="/phone/board/boardList">Board</a></li>
      <li><a href="/phone/qna/qnaList">QNA</a></li>
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
