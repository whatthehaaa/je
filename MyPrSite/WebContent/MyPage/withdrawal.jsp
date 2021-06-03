<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String bid = request.getParameter("bid"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/myprsite.css">
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyPrSite/js/jihye.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<section class="board" id="board_delete">
		<table border=1>
			<tr>
				<th>정말 탈퇴 하시겠습니까?</th>
			</tr>
			<tr>
				<td><img src="http://localhost:9000/MyPrSite/images/delete.png" id="delete_img"></td>
			</tr>
			<tr>
				<td>
					<a href="withdrawalProc.jsp"><button type="button" class="btn_style" id="withdrawal">탈퇴</button></a>		
					<a href="mypage1.jsp"><button type="button" class="btn_style">취소</button>	</a>
				</td>
			</tr>
		</table>
	</section>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
	
</body>
</html>