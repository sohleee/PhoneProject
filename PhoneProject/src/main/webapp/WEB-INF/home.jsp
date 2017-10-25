<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<title>Home</title>
	
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
<c:if test="${!empty requestScope.result}">
	<script>
		alert("${requestScope.result}");
	</script>
</c:if>
<!-- 1번 -->
<div class="collapse navbar-collapse" align="right">
	<jsp:include page="include/top.jsp"></jsp:include>
</div>
<div align="center"><a href="/phone/"><img src="/phone/images/cc.jpg" width="400" height="100"></a> </div>
	<jsp:include page="include/submenu.jsp"></jsp:include>
<div class="row">
  <div class="col-sm-1"></div>
  <div class="col-sm-10">
  	<div class="row">
  	 <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
		<img src="images/main_slide/main_image01.png" width="100%" height="100%">
      </div>
      <div class="item">
		<img src="images/main_slide/main_image02.png" width="100%" height="100%">
      </div>
      <div class="item">
		<img src="images/main_slide/main_image03.png" width="100%" height="100%">
      </div>
      <div class="item">
		<img src="images/main_slide/main_image04.png" width="100%" height="500">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	<div class="row">
	<br>
	<div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
          </a>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-6">
          <a href="#" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
          </a>
        </div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-sm-6">
		<iframe width="100%" height="480" src="https://www.youtube.com/embed/D1X2NBnQKlY" frameborder="0" allowfullscreen></iframe>
	</div>
		<div class="col-sm-6">
		<jsp:include page="map.jsp"></jsp:include>
		</div>
	</div>
	<br>
  	<div class="row">
  	<br>
  		<div class="col-sm-6">
  			<jsp:include page="include/home_part3.jsp"></jsp:include>
  		</div>
  		<div class="col-sm-6">
  			<jsp:include page="include/home_part4.jsp"></jsp:include>
  		</div>
  <br>
  		
	</div>
 		 <div class="col-sm-1"></div>
	</div>
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
