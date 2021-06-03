<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%
		
		String id = null;
		
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		
		if(id != null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다')");
			script.println("location.href = 'http://localhost:9000/MyPrSite/index.jsp'");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		
		int result = userDAO.login(user.getId(),user.getPass());
		if(result==1){//로그인성공
			session.setAttribute("id", user.getId());
			session.setAttribute("pass", user.getPass());
			String name = userDAO.getName(user.getId(), user.getPass());
			session.setAttribute("name", name);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'http://localhost:9000/MyPrSite/index.jsp'");
			script.println("</script>");
		}else if(result == 0){//비밀번호불일치
			response.sendRedirect("http://localhost:9000/MyPrSite/errorPage.jsp?result="+result);
		}else if(result == -1){//아이디가없음
			response.sendRedirect("http://localhost:9000/MyPrSite/errorPage.jsp?result="+result);
		}else if(result == 2){//데이터베이스오류
			response.sendRedirect("http://localhost:9000/MyPrSite/errorPage.jsp?result="+result);
		} 
		
		/*
		else if(result == 0){//비밀번호불일치
			out.write(String.valueOf(result));  //ajax 호출 페이지로 결과 전송
		}else if(result == -1){//아이디가없음
			out.write(String.valueOf(result));  //ajax 호출 페이지로 결과 전송
		}else if(result == 2){//데이터베이스오류
			out.write(String.valueOf(result));  //ajax 호출 페이지로 결과 전송
		}  
		*/
	%>