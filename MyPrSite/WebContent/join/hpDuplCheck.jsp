<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*" %>
<% 
	String uid = (String)session.getAttribute("id");
	String hp = request.getParameter("hp"); 
	UserDAO dao = new UserDAO();
	int result = -1;
	System.out.println(uid);
	if(uid != null){
		result = dao.hpCheck(hp, uid);
	}else{
		result = dao.hpCheck(hp);
	}
	
	out.write(String.valueOf(result));
	
%>    
