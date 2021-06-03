<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   import = "com.myprsite.vo.*,com.myprsite.dao.*"%>
     
     
 <%  request.setCharacterEncoding("utf-8");   %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
	//1. 파일이 저장되는 경로 설정 : upload폴더 주소
		String save_path = request.getServletContext().getRealPath("/upload");
		//System.out.println("path--->" + save_path);
      //2. 파일 업로드 사이즈 설정//(최대 15메가) 
		int max_size = 1024*1024*15;
      //3. MultipartRequest 객체 생성 -- 생성되는 동시에 파일이 자동업로드(서버에 저장)
      // 객체 생성시 자동으로 upload 폴더에 파일이 업로드 됨
		MultipartRequest multi = new MultipartRequest(request, save_path, max_size, "utf-8",new DefaultFileRenamePolicy());
	 //4. VO 객체 생성
	 NoticeVO vo = new NoticeVO();
	 vo.setNid(multi.getParameter("nid"));
	 vo.setNtitle(multi.getParameter("ntitle"));
	 vo.setNcontent(multi.getParameter("ncontent"));
	 vo.setNfile(multi.getOriginalFileName("nfile"));
	 vo.setNsfile(multi.getFilesystemName("nfile"));
	 
	 //System.out.println(vo.getBtitle());
	 //System.out.println(vo.getBcontent());
	 //System.out.println(vo.getBfile());
	 //System.out.println(vo.getBsfile());
	 
	 
	//5 .DB연동
	NoticeDAO dao = new NoticeDAO();
    boolean result = dao.getUpdate(vo);
    
    if(result){
		response.sendRedirect("notice_list.jsp");
	}else{
		response.sendRedirect("../../errorPage.jsp");
	}
%>