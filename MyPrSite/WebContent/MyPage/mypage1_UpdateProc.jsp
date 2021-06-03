<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO" />
<jsp:setProperty name="user" property="*" />
<%
	user.setChk4(request.getParameter("chk4"));
	user.setPass(request.getParameter("cpass"));
	user.setId((String)session.getAttribute("id"));
	System.out.println(user.getId());
	System.out.println(user.getName());
	System.out.println(user.getBirth());
	System.out.println(user.getEmail());
	System.out.println(user.getHp());
	System.out.println("chk : " + user.getChk4());
	System.out.println("id : " + request.getParameter("id"));
	
	//DB연결
	UserDAO dao = new UserDAO();
	boolean result = dao.updateUser(user);
	
	if(result){
		response.sendRedirect("http://localhost:9000/MyPrSite/MyPage/success.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>

