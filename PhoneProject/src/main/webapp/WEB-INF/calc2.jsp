<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 

	int v1 = Integer.parseInt(request.getParameter("v1").trim());
	int v2 = Integer.parseInt(request.getParameter("v2").trim());
	System.out.print(v1);
	System.out.print(v2);
	out.print(v2+v1);
%>