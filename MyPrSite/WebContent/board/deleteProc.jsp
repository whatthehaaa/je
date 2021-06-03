<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*"%>
<% 
	String bid = request.getParameter("bid");
	TableDAO dao = new TableDAO(); 
	boolean result = dao.delete(bid);

	if(result){
		response.sendRedirect("success.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>
