<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO" />
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyPrSite/js/jihye.js"></script>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/myprsite.css">
</head>
<body class="join">
	<section class="join1">
		<div class="logo">
			<a href="http://localhost:9000/MyPrSite/index.jsp"><img src="http://localhost:9000/MyPrSite/images/logo.png" class="logo"></a>
		</div>
		<form name="join1" action="joinProc.jsp?chk1=<%= user.getChk1() %>&chk2=<%= user.getChk2() %>&chk3=<%= user.getChk3() %>&chk4=<%= user.getChk4() %>" method="post">
			<ul>
				<li>
					<div><label><span class="red">*</span>아이디</label></div>
					<input type="text" name="id" placeholder="아이디 입력" class="id" id="id">
					<!-- <button type="button" class="con_number" id="btnidCheck">아이디 중복 체크</button><br> -->
					<div id="id_msg"></div>
				</li>
				<li>
					<div><label><span class="red">*</span>비밀번호</label></div>
					<input type="password" name="pass" placeholder="비밀번호 입력" class="pass" id="pass">
					<div id="pass_msg"></div>
				</li>
				<li>
					<div><label><span class="red">*</span>비밀번호 재확인</label></div>
					<input type="password" name="cpass" placeholder="비밀번호 확인" class="cpass" id="cpass">
					<div id="cpass_msg"></div>
				</li>
				<li>
					<div><label><span class="red">*</span>성명</label></div>
					<input type="text" name="name" placeholder="성명 입력" class="name" id="name">
				</li>
				<li>
					<div><label><span class="red">*</span>생년월일</label></div>
					<input type="text" name="year" placeholder="년(4자)" class="year" id="year">
					<select name="month" class="month" id="month">
						<option value="월">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<select name="day" class="day" id="day">
						<option value="일">일</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="18">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select>
				</li>
				<li>
					<div><label>성별<span class="opt1">(선택)</span></label></div>
					<select name="gender" class="gender" id="gender">
						<option value="성별">성별</option>
						<option value="여자">여자</option>
						<option value="남자">남자</option>
						<option value="선택 안함">선택 안함</option>
					</select>
				</li>
				<li>
					<div><label>본인 확인 이메일<span class="opt1">(선택)</span></label></div>
					<input type="text" name="email" placeholder="선택입력" class="email" id="email">
					<div id="email_msg"></div>
				</li>
				<li>
					<div><label><span class="red">*</span>휴대전화</label></div>
					<input type="text" name="hp" placeholder="전화번호 입력" class="hp" id="hp">
					<!-- <button type="button" class="con_number" id="btnhpCheck">번호 중복 체크</button><br> -->
					<div id="hp_msg"></div>
				</li>
				<li>
					<button type="button" class="btn_style" id="register">가입하기</button> 
				</li>
			</ul>
		</form>
	</section>
</body>
</html>