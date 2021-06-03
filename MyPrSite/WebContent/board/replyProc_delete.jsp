<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*" %>
<%
	String rid = request.getParameter("rid");

	ReplyDAO dao = new ReplyDAO();
	int result = dao.delete(rid);
	
	out.write(String.valueOf(result));
%>