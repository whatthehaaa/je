<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import="com.myprsite.vo.*,com.myprsite.dao.*"%>
<%
	String nid = request.getParameter("nid");
	NoticeDAO dao = new NoticeDAO();
	NoticeVO vo  = dao.getContent(nid);
	dao.getUpdateHits(nid);
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<section class="section1"> 
			<div>
				<h1 class="notice_content_h1">공지사항</h1>
				<table class="notice_content">
					<tr>
						<th>제목</th>
						<td colspan="3"><%=vo.getNtitle() %></td>
					</tr>
					<tr>
						
						<th>등록일</th>
						<td><%=vo.getNdate() %></td>
						<th>조회수</th>
						<td><%=vo.getNhits() %></td>
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
							<a href="notice_list.jsp"><button type="button" class ="btn_style" id="btn_Golist">목록으로</button></a>
						</td>
					
					</tr>
					
				</table>
				
			</div>
		
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>