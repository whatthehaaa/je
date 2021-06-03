<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.vo.*,com.myprsite.dao.*"%>
    
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
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">

<style>
	span#fname{
		/* border:1px solid red; */
		display:inline-block;
		width:150px;
		margin-left:-482px;
		font-size:12px;
		background-color:white;
		padding:2px 0 0 2px;
	}
</style>
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script> <!-- 라이브러리가 먼저 있어야함 -->
<script>
	$(document).ready(function(){
		//파일선택 
		$("input[type=file]").on('change',function(){
			if(window.FileReader){
				var fileName = $(this)[0].files[0].name;
				$("#fname").text("").text(fileName);
			}
			
		});
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
				<h1>공지사항</h1>
				<form name="noticeUpdateForm" action="noticeUpdateProc.jsp" method="post" class="admin_notice_update" enctype="multipart/form-data">
					<input type="hidden" name="nid" value="<%= vo.getNid()%>">
					<ul>
						<li>
							<label>제목</label>
							<input type="text" name="ntitle" value="<%= vo.getNtitle() %>">
						</li>
						<li>
							<label>내용</label>
							<textarea rows="10" cols="50" name="ncontent"><%= vo.getNcontent() %></textarea>
								
						</li>
						<li>
							<label>파일첨부</label>
							<% if(vo.getNsfile()!=null){ %>
							<input type="file" name="nfile"><span id="fname"><%=vo.getNfile() %></span>
							<% }else{%>
							<input type="file" name="nfile"><span id="fname">선택된 파일 없음</span>
							<%} %>
						</li>
						<li>
							<button type="submit"class="btn_style">수정완료</button>
							<button type="reset"class="btn_style">취소</button>
							<a href="notice_content.jsp?nid=<%=nid%>"><button type="button" class="btn_style">이전페이지</button></a>
							<a href="notice_list.jsp"><button type="button"class="btn_style">목록보기</button></a>
						</li>
					</ul>
				
				</form>
			</div>
		
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>