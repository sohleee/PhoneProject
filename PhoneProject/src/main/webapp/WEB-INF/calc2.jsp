<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 
	if(!request.getParameter("v1").trim().isEmpty()&& !request.getParameter("v2").trim().isEmpty()){
	int v1 = Integer.parseInt(request.getParameter("v1").trim());
	int v2 = Integer.parseInt(request.getParameter("v2").trim());
	System.out.print(v1);
	System.out.print(v2);
	out.print(v2+v1);
	}else if(request.getParameter("v1").trim().isEmpty()){
		/* out.print("분할 상환 기간을 선택해주세요.".trim()); */
		out.print("a");
	}else if(request.getParameter("v2").trim().isEmpty()){
		/* out.print("요금제를 선택해주세요.".trim()); */
		out.print("b");
	}else if(request.getParameter("v1").trim().isEmpty()&&request.getParameter("v2").trim().isEmpty()){
		/* out.print("분할 상환 기간과 요금제를 선택해주세요."); */
		out.print("c");
	}
	
	
%>