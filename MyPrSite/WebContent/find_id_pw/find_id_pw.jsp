<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.myprsite.vo.JoinVO"/>
<jsp:setProperty name="user" property="*"/>
<%
	JoinVO vo = new JoinVO();
	String id = request.getParameter("id");	
	String code = request.getParameter("code");
	String pcode = request.getParameter("pcode");
	String pass = request.getParameter("pass");
	if(code==null){
		code ="0";
	}else{
	}
	if(pcode==null){
		pcode ="0";
	}else{
	}
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jw/myprsite.css">
<script src="https://kit.fontawesome.com/5dfc498e79.js" crossorigin="anonymous"></script>
</head>
<body class="find-id-pw-body">
    <header class="idpw_header">
      <div class="idpw_top">
        <a href="http://localhost:9000/MyPrSite/index.jsp">
          <img src="http://localhost:9000/MyPrSite/images/logo.png" class="logo"
        /></a>
      </div>
    </header>
    <div class="idpw_container">
      <div class="idpw_content">
        <h2>아이디 / 비밀번호 찾기</h2>
        <div class="idpw">
          <div class="id-content">
            <div class="idpw_head">아이디 찾기</div>
            <div class="idpw_body a">
              <form name="findId_form" action="http://localhost:9000/MyPrSite/find_id_pw/find_id_pwAction.jsp" method="post">
              	<%if(id==null){%>
              		<% if(code.equals("0")){%>
              			<input type="text" name="name" id="name" placeholder="이름" autocomplete="off" required  oninvalid="this.setCustomValidity('이름을 입력해주세요')"
               			 oninput="setCustomValidity('')"/>
              			<input type="number" name="phone" id="phone" placeholder="전화번호" autocomplete="off" required  oninvalid="this.setCustomValidity('전화번호를 입력해주세요')"
               			 oninput="setCustomValidity('')"/>
              			<small class="">회원가입시 입력했던 이름과 전화번호를 입력해주시면 아이디를 알려드립니다.</small>
                		<button id="btn_id" type="submit">아이디 찾기</button>
              		<% }else if(code.equals("1")){%>
	              			<div class="icon-form">
	                  		<i class="fas fa-exclamation-triangle"></i>
	                  		<p class="warningmsg">이름이 존재하지 않습니다</p>
	                		</div>
	                		<input type="text" name="name" id="name" placeholder="이름" autocomplete="off" required />
	              			<div class="icon-form">
	                		</div>
	              			<input type="number" name="phone" id="phone" placeholder="전화번호" autocomplete="off" required/>
	              			<small class="">회원가입시 입력했던 이름과 전화번호를 입력해주시면 아이디를 알려드립니다.</small>
	                		<button id="btn_id" type="submit">아이디 찾기</button>
              		<% }else if(code.equals("2")){%>
	                		<input type="text" name="name" id="name" placeholder="이름" autocomplete="off" required />
	              			<div class="icon-form">
	                  		<i class="fas fa-exclamation-triangle"></i>
	                  		<p class="warningmsg">전화번호가 존재하지 않습니다</p>
	                		</div>
	              			<input type="number" name="phone" id="phone" placeholder="전화번호" autocomplete="off" required />
	              			<small class="">회원가입시 입력했던 이름과 전화번호를 입력해주시면 아이디를 알려드립니다.</small>
	                		<button id="btn_id" type="submit">아이디 찾기</button>
              		<% }else if(code.equals("-1")){%>
              		<div class="icon-form">
	                  		<i class="fas fa-exclamation-triangle"></i>
	                  		<p class="warningmsg">이름이 존재하지 않습니다</p>
	                		</div>
	                		<input type="text" name="name" id="name" placeholder="이름" autocomplete="off" required />
	              			<div class="icon-form">
	                  		<i class="fas fa-exclamation-triangle"></i>
	                  		<p class="warningmsg">전화번호가 존재하지 않습니다</p>
	                		</div>
	              			<input type="number" name="phone" id="phone" placeholder="전화번호" autocomplete="off" required />
	              			<small class="">회원가입시 입력했던 이름과 전화번호를 입력해주시면 아이디를 알려드립니다.</small>
	                		<button id="btn_id" type="submit">아이디 찾기</button>
              		<% }%>
              	<% }else{%>
              	<div>아이디는  <%=id%> 입니다</div>
              	<% }%>
              </form>
            </div>
          </div>
          <div class="pw-content">
            <div class="idpw_head">비밀번호 찾기</div>
            <div class="idpw_body b">
              <form name="findPass_form" action="http://localhost:9000/MyPrSite/find_id_pw/find_id_pwAction.jsp" method="post">
          		<%if(pass==null){ %>
          			<% if(pcode.equals("0")){%>
		                <input type="text" name="id" id="id" placeholder="아이디" autocomplete="off" required  oninvalid="this.setCustomValidity('아이디를 입력해주세요')"
                		oninput="setCustomValidity('')"/>
		                <small>회원가입시 입력했던 아이디 입력시 비밀번호를 알려드립니다.</small>
		                <button id="btn_pass" type="submit">비밀번호 찾기</button>
              		<% }else if(pcode.equals("-3")){%>
		                <div class="icon-form">
		                  <i class="fas fa-exclamation-triangle"></i>
		                  <p class="warningmsg">아이디가 존재하지 않습니다</p>
		                </div>
              			<input type="text" name="id" id="id" placeholder="아이디" autocomplete="off" required />
		                <small>회원가입시 입력했던 아이디 입력시 비밀번호를 알려드립니다.</small>
		                <button id="btn_pass" type="submit">비밀번호 찾기</button>
              		<% }%>
                <%}else{%>
          			<div>비밀번호는  <%=pass%> 입니다</div>
          		<%} %>
              </form>
            </div>
          </div>
        <div class="idpw_btn">
          <a href="http://localhost:9000/MyPrSite/index.jsp">로그인</a>
          <a href="http://localhost:9000/MyPrSite/join/join_intro.jsp">회원가입</a>
        </div>
        <div class="idpw_copyright">
          <h6 class="text-copy">Copyright © 2020 SaramOn Inc. All rights reserved.</h6>
        </div>
        </div>
      </div>
    </div>
  </body>
</html>