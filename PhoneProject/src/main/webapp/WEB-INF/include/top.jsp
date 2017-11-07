<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}
.sidenav a {
    padding: 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
    margin-right: 20px;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    left: 15px;
    font-size: 36px;
    margin-left: 0px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<script>
	function openNav() {
	    document.getElementById("mySidenav").style.width = "250px";
	}

	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	}
	</script>
	
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="loginX/mypage">회원정보</a>
  <a href="/phone/cartList">Cart</a>
  <a href="/phone/orderHistoryList">주문내역</a>
  <a href="#">Question</a>
</div>

<c:if test="${empty sessionScope.login}">
<ul class="nav navbar-nav navbar-right"> 
<li id="navbar-page"><a href="/phone/"><i class="fa fa-home fa-fw"></i><span class="glyphicon glyphicon-home"></span> Home</a></li>
<li id="navbar-login"><a href="/phone/terms"><i class="fa fa-book fa-fw"></i><span class="glyphicon glyphicon-plus"></span> Join</a></li>
<li id="navbar-login"><a href="/phone/loginForm"><i class="fa fa-book fa-fw"></i><span class="glyphicon glyphicon-lock"></span> Login</a></li>
<li id="navbar-login"><a href="#"><span onclick="openNav()"><i class="fa fa-book fa-fw"></i><span class="glyphicon glyphicon-user"></span>MyPage</span></a></li>
</ul>

</c:if>

<c:if test="${!empty sessionScope.login}">
<ul class="nav navbar-nav navbar-right"> 

<li id="navbar-page"><a>${sessionScope.login.username}님</a></li>
<li id="navbar-page"><a href="/phone/"><i class="fa fa-home fa-fw"></i><span class="glyphicon glyphicon-home"></span> Home</a></li>
<li id="navbar-login"><a href="/phone/loginX/logout"><i class="fa fa-book fa-fw"></i><span class="glyphicon glyphicon-plus"></span>Logout</a></li>
<li id="navbar-cart"><a href="/phone/cartList"><i class="fa fa-book fa-fw"></i><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
<li id="navbar-login"><a href="#"><span onclick="openNav()"><i class="fa fa-book fa-fw"></i><span class="glyphicon glyphicon-user"></span>MyPage</span></a></li>
</ul>
</c:if>
