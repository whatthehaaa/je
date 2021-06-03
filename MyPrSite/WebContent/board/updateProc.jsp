<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*, com.myprsite.vo.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	String save_path = request.getServletContext().getRealPath("/upload");

	int max_size = 1024*1024*15;
	
	MultipartRequest multi = new MultipartRequest(request, save_path, max_size, "utf-8", new DefaultFileRenamePolicy());
	
	TableVO vo = new TableVO();
	TableDAO dao = new TableDAO();
	boolean result = false;
	
	vo.setBid(multi.getParameter("bid"));
	vo.setBtitle(multi.getParameter("btitle"));
	vo.setBcontent(multi.getParameter("bcontent"));
	vo.setBfile(multi.getOriginalFileName("bfile"));
	vo.setBsfile(multi.getFilesystemName("bfile"));
	
	if(vo.getBfile() != null){
		System.out.println("새 파일 존재");
		result = dao.update(vo);
	}else{
		System.out.println("새 파일 없음. 기존 파일");
		result = dao.updateNofile(vo);
	}
	
	if(result){
		response.sendRedirect("success.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>
