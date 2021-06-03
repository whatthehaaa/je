<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO" />
<jsp:setProperty name="user" property="*" />
<% 
	String id = (String)session.getAttribute("id");
	UserDAO dao = new UserDAO();
	String pass = dao.getPass(id);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyPrSite/js/jihye.js"></script>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/myprsite.css">
</head>
<body class="mypage1">
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	
	<section class="mypage1">
		<form name="mypage1_intro" action="mypage1.jsp" method="post" class="mypage1_intro">
			<ul>
				<li>
					<h1>회원정보 수정</h1>
				</li>
				<li>
					<img src="http://localhost:9000/MyPrSite/images/password (1).png">
				</li>
				<li>
					<p>현재 로그인 중인 아이디의 비밀번호를 입력하세요</p>
					<input type="password" id="mypage1_intro_pass" placeholder="비밀번호를 입력해주세요" required/>
					<input type="hidden" id="user_pass" value="<%= pass %>">
				</li> 
				<li>
					<button type="button" class="btn_style" id="mypage1_intro_btn">확인</button>
				</li>
			</ul>
		</form>
	</section>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>