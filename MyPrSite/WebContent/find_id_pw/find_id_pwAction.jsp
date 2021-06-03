<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO"/>
<jsp:setProperty name="user" property="*"/>
<%
    String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String id = request.getParameter("id");
	
	UserDAO dao = new UserDAO();
	JoinVO vo = new JoinVO();
	if(id==null){
		int result = dao.findNamePhoneFormCheck(name,phone);
		if(result==1){//이름이틀림
			response.sendRedirect("find_id_pw.jsp?code="+1);
		}else if(result==2){//전번이틀림
			response.sendRedirect("find_id_pw.jsp?code="+2);
		}else if(result==-1){//둘다없음
			response.sendRedirect("find_id_pw.jsp?code="+-1);
		}else if(result==-2){//데이터베이스오류
			response.sendRedirect("find_id_pw.jsp?code="+-2);
		}else{//성공
			vo=dao.findId(name,phone);
			response.sendRedirect("find_id_pw.jsp?id="+vo.getId());
		}
	}else if(name==null || phone ==null){
		int result1 = dao.findIdFormCheck(id);
		if(result1==-1){//아이디 없음
			response.sendRedirect("find_id_pw.jsp?pcode="+-3);
		}else if(result1==-2){//데이터베이스오류
			response.sendRedirect("find_id_pw.jsp?pcode="+-4);
		}else{//0 찾음
			vo=dao.findPass(id);
			response.sendRedirect("find_id_pw.jsp?pass="+vo.getPass());
		}
	}
	
	
	
	
	
%>

