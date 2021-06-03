<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*" %>
<%
	String rid = request.getParameter("rid");
	String rcon = request.getParameter("rcon");
	
	ReplyDAO dao = new ReplyDAO();
	int result = dao.update(rid, rcon);
	
	out.write(String.valueOf(result));
	
%>