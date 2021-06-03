<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.vo.*,com.myprsite.dao.*,java.util.*"%>
    
    
 <%
	 	NoticeDAO dao = new NoticeDAO();
	
	
	 //1. 선택한 페이지값
	 String rpage = request.getParameter("rpage"); 
	 
	 //2-1. 페이지값에 따라서 star, end count 구하기
	 //1페이지(1~10), 2페이지(11~20) ...
	 int start = 0;
	 int end = 0;
	 int pageSize = 5; // 한 페이지당 출력되는 row
	 int pageCount = 1; // 전체 페이지 수 : 전체 리스트 row / 한 페이지당 출력되는 row
	 int dbCount = dao.getListCount(); // DB연동 후 전체 row 수 출력
	 int reqPage = 1; // 요청 페이지
	 
	 //2-2. 전체페이지 수 구하기
	 if(dbCount % pageSize == 0){
	    pageCount = dbCount / pageSize;
	 } else {
	    pageCount = dbCount / pageSize + 1;
	 }
	 
	 //2-3. start, end 값 구하기
	 if(rpage != null){
	    reqPage = Integer.parseInt(rpage);
	    //start = (요청페이지 - 1) * 한페이지 출력행 + 1;
	    start = (reqPage-1) * pageSize + 1;
	    end = reqPage * pageSize;
	 } else {
	    start = reqPage;
	    end = pageSize;
	 }
	 
		ArrayList<NoticeVO> list = dao.getList(start,end);
 %>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/am-pagination.css">
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>

<script src="http://localhost:9000/MyPrSite/js/am-pagination.js"></script> <!-- 제이쿼리 라이브러리 -->
<script>
   $(document).ready(function(){
      // 페이지 번호 및 링크
      var pager = jQuery("#ampaginationsm").pagination({
         maxSize: 5,
         totals: <%=dbCount%>,
         pageSize: <%=pageSize%>,
         page: <%=reqPage%>,
         
         lastText: '&raquo;&raquo;',
         firstText: '&laquo;&laquo;',
         prevText: '&laquo;',
         nextText: '&raquo;',
         
         btnSize: 'sm'
      });
      
      jQuery("#ampaginationsm").on('am.pagination.change',function(e){
         $(location).attr('href','http://localhost:9000/MyPrSite/admin/notice/notice_list.jsp?rpage=' + e.page); // location.href('이동페이지');
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
				<h1>관리자-공지사항</h1>
				<table class="admin_notice_list">
					<tr>
						<td colspan="4">
							<a href="notice_write.jsp"><button type="button" class="btn_style">글쓰기</button></a>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
					<% for(NoticeVO vo : list){ %>
					<tr>
						<td><%=vo.getRno() %></td>
						<td><a href="notice_content.jsp?nid=<%=vo.getNid() %>"><%=vo.getNtitle() %></a></td>
						<td><%=vo.getNdate() %></td>
						<td><%=vo.getNhits() %></td>
					</tr>
					<% } %>
					<tr>
						<td colspan="4"><div id="ampaginationsm"></div></td>
					</tr>
				
				</table>
			</div>
		
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>