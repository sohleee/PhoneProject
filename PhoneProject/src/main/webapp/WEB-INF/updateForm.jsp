<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>

.carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #000000;
  }
  .carousel-indicators li {
      border-color: #000000;
  }
  .carousel-indicators li.active {
      background-color: #000000;
  }
  .item img {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  </style>
</head>
<body>
<div class="collapse navbar-collapse" align="right">
	<jsp:include page="include/top.jsp"></jsp:include>
</div>
<div align="center"><a href="/phone/"><img src="/phone/images/cc.png" style="width: 300px; height: 100px"></a><br><br> </div>
	<jsp:include page="include/submenu.jsp"></jsp:include>
<div class="row">
  <div class="col-sm-1"></div>
  <div class="col-sm-10">
  		<jsp:include page="phone/updateForm.jsp"/>
		</div>
  <div class="col-sm-1"></div>
</div>

<!-- copyright -->
<footer class="page-footer center-on-small-only stylish-color-dark">
<hr>
<div class="footer-copyright" align="center">
        <div class="container-fluid">
            © 2017 Copyright: <a href="https://www.MDBootstrap.com"> MDBootstrap.com </a>

        </div>
    </div>
    <!--/.Copyright-->

</footer>

</body>
</html>