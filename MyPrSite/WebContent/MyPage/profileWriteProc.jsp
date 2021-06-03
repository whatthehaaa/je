<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.myprsite.vo.*, com.myprsite.dao.*"%>
<%  request.setCharacterEncoding("utf-8");   %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%-- <jsp:useBean id="vo" class="com.myprsite.vo.ProfileVO"/>
<jsp:setProperty  name="vo" property="*" /> --%>


<% 
	String user_id = (String)session.getAttribute("id");
	ProfileVO vo = new ProfileVO();
	
//1. 파일이 저장되는 경로 설정 : upload폴더 주소
		String save_path = request.getServletContext().getRealPath("/upload");
		//System.out.println("path--->" + save_path);
    //2. 파일 업로드 사이즈 설정//(최대 15메가) 
		int max_size = 1024*1024*15;
    //3. MultipartRequest 객체 생성 -- 생성되는 동시에 파일이 자동업로드(서버에 저장)
    // 객체 생성시 자동으로 upload 폴더에 파일이 업로드 됨
		MultipartRequest multi = new MultipartRequest(request, save_path, max_size, "utf-8",new DefaultFileRenamePolicy());
	 //4. VO 객체 생성
	
	//String univercity,univercity_major;
	//String certificate_name,certificate_date,certificate_agency;
	//String company,department,position; 
	
    //4. VO 객체 생성
    //4-1. 선택된 파일이 있는 경우(새로운 파일 선택)
	 ProfileDAO dao = new ProfileDAO();
	 boolean result = false;
 
	String file_check [] = {"face_file","univercity_file", "certificate_file", "career_file","top1_file","top2_file","top3_file","video_file","video_img_file"};

	
	int check = dao.getProfileCount(user_id);
	if(check ==0){//프로필 등록 아무것도 안 되어있는 상태
   	 vo.setId(multi.getParameter("user_id"));
   	 vo.setFace_file(multi.getOriginalFileName("face_file"));
	 vo.setS_face_file(multi.getFilesystemName("face_file"));
	 
  	 vo.setUnivercity(multi.getParameter("univercity"));
	 vo.setUnivercity_major(multi.getParameter("univercity_major"));
	 vo.setUnivercity_file(multi.getOriginalFileName("univercity_file"));
	 vo.setS_univercity_file(multi.getFilesystemName("univercity_file"));
	 
	 vo.setCertificate_name(multi.getParameter("certificate_name"));
	 vo.setCertificate_date(multi.getParameter("certificate_date"));
	 vo.setCertificate_agency(multi.getParameter("certificate_agency"));
	 vo.setCertificate_file(multi.getOriginalFileName("certificate_file"));
	 vo.setS_certificate_file(multi.getFilesystemName("certificate_file"));
	 
	 vo.setCompany(multi.getParameter("company"));
	 vo.setDepartment(multi.getParameter("department"));
	 vo.setPosition(multi.getParameter("position"));
	 vo.setCareer_file(multi.getOriginalFileName("career_file"));
	 vo.setS_career_file(multi.getFilesystemName("career_file"));
	 
	 vo.setArea_select(multi.getParameter("area_select"));
	 vo.setIntroduce(multi.getParameter("introduce"));
	 vo.setJob_select_input_content(multi.getParameter("job_select_input_content"));
	 vo.setCategory_tech1_input_content(multi.getParameter("category_tech1_input_content"));
	 vo.setAttendance_status(multi.getParameter("attendance_status"));
	 vo.setCareer_year(multi.getParameter("career_year"));
	 vo.setCareer_month(multi.getParameter("career_month"));
	 
	
	 vo.setTop1_file(multi.getOriginalFileName("top1_file"));
	 vo.setS_top1_file(multi.getFilesystemName("top1_file"));
	 
	 vo.setTop2_file(multi.getOriginalFileName("top2_file"));
	 vo.setS_top2_file(multi.getFilesystemName("top2_file"));
	 
	 vo.setTop3_file(multi.getOriginalFileName("top3_file"));
	 vo.setS_top3_file(multi.getFilesystemName("top3_file")); 
	 
	 vo.setTop1_per(multi.getParameter("top1"));
	 vo.setTop2_per(multi.getParameter("top2"));
	 vo.setTop3_per(multi.getParameter("top3"));

	 vo.setVideo_file(multi.getOriginalFileName("video_file"));
	 vo.setS_video_file(multi.getFilesystemName("video_file"));
	 
	 vo.setVideo_img_file(multi.getOriginalFileName("video_img_file"));
	 vo.setS_video_img_file(multi.getFilesystemName("video_img_file"));
	 
	 vo.setVideo_name(multi.getParameter("video_name"));
	 vo.setVideo_content(multi.getParameter("video_content"));
	 
	result = dao.setProfileInsert(vo);
		if(result){ 
			result = dao.setProfileInsert2(vo);
			if(result){
				response.sendRedirect("mypage.jsp");				
			}else{
				response.sendRedirect("../errorPage.jsp");				
			}
		}else{
			response.sendRedirect("../errorPage.jsp");
		} 
	}else{//프로필 등록 되어있는 상태
		 //result = dao.setProfileUpdate(vo);
	
		 vo.setId(multi.getParameter("user_id"));
      	 vo.setUnivercity(multi.getParameter("univercity"));
    	 vo.setUnivercity_major(multi.getParameter("univercity_major"));
    	 
    	 vo.setCertificate_name(multi.getParameter("certificate_name"));
    	 vo.setCertificate_date(multi.getParameter("certificate_date"));
    	 vo.setCertificate_agency(multi.getParameter("certificate_agency"));
    	 
    	 vo.setCompany(multi.getParameter("company"));
    	 vo.setDepartment(multi.getParameter("department"));
    	 vo.setPosition(multi.getParameter("position"));
    	 
    	 vo.setArea_select(multi.getParameter("area_select"));
    	 vo.setIntroduce(multi.getParameter("introduce"));
    	 vo.setJob_select_input_content(multi.getParameter("job_select_input_content"));
    	 vo.setCategory_tech1_input_content(multi.getParameter("category_tech1_input_content"));
    	 vo.setAttendance_status(multi.getParameter("attendance_status"));
    	 vo.setCareer_year(multi.getParameter("career_year"));
    	 vo.setCareer_month(multi.getParameter("career_month"));
    	 
    	 vo.setTop1_per(multi.getParameter("top1"));
    	 vo.setTop2_per(multi.getParameter("top2"));
    	 vo.setTop3_per(multi.getParameter("top3"));
    	 
    	 vo.setVideo_name(multi.getParameter("video_name"));
    	 vo.setVideo_content(multi.getParameter("video_content"));
	
		 for(int i =0; i<file_check.length ;i++){
			 if(multi.getOriginalFileName(file_check[i]) != null){
				 if(file_check[i].equals("face_file")){
					 vo.setFace_file(multi.getOriginalFileName("face_file"));
			    	 vo.setS_face_file(multi.getFilesystemName("face_file"));
			    	 result = dao.getUpdatefile(vo.getFace_file(),vo.getS_face_file(),"face_file","s_face_file",user_id);
				 }else if(file_check[i].equals("univercity_file")){
					 vo.setUnivercity_file(multi.getOriginalFileName("univercity_file"));
			    	 vo.setS_univercity_file(multi.getFilesystemName("univercity_file"));
			    	 result = dao.getUpdatefile(vo.getUnivercity_file(),vo.getS_univercity_file(),"univercity_file","s_univercity_file",user_id);
				 }else if(file_check[i].equals("certificate_file")){
					 vo.setCertificate_file(multi.getOriginalFileName("certificate_file"));
			    	 vo.setS_certificate_file(multi.getFilesystemName("certificate_file"));
			    	 result = dao.getUpdatefile(vo.getCertificate_file(),vo.getS_certificate_file(),"certificate_file","s_certificate_file",user_id);
				 }else if(file_check[i].equals("career_file")){
					 vo.setCareer_file(multi.getOriginalFileName("career_file"));
			    	 vo.setS_career_file(multi.getFilesystemName("career_file"));
			    	 result = dao.getUpdatefile(vo.getCareer_file(),vo.getS_career_file(),"career_file","s_career_file",user_id);
			    	 
				 }else if(file_check[i].equals("top1_file")){
					 vo.setTop1_file(multi.getOriginalFileName("top1_file"));
			    	 vo.setS_top1_file(multi.getFilesystemName("top1_file"));	
			    	 result = dao.getUpdatefile2(vo.getTop1_file(),vo.getS_top1_file(),"top1_file","s_top1_file",user_id);

				 }else if(file_check[i].equals("top2_file")){
					 vo.setTop2_file(multi.getOriginalFileName("top2_file"));
			    	 vo.setS_top2_file(multi.getFilesystemName("top2_file"));	
			    	 result = dao.getUpdatefile2(vo.getTop2_file(),vo.getS_top2_file(),"top2_file","s_top2_file",user_id);

				 }else if(file_check[i].equals("top3_file")){
					 vo.setTop3_file(multi.getOriginalFileName("top3_file"));
			    	 vo.setS_top3_file(multi.getFilesystemName("top3_file"));	
			    	 result = dao.getUpdatefile2(vo.getTop3_file(),vo.getS_top3_file(),"top3_file","s_top3_file",user_id);

				 }else if(file_check[i].equals("video_file")){
					 vo.setVideo_file(multi.getOriginalFileName("video_file"));
			    	 vo.setS_video_file(multi.getFilesystemName("video_file"));
			    	 result = dao.getUpdatefile2(vo.getVideo_file(),vo.getS_video_file(),"video_file","s_video_file",user_id);

				 }else if(file_check[i].equals("video_img_file")){
					 vo.setVideo_img_file(multi.getOriginalFileName("video_img_file"));
			    	 vo.setS_video_img_file(multi.getFilesystemName("video_img_file"));
			    	 result = dao.getUpdatefile2(vo.getVideo_img_file(),vo.getS_video_img_file(),"video_img_file","s_video_img_file",user_id);

				 }
			 }
			
		 }
	
		 result = dao.getUpdateNofile(vo);
		 if(result){ 
				result = dao.getUpdateNofile2(vo);
		 }
	
		if(result){
			response.sendRedirect("mypage.jsp");
		}else{
			response.sendRedirect("../errorPage.jsp");
		} 
		//update
	}
	
	
%>

