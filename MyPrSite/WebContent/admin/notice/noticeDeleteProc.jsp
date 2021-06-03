<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.dao.*"%>
  
 
 <%
 	String nid = request.getParameter("nid");
 	NoticeDAO dao = new NoticeDAO();
 	boolean result = dao.getDelete(nid);
 	if(result){
 		response.sendRedirect("notice_list.jsp");
 	}else{
 		response.sendRedirect("../../errorPage.jsp");
 	}
 %>
