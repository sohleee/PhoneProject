<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


   안녕하세요 ${sessionScope.login.getAdminid()}<br>
  <a href="chartForm">판매현황</a>
  <a href="memberMng">회원 관리</a>
  <a href="QNAResponseForm">질의·응답</a>
  <a href="LogoutServlet">로그아웃</a>
  

