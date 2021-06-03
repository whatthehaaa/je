<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	//1. 파일이 저장되는 경로 설정 : upload폴더 주소
	String save_path = request.getServletContext().getRealPath("/upload");
	
	//2. 파일 업로드 사이즈 설정
	int max_size = 1024*1024*15;	
	
	//3. MultipartRequest 객체 생성 -- 생성되는 동시에 파일이 자동 업로드(서버에 저장)
	MultipartRequest multi = new MultipartRequest(request, save_path, max_size, "utf-8", new DefaultFileRenamePolicy());	
	String bcontent = multi.getParameter("bcontent");
	if(bcontent.equals("")){
		bcontent = " ";
	}
	
	//4. 저장된 파일명 가져오기
	TableVO vo = new TableVO();
	vo.setUser_id(multi.getParameter("user_id"));
	vo.setName(multi.getParameter("name"));
	vo.setBtitle(multi.getParameter("btitle"));
	vo.setBcontent(bcontent);
	vo.setBfile(multi.getOriginalFileName("bfile"));
	vo.setBsfile(multi.getFilesystemName("bfile"));

	TableDAO dao = new TableDAO();
	boolean result = dao.setContent(vo);
	
	if(result){
		response.sendRedirect("success.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	} 
%>