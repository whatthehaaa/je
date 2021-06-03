<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.myprsite.dao.*,com.myprsite.vo.*"%>
    
    
 <%
 	String id = request.getParameter("id");
 	AdminDAO dao =new AdminDAO();
 	MemberVO vo = dao.getContent(id);
 	ProfileDAO pdao = new ProfileDAO();
 	ProfileVO pvo = pdao.getContent(id);
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">

<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>
<script>

$(document).ready(function(){
	
	
 		$.ajax({
 			//url:"member_list_ajax_proc.jsp?sname="+sname+"&svalue="+svalue+"&rpage="+rpage ,
 					
			url:"member_contentAjaxProc.jsp?id=<%=id%>" ,
			success:function(result){
				//JSON 형식으로 parsing
				var jdata = JSON.parse(result);
				//2-1. DHTML을 이용하여 테이블 생성 및 출력
				if(jdata.jlist[0].s_univercity_file!=null){
					$('#univercity_file_down').append('<a href="http://localhost:9000/MyPrSite/upload/'
							+jdata.jlist[0].s_univercity_file+'"download>'+jdata.jlist[0].s_univercity_file+'</a>');
					
					
				}else{
					$('#univercity_file_down').append("x")
				}
				if(jdata.jlist[0].s_certificate_file!=null){
					$('#certificate_file_down').append('<a href="http://localhost:9000/MyPrSite/upload/'
							+jdata.jlist[0].s_certificate_file+'"download>'+jdata.jlist[0].s_certificate_file+'</a>');
					
					
				}else{
					$('#certificate_file_down').append("x")
				}
				if(jdata.jlist[0].s_career_file!=null){
					$('#career_file_down').append('<a href="http://localhost:9000/MyPrSite/upload/'
							+jdata.jlist[0].s_career_file+'"download>'+jdata.jlist[0].s_career_file+'</a>');
					
					
				}else{
					$('#career_file_down').append("x")
				}
			
    		}
		});//ajax
 		

});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<aside class="admin_main">
			<nav>
				<ul>
					 <li><a href="http://localhost:9000/MyPrSite/admin/member/member_list_ajax.jsp">회원관리</a></li>
					<li><a href="http://localhost:9000/MyPrSite/admin/notice/notice_list.jsp">공지사항 관리</a></li>
				</ul>
			
			</nav>
		
		</aside>
		<section class="section1" id="admin_section1"> 
			<div>
				<h1>회원정보</h1>
				<table class="admin_member_content">
					<tr>
						<th>아이디</th>
						<%if(vo.getId()!=null){ %>
						<td><%= vo.getId() %></td>
						<% } %>
						<th>성명</th>
						<td><%= vo.getName() %></td>
						<th>사진</th>
						<td>
						<%if(pvo.getS_face_file()!=null){ %>
							<img src="http://localhost:9000/MyPrSite/upload/<%= pvo.getS_face_file() %>" width="200" height="100" class="member_face">
						<% }else{ %>
							 x
						
						<% } %>
						</td>
					</tr>
					<tr>
						<th>지역</th>
						<%if(pvo.getArea_select()!=null){ %>
							<td colspan="3"><%= pvo.getArea_select() %></td>
						<% }else{ %>
							<td colspan="3">x</td>
						
						<% } %>
						<th>성별</th>
						<td><%= vo.getGender() %></td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td colspan="5"><%= vo.getHp() %></td>

					</tr>
					<tr>
						<th>자기소개</th>
						<%if(pvo.getIntroduce()!=null){ %>
							<td colspan="5"><%= pvo.getIntroduce() %></td>
						<% }else{ %>
							<td colspan="5">x</td>
						
						<% } %>
						

					</tr>
					<tr>
						<th>전문분야</th>
						<%if(pvo.getJob_select_input_content()!=null){ %>
							<td colspan="5"><%= pvo.getJob_select_input_content() %></td>
						<% }else{ %>
							<td colspan="5">x</td>
						
						<% } %>
					

					</tr>
					<tr>
						<th>보유기술</th>
						<%if(pvo.getCategory_tech1_input_content()!=null){ %>
							<td colspan="5"><%= pvo.getCategory_tech1_input_content() %></td>
						<% }else{ %>
							<td colspan="5">x</td>
						
						<% } %>

					</tr>
					<tr>
						<th>대학</th>
						<%if(pvo.getUnivercity()!=null){ %>
							<td colspan=""><%= pvo.getUnivercity() %></td>
						<% }else{ %>
							<td colspan="">x</td>
						<% } %>
						<th>전공</th>
						<%if(pvo.getUnivercity_major()!=null){ %>
							<td colspan=""><%= pvo.getUnivercity_major() %></td>
						<% }else{ %>
							<td colspan="">x</td>
						<% } %>
						<th>증명서</th>
						<td colspan="" id="univercity_file_down"></td>
						

					</tr>
					<tr>
						<th>자격증</th>
						<%if(pvo.getCertificate_name()!=null){ %>
							<td colspan=""><%= pvo.getCertificate_name() %></td>
						<% }else{ %>
							<td colspan="">x</td>
						<% } %>
						<th>발급기관</th>
						<%if(pvo.getCertificate_agency()!=null){ %>
							<td colspan=""><%= pvo.getCertificate_agency() %></td>
						<% }else{ %>
							<td colspan="">x</td>
						<% } %>
						<th>증명서</th>
					
						<td colspan="" id="certificate_file_down"></td>
						
								

					</tr>
					<tr>
						<th>경력회사</th>
						<%if(pvo.getCompany()!=null){ %>
							<td colspan=""><%= pvo.getCompany() %></td>
						<% }else{ %>
							<td colspan="">x</td>
						<% } %>
						<th>경력기간</th>
						<%if(pvo.getCareer_year()!=null && pvo.getCareer_month()!=null){ %>
							<td colspan=""><%= pvo.getCareer_year() %>/<%= pvo.getCareer_month() %></td>
							
						<% }else if(pvo.getCareer_year()!=null){ %>
							<td colspan=""><%= pvo.getCareer_year() %></td>
						<% }else if(pvo.getCareer_month()!=null){ %>
							<td colspan=""><%= pvo.getCareer_month() %></td>
						<% }else{ %>
							<td colspan="">x</td>
						<% } %>
						<th>증명서</th>
						<td colspan="" id="career_file_down"></td>
						
								

					</tr>
					<tr>
						<td colspan="6">
							<a href="member_list_ajax.jsp"><button type="button" class="btn_style">목록으로</button></a>
						</td>
					
					</tr>
					
				</table>
				
			</div>
		
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>