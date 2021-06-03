<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.vo.*,com.myprsite.dao.*"
    %>
<%	
		String user_id = (String)session.getAttribute("id");
	 	ProfileDAO dao = new ProfileDAO();
	 	ProfileVO vo = dao.getContent(user_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/myprsite.css">
</head>
	<script src="http://localhost:9000/MyPrSite/jquery-3.5.1.min.js"></script>
	<script src="http://localhost:9000/MyPrSite/js/wook.js"></script>

<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<div class="content">
	<h1>프로필 등록/수정</h1>
	<form name="profileWriteForm" action="profileWriteProc.jsp" method="post" class="profileWriteForm" enctype="multipart/form-data">
		<input type="hidden" name="user_id" id="user_id" value="<%= user_id %>"> 
		<section class="section1">
			<div class ="pf_area1">
				<aside class="my_aside_profile">
					<span class="thum" id="myhome_profile_photo"></span>
					<label for="file"><span class="thum_insert" id="myhome_profile_photo_insert"></span></label>
					<input type="file" id="file" accept=".jpg, .png, .jpeg, .jfif" name="face_file">
					<!-- <div class="pf_update_name"><label class="name_header">이름 : </label><label class="name_content">김남욱</label></div> -->
					<div class="pf_update_name">  
					
						<ul>
						
							<li>이름</li>
							<li id="profile_name"></li>
							<li><label>지역</label>
							<select name="area_select" class="area_select"  id="area_select">
							<option value="선택">선택</option>
							<option value="서울">서울</option>
							<option value="경기북부">경기북부</option>
							<option value="경기남부">경기남부</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="인천">인천</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="강원도">강원도</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="전북">전북</option>
							<option value="전남">전남</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
							<option value="제주">제주</option>
							<option value="해외">해외</option>
							</select>
							</li>
							
						</ul>
					</div>
					<!-- <div class="pf_update_job"><label><input type="text" value="웹프로그래머"></label></div> -->
				</aside>
				<div class ="pf_text">
					<span>자기소개</span>
					<textarea rows="5" cols="10" name="introduce" id="introduce"placeholder="자기소개"></textarea>
					<span class="counter" >(0 /최대 255자)</span>
				</div>
			</div>
		</section>
		<section class="section2">
			<div class = "content_name">전문분야</div> 
			<div class ="pf_area2">
				<div class="pf_job">
				<input type="hidden" name="job_select_input_content" id="job_select_input_content" style="width:600px">
							<select name="job_select" class="job_select">
							<option value="전문분야">전문분야</option>
							<option value="디자인">디자인</option>
							<option value="IT·프로그래밍">IT·프로그래밍</option>
							<option value="영상·사진·음향">영상·사진·음향</option>
							<option value="마케팅">마케팅</option>
							<option value="번역·통역">번역·통역</option>
							</select>
							<select name="job_select_2" class="job_select_2" disabled>
							<option value="상세분야">상세분야</option>
							<option value="웹·모바일 디자인">웹·모바일 디자인</option>
							<option value="제품·패키지">제품·패키지</option>
							<option value="일러스트·캐리커처">일러스트·캐리커처</option>
							</select>
				</div>
				<div class="pf_job_select"><div class="pf_job_select_area"><ul></ul></div></div>
				<span id="job_count_area" class="job_count_area">(0 /최대 5개)</span>
			</div>
		
		</section>
		<section class="section3">
			<div class = "content_name">보유기술</div> 
			<input type="hidden" name="category_tech1_input_content" id="category_tech1_input_content" style="width:600px">
			<div class ="pf_area3">
						<div class="category-tech1">
				          <div class="category-tech1-select"  id="tech1-design" >디자인</div>
                          <div class="category-tech1-select"  id="tech1-it">IT·프로그래밍</div>
                          <div class="category-tech1-select"  id="tech1-viedo">영상·사진·음향</div>
                          <div class="category-tech1-select"  id="tech1-marketing">마케팅</div>
                          <div class="category-tech1-select"  id="tech1-tranlation">번역·통역</div>                    
						</div>
						<div class="category-tech2">
						</div>
						<div class="category-tech-select">
						</div>
						<span id="tech_count_area" class="tech_count_area">(0 /최대 6개)</span>
			</div>
		</section>
		<section class="section4">
		<div class = "content_name">학력·전공</div> 
			<div class ="pf_area4">
					<div class="university_major_area"><h4>학력 전공을 작성해주세요</h4></div>	
					<div class="university_major_area_input">
						<input type="text" class="univercity_input" id = "univercity_input" placeholder="학교명(ex 사람온대학교)" name="univercity">
						<input type="text" class="univercity_major_input"  id = "univercity_major_input" placeholder="전공(ex 컴퓨터공학과)"name="univercity_major">
						<select name="attendance_status" class="attendance_status" id="attendance_status">
							<option value="" selected disabled hidden>상태</option>
							<option value="재학">재학</option>
							<option value="휴학">휴학</option>
							<option value="이수">이수</option>
							<option value="졸업">졸업</option>
						</select>
					</div>
					<h4 class="h4_certificate">증빙 자료를 첨부해주세요  <span>선택</span> </h4>
					<div class="university_certificate">
						<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+증빙 자료 첨부</span></label>
						<input type="file" id="univercity_file" accept=".jpg, .png" name="univercity_file">
						<span id="file_name"></span>
						<div>
							<p>
							&nbsp&nbsp&nbsp&nbsp<span>TIP</span><br> 
								
								&nbsp&nbsp&nbsp&nbsp	• 첨부 가능 자료: 재학증명서, 졸업증명서 또는 성적증명서<br>
								&nbsp&nbsp&nbsp&nbsp	• 1mb이하, jpg/png 파일만 등록 가능합니다.<br>
								&nbsp&nbsp&nbsp&nbsp	• 제출한 자료는 의뢰인에게 노출되지 않습니다.<br>
							</p>
						</div>
					</div>
					
			</div>
		
		</section>
		<section class="section5">
		<div class = "content_name">자격증</div> 
			<div class ="pf_area5">
					<div class="h4_certificate_area"><h4>보유한 자격증을 작성해주세요</h4></div>	
					<div class="certificate_area">
						<input type="text" class="certificate_area_input1" placeholder="자격증명" name="certificate_name" id="certificate_name">
						<input type="text" class="certificate_area_input2" placeholder="발급일" name="certificate_date"id="certificate_date">
						<input type="text" class="certificate_area_input3" placeholder="발급기관" name="certificate_agency"id="certificate_agency">
						
					</div>
					<h4 class="h4_certificate_area_input">증빙 자료를 첨부해주세요  <span>선택</span> </h4>
					<div class="certificate_area_input">
						<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+증빙 자료 첨부</span></label>
						<input type="file" id="certificate_file" accept=".jpg, .png" name="certificate_file">
						<span id="certificate_file_name"></span>
						<div>
							<p>
							&nbsp&nbsp&nbsp&nbsp<span>TIP</span><br> 
								
								&nbsp&nbsp&nbsp&nbsp	• 첨부 가능 자료: 자격증 사본<br>
								&nbsp&nbsp&nbsp&nbsp	• 1mb이하, jpg/png 파일만 등록 가능합니다.<br>
								&nbsp&nbsp&nbsp&nbsp	• 제출한 자료는 의뢰인에게 노출되지 않습니다.<br>
							</p>
						</div>
					</div>
					
			</div>
		
		</section>
		
		<section class="section6">
		<div class = "content_name">경력 사항</div> 
			<div class ="pf_area6">
					<div class="h4_career_area"><h4>경력사항을 작성해주세요</h4></div>	
					<div class="career_area">
						<input type="text" class="career_area_input1" placeholder="회사명" name="company" id="company">
						<input type="text" class="career_area_input2" placeholder="근무부서" name="department"id="department">
						<input type="text" class="career_area_input3" placeholder="직위" name="position"id="position">
						<select name="career_year" class="career_year" id="career_year" >
							<option value="" selected disabled hidden>년</option>
							<option value="1년">1년</option>
							<option value="2년">2년</option>
							<option value="3년">3년</option>
							<option value="4년">4년</option>
							<option value="5년">5년</option>
							<option value="6년">3년</option>
							<option value="7년">7년</option>
							<option value="8년">8년</option>
							<option value="9년">9년</option>
							<option value="10년">10년</option>
							<option value="11년이상">11년이상</option>
							
						</select>
						<select name="career_month" class="career_month" id="career_month">
							<option value="" selected disabled hidden>개월</option>
							<option value="1개월">1개월</option>
							<option value="2개월">2개월</option>
							<option value="3개월">3개월</option>
							<option value="4개월">4개월</option>
							<option value="5개월">5개월</option>
							<option value="6개월">6개월</option>
							<option value="7개월">7개월</option>
							<option value="8개월">8개월</option>
							<option value="9개월">9개월</option>
							<option value="10개월">10개월</option>
							<option value="11개월">11개월</option>
							
							
						</select>
	
					</div>
		
					<h4 class="h4_certificate_area_input">증빙 자료를 첨부해주세요  <span>선택</span> </h4>
					<div class="certificate_area_input">
						<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+증빙 자료 첨부</span></label>
						<input type="file" id="career_file" accept=".jpg, .png" name="career_file">
						<span id="certificate_career_file_name"></span>
						<div>
							<p>
							&nbsp&nbsp&nbsp&nbsp<span>TIP</span><br> 
								
								&nbsp&nbsp&nbsp&nbsp	• 첨부 가능 자료: 국민연금 가입증명서, 재직/경력증명서<br>
								&nbsp&nbsp&nbsp&nbsp	• 1mb이하, jpg/png 파일만 등록 가능합니다.<br>
								&nbsp&nbsp&nbsp&nbsp	• 제출한 자료는 의뢰인에게 노출되지 않습니다.<br>
							</p>
						</div>
					</div>
					
			
			</div>
			</section>
		<section class="section7">
		<div class = "content_name">포토폴리오 페이지 등록내용</div> 
			<div class ="pf_area7">
			
					<h4 class="h4_tech_3_input">기술 이미지 3가지를 첨부해주세요  <span>필수</span> </h4>
					<div class="tech3_area_input">
						<div>
							<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+자료 첨부</span></label>
							<input type="file" id="top1_file" accept=".jpg, .png" name="top1_file">
							<span id="top1_file_name"></span>
						</div>
						<div>
						<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+자료 첨부</span></label>
						<input type="file" id="top2_file" accept=".jpg, .png" name="top2_file">
						<span id="top2_file_name"></span>
						</div>
						<div>
						<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+자료 첨부</span></label>
						<input type="file" id="top3_file" accept=".jpg, .png" name="top3_file">
						<span id="top3_file_name"></span>
						</div>
					<div class="h4_tech3_area"><h4>자신이 잘하는 기술 3가지의 이해도를 입력해 주세요(숫자)</h4></div>	
					<div class="tech3_area">
						<input type="text" class="tech_area_input1" placeholder="이해도(숫자)" name="top1"id="top1">
						<input type="text" class="tech_area_input2" placeholder="이해도(숫자)" name="top2"id="top2">
						<input type="text" class="tech_area_input3" placeholder="이해도(숫자)" name="top3"id="top3">
					</div>
						
						<div class = "pcontent">
							<p>
							&nbsp&nbsp&nbsp&nbsp<span>TIP</span><br> 
								
								&nbsp&nbsp&nbsp&nbsp	• 첨부 가능 자료: 전문기술 아이콘 파일 ex)CSS, JS, HTML<br>
								&nbsp&nbsp&nbsp&nbsp	• 1mb이하, jpg/png 파일만 등록 가능합니다.<br>
								&nbsp&nbsp&nbsp&nbsp	• 제출한 자료는 의뢰인에게 노출되지 않습니다.<br>
							</p>
						</div>
						
						<h4 class="h4_tech_3_input">홍보 동영상을 첨부해주세요  <span>필수</span> </h4>
						<input type="text" class="video_name_input1" placeholder="동영상 제목" name="video_name" id="video_name">
						<input type="text" class="video_content_input2" placeholder="동영상 설명(간단히)" name="video_content"id="video_content">
						<div>
							<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+자료 첨부(동영상)</span></label>
							<input type="file" id="video_file" accept="video/mp4,video/mkv, video/x-m4v,video/*" name="video_file">
							<span id="video_file_name"></span>
						</div>
						<div>
							<label  id="file_label"><span class="thum_insert" id="myhome_profile_photo_insert">+자료 첨부(썸네일 사진)</span></label>
							<input type="file" id="video_img_file" accept=".jpg, .png" name="video_img_file">
							<span id="video_img_file_name"></span>
						</div>
							<div class = "pcontent">
							<p>
							&nbsp&nbsp&nbsp&nbsp<span>TIP</span><br> 
								
								&nbsp&nbsp&nbsp&nbsp	• 첨부 가능 자료: 동영상 파일 ex)video/mp4,video/mkv, video/x-m4v,video<br>
								&nbsp&nbsp&nbsp&nbsp	• 첨부 가능 자료: 썸네일 파일(1mb이하, jpg/png 파일만 등록 가능합니다) ex)jpg/png <br>
								&nbsp&nbsp&nbsp&nbsp	• 제출한 자료는 의뢰인에게 노출되지 않습니다.<br>
							</p>
						</div>
					</div>
					
			
	
			</div>
			
			
			
			<div class="save_area">
				<button type="button" class="save" id="save">프로필 저장</button>
<!-- 				<a href="profileWriteProc.jsp"><button type="button" class="save" id="save">프로필 저장</button></a> -->
			</div>
		</section>
		</form>	
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>
