<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<% 
	String uid = (String)session.getAttribute("id");
	UserDAO dao = new UserDAO();
	JoinVO user = dao.getUserList(uid); 
	
	if(uid != null){
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
		<h1>회원정보 수정</h1>
		<form name="mypage1" action="mypage1_UpdateProc.jsp" method="post">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="m_name" value="<%= user.getName() %>" placeholder="이름"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="m_id" id="m_id" value="<%= user.getId() %>" placeholder="아이디" disabled></td>
					<td><input type="hidden" name="id" id="h_id" value="<%= user.getId() %>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pass" id="m_pass" value="<%= user.getPass() %>" placeholder="비밀번호" disabled>
						<button type="button" class="btn_style" id="change_pass">비밀번호 변경</button>
						<div id="m_pass_msg"></div>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" name="cpass" id="m_cpass" placeholder="비밀번호 확인">
						<div id="m_cpass_msg"></div>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" name="year" id="m_year" value="<%= user.getYear() %>" placeholder="년">
						<input type="text" name="month" id="m_month" value="<%= user.getMonth() %>" placeholder="월">
						<input type="text" name="day" id="m_day" value="<%= user.getDay() %>" placeholder="일">
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						<input type="text" name="hp" id="m_hp" value="<%= user.getHp() %>" placeholder="ex)01012345678">
						<div id="m_hp_msg"></div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<% if(user.getEmail() != null){ %>
							<input type="text" name="email" id="m_email" value="<%= user.getEmail() %>" placeholder="ex)hong@naver.com">
						<%} else{ %>
							<input type="text" name="email" id="m_email" value="" placeholder="ex)hong@naver.com">
						<% } %>
						<div id="m_email_msg"></div>
					</td>
				</tr>
				<tr>
					<td>프로모션 정보 수신 동의</td>
					<% if(user.getChk4().equals("on")){ %>
						<td><input type="checkbox" name="chk4" id="m_chk4" checked>수신 동의</td>
					<% }else{ %>
						<td><input type="checkbox" name="chk4" id="m_chk4">수신 동의</td>
					<% } %>
				</tr>
				<tr>
					<td colspan="2">
						<a href="mypage1_intro.jsp"><button type="button" id="btnCancle" class="btn_style">취소</button></a>
						<button type="button" id="btnUpdate" class="btn_style">수정</button>
						<a href="withdrawal.jsp"><button type="button" id="btnWithdrawal" class="btn_style">회원탈퇴</button></a>
				</tr>
			</table>
		</form>
	</section>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>
<% }else {%>
<script>
	alert("로그인을 진행하셔야 접근이 가능합니다.");
	location.href="http://localhost:9000/MyPrSite/index.jsp";
</script>
<% } %>