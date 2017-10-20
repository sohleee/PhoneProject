<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<title>Admin</title>
<style>
<!--
.columhead {
	background-color: #eee;
	text-align: center;
	font-weight: bold;
}

.columbody {
	background-color: #DDDDFF;
	text-align: center;
	font-weight: normal;
}

.columbody input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	background-color: #DDDDFF;
}

table {
	width: 90%;
	border-collapse: collapse;
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}

th, td {
	padding: 10px;
}
-->
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#deleteMember").on("click",function(){
			var checkbox= document.querySelectorAll(".box");
			var checkboxList="";
			
			var perPage=$("#perPage").val();
			var curPage=$("#curPage").val();
			var searchName = $("#searchName").val();
			var searchValue = $("#searchValue").val();
			console.log("perPage"+perPage);
			console.log("curPage"+curPage);
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
						num:checkboxList,
						perPage:perPage,
						curPage:curPage,
						searchName:searchName,
						searchValue:searchValue
					},
					success:(responseData,status,xhr)=>{
						
						
						$("#initView").empty();
						$("#initView").wrapInner(responseData);
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
					url:"memberSearch",
					dataType:"text",
					data:{
						searchName:searchName,
						searchValue:searchValue,
						perPage:perPage
					},
					success:(responseData,status,xhr)=>{
						
					
						$("#initView").empty();
						$("#initView").wrapInner(responseData);
					
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
			 		  $.ajax({
					 		 method:"get",
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
								
								},
								error:(xhr,status,e)=>{
									
									console.log(e);
									
								}
					 	  });
			 	 });
		 
		}); 
		
		
	});
</script>
</head>
<body>
<h1>관리자페이지</h1>
<jsp:include page="admin/adminForm.jsp" flush="true" /><br>
<hr>

<div id="initView">
<jsp:include page="admin/membermanagepage.jsp" flush="true" /><br>
</div>
</body>
</html>