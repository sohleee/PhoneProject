<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변하기</title>
<script type="text/javascript">

	$(document).ready(function(){
		$("#button").on("click",function(){
			var title =$("#title").val();
			var content=$("#content").val();
			var num=$("#num").text();
			console.log(title,content,num);
		//	$(opener.document).attr('href', "QNARequestMng/title/"+title+"/content/"+content+"/num/"+num);
			opener.location.href='/phone/QNARequestMng/title/'+title+'/content/'+content+"/num/"+num;	
			alert("답변을 완료하였습니다.");
		close();
			
		//	close();
			/*  $.ajax({
					type:"get",
					url:"QNARequestMng",
					dataType:"text",
					data:{
						title:title,
						content:content,
						num:num
					},
					success:function(responseData,status,xhr){
						console.log(responseData);
						alert("답변을 완료하였습니다.");
						close();
					},
					error:function(xhr,status,e){
						console.log(status,e);
					}
				});  
		 */
			
		});
	});
	
</script>
</head>
<body>
<form action="QNARequestMng">
<table border="1">
	<tr>
		<td>제목</td>
		<td><input type="text" id="title">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea id="content" rows="20" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		<td> <input type="button" class="btn btn-default" id="button"value="전송">
		</td>
		<td><input type="reset" class="btn btn-default" value="다시쓰기" > 
		 <span id="num">${num}</span>
		</td>
	</tr>


</table>



</form>
</body>
</html>