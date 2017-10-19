<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



   <c:set var="dto" value="${page}"></c:set>
   <c:set var="curPage" value="${dto.curPage}"></c:set>
   <c:set var="perPage" value="${perPage}"></c:set>
   <c:set var="totalCount" value="${dto.getTotalCount()}"></c:set>
   <fmt:parseNumber var="totalNum" integerOnly="true" value="${totalCount/perPage}"></fmt:parseNumber>
   <c:set var="perBlock" value="5"></c:set>
   <c:if test="${curPage%5==0}">
   <fmt:parseNumber var="curBlock" integerOnly="true" value="${curPage/perBlock}"></fmt:parseNumber>
   </c:if>
   <c:if test="${curPage%5!=0}">
   <fmt:parseNumber var="curBlock" integerOnly="true" value="${curPage/perBlock+1}"></fmt:parseNumber>
   </c:if>
   <fmt:parseNumber var="startPage" integerOnly="true" value="${(curBlock-1)*perBlock+1}"></fmt:parseNumber>
   <fmt:parseNumber var="endPage" integerOnly="true" value="${startPage+perBlock-1}"></fmt:parseNumber>
   
	<c:if test="${totalCount%perPage!=0}">
		<c:set var="totalNum" value="${totalNum+1}"></c:set>
	</c:if>	
 	
	<c:if test="${endPage>totalNum}">
		<c:set var="endPage" value="${totalNum}"></c:set>
	</c:if>			
 	
 	<c:if test="${startPage<1}">
		<c:set var="startPage" value="1"></c:set>
		<c:out value="${startPage}"></c:out>
	</c:if>			
 	
 	<c:if test="${totalNum==0}">1</c:if>
 	
 	
 	<c:if test="${totalNum!=0}">
 		<c:if test="${startPage==1}">&lt;&lt;&nbsp;</c:if>
 		<c:if test="${startPage!=1}">
 				<a href='QNAListServlet?
 				perPage=${perPage}&searchName=${dto.searchName}
 				&searchValue=${dto.searchValue}&curPage=${startPage-1}'>&lt;&lt;</a>
 		</c:if>
 		<c:if test="${curPage==1}">&lt;</c:if>
 		<c:if test="${curPage!=1}">
 				<a href='QNAListServlet?
 				perPage=${perPage}&searchName=${dto.searchName}
 				&searchValue=${dto.searchValue}&curPage=${curPage-1}'>&lt;</a>
 		</c:if>&nbsp;
 			<c:forEach begin="${startPage}" end="${endPage}" varStatus="status">
 			<c:if test="${curPage==status.index}">${status.index}</c:if>
 			<c:if test="${curPage!=status.index}">
			<a href='QNAListServlet?perPage=${perPage}&searchName=${dto.searchName}&searchValue=${dto.searchValue}&curPage=${status.index}'>${status.index}</a>&nbsp;
			</c:if>
 			</c:forEach>&nbsp;
 			<c:if test="${curPage>=totalNum}">&gt;</c:if>
 			<c:if test="${curPage<totalNum}">
 				<a href='QNAListServlet?
 				perPage=${perPage}&searchName=${dto.searchName}
 				&searchValue=${dto.searchValue}&curPage=${curPage+1}'>&gt;</a>
 			</c:if>
 			<c:if test="${endPage>=totalNum}">&gt;&gt;</c:if>
 			<c:if test="${endPage<totalNum}">
 				<a href='QNAListServlet?
 				perPage=${perPage}&searchName=${dto.searchName}
 				&searchValue=${dto.searchValue}&curPage=${endPage+1}'>&gt;&gt;</a>
 			</c:if>
 			
 	</c:if>	
