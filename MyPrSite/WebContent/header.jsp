<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*, com.myprsite.vo.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jung/myprsite.css">
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jw/myprsite.css">
</head>
<body>              
<%
		String id=null;
		if(session.getAttribute("id") != null){
			id =(String) session.getAttribute("id");
		}
%>
<header>
     <div class="up">
           </div>
           <div class="top">    
      		 <a href="http://localhost:9000/MyPrSite/index.jsp">
  			<img src="http://localhost:9000/MyPrSite/images/logo.png" class="logo"></a> 
           <%if(id == null){%>
            <ul>
			   <li><!--  <input type="search" name="sea" placeholder="검색어를 입력하세요"> --></li>
	 		   <li><a id="btn_open" href="#">로그인</a><div></div></li>
            	<li><a href="http://localhost:9000/MyPrSite/join/join_intro.jsp">회원가입</a><div></div></li>
               <li><a href="http://localhost:9000/MyPrSite/board/board_list.jsp">게시판</a><div></div></li>	
                 <li><a href="http://localhost:9000/MyPrSite/notice/notice_list.jsp">공지사항</a><div></div></li>	
            </ul>
             <%}else{%>
             <ul>
			   <li><!--  <input type="search" name="sea" placeholder="검색어를 입력하세요"> --></li>
	 			<li><a href="http://localhost:9000/MyPrSite/login/logoutAction.jsp">로그아웃</a><div></div></li>
               <li><a href="http://localhost:9000/MyPrSite/MyPage/mypage.jsp">MyPR</a><div></div></li>
               <li><a href="http://localhost:9000/MyPrSite/MyPage/mypage1_intro.jsp">MyPage</a><div></div></li>
               <li><a href="http://localhost:9000/MyPrSite/board/board_list.jsp">게시판</a><div></div></li>	
               <li><a href="http://localhost:9000/MyPrSite/notice/notice_list.jsp">공지사항</a><div></div></li>	
          		<%if(id.equals("admin")){ %>
					<li><a href="http://localhost:9000/MyPrSite/admin/member/member_list_ajax.jsp">Admin</a></li>
				<% } %>		
            </ul>
            <%}%>
         </div>
          <div class="bottom">
           <nav>
          	 <div id = "menu"> 
	            <ul class = "main1">
	               <li><a href="http://localhost:9000/MyPrSite/cat/cat_design.jsp">디자인</a>
	                 <ul class="main2">
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_design.jsp">웹·모바일 디자인</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_design.jsp">제품·패키지</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_design.jsp">일러스트·캐리커쳐</a></li>
					</ul>
					</li>
	               <li><a href="http://localhost:9000/MyPrSite/cat/cat_programming.jsp">IT·프로그래밍</a>
	               <ul class="main2">
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_programming.jsp">웹사이트 개발</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_programming.jsp">모바일 개발</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_programming.jsp">데이터베이스</a></li>
					</ul>
					</li>
	               <li><a href="http://localhost:9000/MyPrSite/cat/cat_media.jsp"> 영상·사진·음향 </a>
	               <ul class="main2">
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_media.jsp">영상촬영·편집</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_media.jsp">애니메이션</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_media.jsp">3D·VR</a></li>
					</ul>
					</li>	               
	               <li><a href="http://localhost:9000/MyPrSite/cat/cat_marketing.jsp"> 마케팅 </a>
	               	<ul class="main2">
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_marketing.jsp">SNS 마케팅</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_marketing.jsp">키워드·배너 광고</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_marketing.jsp">브랜드 마케팅</a></li>
					</ul>
					</li>	
	               <li><a href="http://localhost:9000/MyPrSite/cat/cat_translation.jsp">번역·통역  </a>
	                <ul class="main2">
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_translation.jsp">일반 번역</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_translation.jsp">통역</a></li>
		               <li><a href="http://localhost:9000/MyPrSite/cat/cat_translation.jsp">영상 번역</a></li>
					</ul>
					</li>
			 	</ul>
			   </div> 
            </nav>
        </div>
   </header>
   
   <!-- 로그인 영역  헤더침범 ㅈㅅ-->
   <div class="login_form hidden">
      <div class="login_overlay"></div>
      <div class="login_content">
        <button class="x_btn">x</button>
        <div class="image_form">
          <img src="http://localhost:9000/MyPrSite/images/login_main.svg" />
        </div>
        <form action="http://localhost:9000/MyPrSite/login/loginAction.jsp" method="post" name="input_login_form" class="input_login_form" id="login_Form">
          <ul>
            <li class="h3_login">
              <img src="http://localhost:9000/MyPrSite/images/login_avatar.svg" />
              <h2 class="title">Welcome</h2>
            </li>
            <li class="input_area">
            <div class="idcheck"></div>
              <input
                type="text"
                name="id"
                id="id"
                autocomplete="off"
                required
                oninvalid="this.setCustomValidity('아이디를 입력해주세요')"
                oninput="setCustomValidity('')"
              />
              <label class=lb_id for=id>USER NAME</label>
            </li>
            <li class="input_area">
            <div class="idcheck_result"></div>
              <input
                type="password"
                name="pass"
                id="pass"
                autocomplete="off"
                required
                oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')"
                oninput="setCustomValidity('')"
              />
              <label class="lb_pw" for="pass">PASSWORD</label>
            </li>
            <li class="login_btn">
              <button type="submit" id="btn_login">LOGIN</button>
            </li>
            <li class="ch_login"><input id="idSaveCheck" type="checkbox" /><label>아이디 유지</label></li>
            <li class="find_id">
              <a href="http://localhost:9000/MyPrSite/find_id_pw/find_id_pw.jsp">아이디 • 비밀번호 찾기</a>
            </li>
            <li>
              <div></div>
            </li>
            <li class="login_text">
              <p>사람온의 회원이 되어주신것을 환영합니다</p>
            </li>
            <li class="login_account">
              <a href="http://localhost:9000/MyPrSite/join/join_intro.jsp">사람온 회원가입 하기</a>
            </li>
          </ul>
        </form>
      </div>
    </div>
    <script>
      $(document).ready(function () {
        $("#btn_open").click(function () {
          $(".login_form").removeClass("hidden");
          $("body").addClass("overflo");
        });
        $(".x_btn,.login_overlay").click(function closeForm() {
          $("div.login_form").addClass("hidden");
          $("body").removeClass("overflo");
        });

        $("#btn_login").click(function () {
          if ($("#id").val() == "") {
            $(".lb_id").addClass("warning");
            setTimeout(function () {
              $(".lb_id").removeClass("warning");
            }, 1500);
          } else if ($("#pass").val() == "") {
            $(".lb_pw").addClass("warning");
            setTimeout(function () {
              $(".lb_pw").removeClass("warning");
            }, 1500);
          } else {
        	  input_login_form.sumbit();
          }
        });
        
        
        var userInputId = getCookie("userInputId");
        $("input[name='id']").val(userInputId); 
        if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 
        	$("#idSaveCheck").attr("checked", true);// 아이디 저장하기 체크되어있을 시,
        }											// ID 저장하기를 체크 상태로 두기.
        
        $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
            if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                var userInputId = $("input[name='id']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
            }
        });
        
        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
            if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                var userInputId = $("input[name='id']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }
        });
        
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
         
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
         
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
      });
    </script>
</body>
</html>