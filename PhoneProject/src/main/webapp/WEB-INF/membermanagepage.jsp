<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<title>Admin</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/adminCss.css">


<style>
<!--
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.datainput {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	background-color: #c1c1c1;
}
-->
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#deleteMember").on("click",function(){
			var checkbox= document.querySelectorAll(".box");
			var checkboxList="";
			
			
		 	   for(i=0;i<checkbox.length;i++){
		 		
		 		   if(checkbox[i].checked){
		 			  checkboxList+=checkbox[i].value+"/";
		 			  
		 		   }
		 			  
		 	   }
		 	  console.log(checkboxList);
	
		 	
		 	  $.ajax({
		 		 type:"get",
					url:"memberMngDelete",
					dataType:"text",
					data:{
						num:checkboxList
					},
					success:(responseData,status,xhr)=>{
						
						rePagging();
						
					},
					error:(xhr,status,e)=>{
						
						console.log(e);
						
					}
		 	  });
		});

	
	$("#searchButton").on("click",function(){
		var searchName = $("#searchName").val();
		var searchValue = $("#searchValue").val();
		var perPage = $("#perPage").val();
		console.log(searchName+":"+searchValue);
		  $.ajax({
		 		 type:"get",
					url:"memberManger",
					dataType:"text",
					data:{
						searchName:searchName,
						searchValue:searchValue,
						perPage:perPage
					},
					success:(responseData,status,xhr)=>{
						
						rePagging();
					
					},
					error:(xhr,status,e)=>{
						
						console.log(e);
						
					}
		 	  });
	});
			
	$("[id^='z']").on("click",function(){
		var x=$(this).children("td").eq(1).text();
		$("#updateMember"+x).on("click",function(event){
				
			 		var userid= $("#userid"+x).val();
			 		var member_num= x;
			 		var username= $("#username"+x).val();
			 		var email= $("#email"+x).val();
			 		var phone1= $("#phone1"+x).val();
					var phone2= $("#phone2"+x).val();
					var phone3= $("#phone3"+x).val();
					var post1= $("#post1"+x).val();
					var post2= $("#post2"+x).val();
					var addr1= $("#addr1"+x).val();
					var addr2= $("#addr2"+x).val();
					console.log(addr1,addr2);
					var jobj = new Map();
					jobj.set();
			 		  $.ajax({
					 		 method:"GET",
								url:"memberMngUpdate",
								dataType:"text",
							
								data:{
									userid:userid,
									member_num:member_num,
									username:username,
									email:email,
									phone1:phone1,
									phone2:phone2,
									phone3:phone3,
									post1:post1,
									post2:post2,
									addr1:addr1,
									addr2:addr2
								},
								success:(responseData,status,xhr)=>{
									
									console.log(responseData);
									alert("수정이 완료되었습니다.");
									rePagging();
								},
								error:(xhr,status,e)=>{
									
									console.log(e);
									
								}
					 	  });
			 	 });
		 
		}); 
		

	$(this).mousemove(function(e) {
		//	 console.log(e.pageX,e.pageY);
		/*
		      e.pageX : x좌표
		              e.pageY : y좌표
		 */
	/* 	console.log(e.pageX, e.pageY); */
	
		if (e.pageX < 100) {
			
			$('.sidenav').css("width", "300px");
			
		} else if(e.pageX >180){
			$('.sidenav').css("width", "0");
		}
	});
	function rePagging(){
		var searchName = '${searchName}';
		var searchValue = '${searchValue}';
		var curPage = '${curPage}';
		var perPage ='${perPage}';
		var curIdx ='${curIdx}';
		if(curIdx==null||curIdx=='')
			curIdx="0";
		location.href="memberMng?searchName="+searchName+"&searchValue="+searchValue
				+"&curPage="+curPage+"&perPage="+perPage+"&curIdx="+curIdx;
	}
	});
</script>
</head>
<body>
	<div class="container-fluid"
		style="background-color: gray; color: #fff; height: 100px;">
		<h1>관리자 페이지</h1>
		안녕하세요 ${sessionScope.login.username}<br>
	</div>
	<jsp:include page="admin/adminForm.jsp" flush="true" />
	<div id="initView">
		<jsp:include page="admin/membermanagepage.jsp" flush="true" /><br>
	</div>
</body>
</html>