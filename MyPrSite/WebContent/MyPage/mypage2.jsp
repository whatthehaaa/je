<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/myprsite.css">
<script>
	function pr_updateForm_open(){
		var up = document.getElementById("pr_update").getAttribute("id");
		if(up=="pr_update"){
			document.getElementById("main_body").style.overflow ="hidden";
			
		}
	}
</script>
</head>
<body id ="main_body">
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<div class="content">
	<h1>Hi!김남욱님의 MyPage!</h1>
		<section class="section1">
				<div class="m1">
					<aside class="my_aside">
						<div class="info">
							<ul>
								<li>
							        <span class="thum" id="myhome_profile_photo"></span>
							   	</li>
								<li>
									<div>김남욱님</div>
							   	</li>
								<li>
									<div>웹프로그래머</div>
							   	</li>
							   	<li>
							   		<!-- <div class="prf"><a href="http://localhost:9000/MyPrSite/MyPage/profile.jsp">프로필등록/수정</a></div> -->
							   		<input type="checkbox" id="popup" >
							   		<label for="popup" id="pr_update" onclick="pr_updateForm_open()" >등록/수정</label>
							   		<div>   
							   			<div>
							   				<label for="popup">x</label>
							   				<h2>ss</h2>
							   			</div>
							   			<label ></label> 

							   		</div>
							   	</li>
							</ul>
						</div>
					</aside>
				</div> <!-- m1끝나는부분 -->
				<div class="m2">
					<div>
						<ul>
							<li>
								<span class="pr_1"><br><br><br>포토폴리오</span>
							</li>
							<li>
							
								<span class="pr_2"><br><br><br>포토폴리오2</span>
					
							</li>
							<li>
								<span class="pr_3"><br><br><br>포토폴리오3</span>
							</li>
						</ul>
					
					</div>
				</div><!-- m2끝나는부분 -->
		</section><!--section1 끝나는부분 -->
		<section class="section2">
			<div class="mypage_bar">
				<ul>
					<li><div>소개</div></li>
					<li><div>포토폴리오</div></li>
					<li><div>받은평가</div></li>
				</ul>
			</div>
			<div class="mypage_content_introduce">
				<div class="bar">소개</div>
				<div><p> 안녕하세요 김남욱 입니다. 잘 부탁드립니다.</p></div>
			</div>
			<div class="mypage_content_portfolio">
				<div class="bar">포토폴리오</div>
				<div class="p_select">
					<select name="portfolio_select" class="p_select_bar">
						<option value="선택">전체</option>
						<option value="웹">Web</option>
						<option value="안드로이드">Android</option>
						<option value="마케팅">Marketing</option>
					</select>
				</div>
			</div>
			<div class="mypage_content_portfolio_content">
				<!-- <span class="bar">포토폴리오가 없습니다.</span> -->
				<ul>
					<li>
						<img src="http://localhost:9000/MyPrSite/images/no_mark.png">
					</li>
					<li>
						포토폴리오가 없습니다.
					</li>
				</ul>
			</div>
			<div class="mypage_content_evaluation">
				<div class="bar">받은평가</div>
			</div>
			<div class="star">0.0</div>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>