<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script> <!-- 라이브러리가 먼저 있어야함 -->
<!-- <script src="http://localhost:9000/MyPrSite/js/mycgv.js"></script> -->
<script>
	$(document).ready(function(){
		/***공지사항 글쓰기 폼 체크 ***/
		$("#btnNoticeWrite").click(function(){
			if($("#ntitle").val()==""){
				alert("제목을 입력해주세요");
				$("#ntitle").focus();
				return false;
				
			}else{
				noticeWriteForm.submit();
			}
		});
		
	});
</script>
<title>Insert title here</title>
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
				<form name="noticeWriteForm" action="noticeWriteProc.jsp" method="post" class="admin_notice_write" enctype="multipart/form-data">
					<ul>
						<li>
							<label>제목</label>
							<input type="text" name="ntitle" id="ntitle">
						</li>
						<li>
							<label>내용</label>
							<textarea rows="10" cols="50" name="ncontent"></textarea>
						</li>
						<li>
							<label>파일첨부</label>
							<input type="file" name="nfile">
						</li>
						<li>
							<button type="button" class="btn_style" id ="btnNoticeWrite">등록</button>
							<button type="reset"class="btn_style">취소</button>
							<a href="notice_list.jsp"><button type="button" class="btn_style">목록보기</button></a>
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