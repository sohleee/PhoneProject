<%@page import="com.dto.qna.QNAPageDTO"%>
<%@page import="com.dto.board.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(()=>{
		$("#perPage").on("change",function(){
			var x=$("#perPage").val();
			location.href="QNAResponseServlet?perPage="+x;
			
		});
	
	
	});
	$(document).ready(()=>{
		
		$("[id^='a']").on("click",function(){
		
			/* var x=$(this).children("td").eq(0).text(); */
			var num=$(this).children("td").eq(0).text();

				
				// $("#resultarea"+x).toggle();
				var x= (screen.availWidth-500)/2;
				var y=(screen.availHeight-500)/2;
				var rewin=window.open("/phone/response_window/num/"+num,"답변하기","width=500, height=500,left="+x+",top="+y);
			
				
				$(rewin.document).ready(function () {
					console.log(num,rewin,$(rewin.document));
					  $(rewin.document).contents().find('#num').text(num);
					});
				
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
				
			/* 	$(rewin.document).ready(function(){
				//	$(rewin.document).find("#num").text(num);
					
				}); */
				/* 	$("#reply"+x).on("click",function(){
						
						var text_area = $("#result"+x).val();
						console.log(text_area);
						$(location).attr('href','QNAReqeustMngServlet?textValue=text_area&num=x');
						
					 
						 $.ajax({
							type:"get",
							url:"QNAReqeustMngServlet",
							dataType:"text",
							data:{
								textValue:text_area,
								num:x
							},
							success:function(responseData,status,xhr){
								console.log(responseData);
								alert("답변을 완료하였습니다.");
								$("#retrieve"+x).text(responseData).toggle();
							},
							error:function(xhr,status,e){
								console.log(status,e);
							}
						});  
					}); */
			
		
	
		/*  */
	});
	});	
		function boardSearch(f){
			f.action="QNAResponseServlet";
		};
		
	
</script>

<c:if test="${!empty requestScope.write}">
  <script>
    alert('${requestScope.write}');
  </script>
</c:if>

<div align="center">
<hr>
<input type="hidden" name="ptitle">
<input type="hidden" name="pcontent">
<form name="myForm">
<table>
	<colgroup>
	<col width="100"/>
	<col width="200"/>
	<col width="400"/>
	<col width="100"/>
	<col width="100"/>
	<col width="100"/>
	</colgroup>
	
		<tr bgcolor="silver">
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	
		<c:set var="list" value="${page.getList()}"></c:set>
		<c:if test="${list.size()==0}">
			<tr>
			<td colspan="5" align="center">게시물이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach var="dto" items="${list}">
			<tr id="a${dto.num}">
				<td>${dto.num}</td>
				<td>${dto.title}</td>
				<td>${dto.content}</td>
				<td>${dto.author}</td>
				<td>${dto.writeday}</td>
				<td>${dto.readCnt}</td>
			</tr>
			<tr>
				<td id="resultarea${dto.num}" style="display:none" 
				colspan="5" align="center"><textarea id="result${dto.num}" style="resize:none;"
				 cols="50" rows="5" ></textarea>
				<button id="reply${dto.num}">답글달기</button>
				</td>
				
			</tr>
			</c:forEach>
		</c:if>
		</table>
		
		<hr>
		<table>
		<tr>
		<td colspan="5" align="center"><jsp:include page="../qnaMnaPage.jsp"></jsp:include></td>
		</tr>
	</table>
<br>

<table>
	<tr>
			<td colspan="5"><select name="searchName">
					<option value="title">제목</option>
					<option value="author">작성자</option>
			</select>
			<input type="text" name="searchValue" value="${page.searchValue}">
			<button onclick="boardSearch(myForm)">검색</button>
			
			<% QNAPageDTO bpage=(QNAPageDTO)request.getAttribute("page");
				int perPage=bpage.getPerPage();%>
			
			<select id="perPage">
			<option value="10" <%if(perPage==10){ %>selected <% }%>>10</option>
			<option value="20" <%if(perPage==20){ %>selected <% }%>>20</option>
			<option value="30" <%if(perPage==30){ %>selected <% }%>>30</option>
			
			</select>
			</td>
		</tr>
		
</table>
</form>
</div>




