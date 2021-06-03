<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*" %>
<% 
	String id = (String)session.getAttribute("id");
	UserDAO dao = new UserDAO();
	
	boolean result = dao.withdrawal(id);
	
	if(result){
		response.sendRedirect("http://localhost:9000/MyPrSite/login/logoutAction.jsp");
		/* response.sendRedirect("success.jsp"); */
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>

