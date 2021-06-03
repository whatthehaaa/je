<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import = "com.myprsite.vo.*,com.myprsite.dao.*"%>
    
<%	
		String user_id2 = (String)session.getAttribute("id");
		ProfileDAO dao = new ProfileDAO();  
		ProfileVO vo = dao.getContent(user_id2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/myprsite.css">

<script src="http://localhost:9000/MyPrSite/jquery-3.5.1.min.js"></script>

<script>
$(document).ready(function(){
	
	
 		$.ajax({
			url:"profileAjaxProc.jsp",
			success:function(result){
				//JSON 형식으로 parsing
				var jdata = JSON.parse(result);
				//2-1. DHTML을 이용하여 테이블 생성 및 출력
				$("#mypage_head").text(jdata.jlist[0].name +"님의 MyPR").css("color","gray").css("margin-bottom","10px");
				if(jdata.jlist[0].s_face_file!=null){
					$('#myhome_profile_photo').css("background-image","url(http://localhost:9000/MyPrSite/upload/"+ jdata.jlist[0].s_face_file) +")";
				}
				$("#mypage_name").text(jdata.jlist[0].name +"님");
				
				if(jdata.jlist[0].introduce!=null){
					$("#mypage_introduce").text(jdata.jlist[0].introduce).css("color","black");
				}
    		}
		});//ajax
 		
	//id null 체크
	
	
	$("#mypage_bar_introduce").click(function (e) {
		
		  e.preventDefault();
		  var scrollPosition =  $("#mypage_content_introduce").offset().top;
		  $("html, body").stop().animate({
		        scrollTop: scrollPosition
		  }, 700);
		  
		});
	$("#mypage_bar_portfolio").click(function (e) {
		
		  e.preventDefault();
		  var scrollPosition =  $("#mypage_content_portfolio").offset().top;
		  $("html, body").stop().animate({
		        scrollTop: scrollPosition
		  }, 700);
		  
		});
	$("#mypage_bar_evaluation").click(function (e) {
		
		  e.preventDefault();
		  var scrollPosition =  $("#mypage_content_evaluation").offset().top;
		  $("html, body").stop().animate({
		        scrollTop: scrollPosition
		  }, 700);
		  
		});
	
	////////마이페이지 부분 /////
});

</script>

</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<div class="content">
	
	
		<h2 id="mypage_head"></h2>
		<section class="section1">
				<div class="m1">
					<aside class="my_aside">
						<div class="info">
							<ul>
								<li>
								
							        <span class="thum" id="myhome_profile_photo"></span>
							   	</li>
								<li>
									<div id="mypage_name">김남욱님</div>
							   	</li>
								
							   	<li>
							   		<div class="prf"><a href="http://localhost:9000/MyPrSite/MyPage/profile.jsp">프로필등록/수정</a></div>
						
							   	</li>
							</ul>
						</div>
					</aside>
					
					
				
				</div> <!-- m1끝나는부분 -->
				
				<div class="m2">
					<div>
						<ul>
							<li>
								<a href="http://localhost:9000/MyPrSite/prsite2.jsp"><span class="pr_1"><br><br><br>포토폴리오</span></a>
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
					<!-- <li id="mypage_bar_introduce"><div>소개</div></li> -->
					<!-- <li id="mypage_bar_portfolio"><div>포토폴리오</div></li> -->
					<!-- <li id="mypage_bar_evaluation"><div>받은평가</div></li> -->
				</ul>
			</div>
			<div class="mypage_content_introduce" id="mypage_content_introduce">
				<div class="bar">소개</div>
				<div><p id ="mypage_introduce" class="mypage_introduce">자기소개가 존재하지 않습니다.</p></div>
			</div>
<!-- 			<div class="mypage_content_portfolio" id="mypage_content_portfolio">
				<div class="bar">포토폴리오</div>
				<div class="p_select">
					<select name="portfolio_select" class="p_select_bar">

						<option value="선택">전체</option>
						<option value="디자인">디자인</option>
						<option value="IT·프로그래밍">IT·프로그래밍</option>
						<option value="영상·사진·음향">영상·사진·음향</option>
						<option value="마케팅">마케팅</option>
						<option value="번역·통역">번역·통역</option>
					</select>
				</div>
			</div> -->
<!-- 			<div class="mypage_content_portfolio_content">
				<span class="bar">포토폴리오가 없습니다.</span>
				<ul>
					<li>
						<img src="http://localhost:9000/MyPrSite/images/no_mark.png">
					</li>
					<li>
						포토폴리오가 없습니다.
					</li>
				</ul>
				
			</div> -->
			<!-- <div class="mypage_content_evaluation" id="mypage_content_evaluation">
				<div class="bar">받은평가</div>
			</div>
			<div class="star">0.0</div> -->
		
		</section>
		
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>