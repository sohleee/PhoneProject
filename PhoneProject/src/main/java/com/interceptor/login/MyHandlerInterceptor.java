package com.interceptor.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dto.admin.AdminDTO;
import com.dto.member.MemberDTO;

public class MyHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
	
	  if(session.getAttribute("login")==null) {
		  
		  System.out.println("adto null");
		  if(session.getAttribute("login") == null ) {
		    	//System.out.println("세션없음");
		    	response.sendRedirect("../loginForm");
		    	  System.out.println("dto null");
		    	return false;
		    }
		  else {
			return true;
			}
			
			
	  }
	  else
	  {
		  return true;
	  }
}

}
