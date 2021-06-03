<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO"></jsp:useBean>
<jsp:setProperty name="user" property="*" />
<%
	user.setChk1(request.getParameter("chk1"));
	user.setChk2(request.getParameter("chk2"));
	user.setChk3(request.getParameter("chk3"));
	user.setChk4(request.getParameter("chk4"));
	
	//DB연결
	UserDAO dao = new UserDAO();
	boolean result = dao.join(user);
	
	if(result){
		response.sendRedirect("http://localhost:9000/MyPrSite/join/joinSuccess.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>