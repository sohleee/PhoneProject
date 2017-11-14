<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="collapse navbar-collapse" align="right">
	<jsp:include page="include/top.jsp"></jsp:include>
</div>
<div align="center"><a href="/phone/"><img src="/phone/images/cc.png" width="400" height="100"></a> </div>
	<jsp:include page="include/submenu.jsp"></jsp:include>
<div class="row">
  <div class="col-sm-1"></div>
  <div class="col-sm-10">
  		<jsp:include page="board/boardWriteForm.jsp"></jsp:include>	
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