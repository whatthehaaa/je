<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.vo.*,com.myprsite.dao.*" %>
    
<% 
	String nid = request.getParameter("nid");
	NoticeDAO dao = new NoticeDAO();
	NoticeVO vo = dao.getContent(nid);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script> <!-- 라이브러리가 먼저 있어야함 -->
	<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">
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
				<h1>공지사항-게시판</h1>
				<table class="admin_notice_content">
					<tr>
						<th>제목</th>
						<td colspan="3"><%= vo.getNtitle() %></td>
					
					</tr>
					<tr>
						<th>등록일</th>
						<td><%= vo.getNdate() %></td>
						<th>조회수</th>
						<td><%= vo.getNhits() %></td>
					</tr>
					<tr>
						<td colspan="6">
							<p>
								<%if(vo.getNsfile()!=null){ %>
									<img src="http://localhost:9000/MyPrSite/upload/<%=vo.getNsfile()%>" width="200" height="200">
								<% }%>
							</p>
								<%= vo.getNcontent().replace("\r\n", "<br>") %><br>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<a href="notice_update.jsp?nid=<%=nid%>"><button type="button" class="btn_style">수정</button></a>
							<a href="notice_delete.jsp?nid=<%=nid%>"><button type="button" class="btn_style">삭제</button></a>
							<a href="notice_list.jsp"><button type="button" class="btn_style">목록으로</button></a>
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