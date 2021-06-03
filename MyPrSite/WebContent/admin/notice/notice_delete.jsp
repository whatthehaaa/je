<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.vo.*,com.myprsite.dao.*"%>
<% 
	String nid = request.getParameter("nid");
	NoticeDAO dao = new NoticeDAO();
	/* CgvNoticeVO vo = dao.getDelete(nid); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script> <!-- 라이브러리가 먼저 있어야함 -->
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
				
					<h1>공지사항-삭제</h1>
					<form class="board_delete">
						<h3>정말로 삭제하시겠습니까?</h3>
						<img src="../../images/delete.png" width="100" height="130">
						<div>
							<a href="noticeDeleteProc.jsp?nid=<%=nid%>"><button type="button" class="btn_style">삭제완료</button></a>
							<a href="notice_content.jsp?nid=<%=nid%>"><button type="button"class="btn_style">이전페이지</button></a>
							<a href="notice_list.jsp"><button type="button"class="btn_style">목록보기</button></a>
						</div>
					</form>
				
			</div>
		
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>