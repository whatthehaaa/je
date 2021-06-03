<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*, com.myprsite.vo.*, java.util.*"%>
<%
	CatDAO dao = new CatDAO();
	ArrayList<CatVO> clist = dao.getCat1("영상·사진·음향");
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/myprsite.css">
<script src="http://localhost:9000/MyWeb/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<!-- header -->
  	<jsp:include page="../header.jsp" />
  	
  	<div class="cat_body">
	  	<!-- aside -->
	  	<aside>
	  		<h1>영상·사진·음향</h1>
			<hr>
	  		<nav>
	  			<ul>
	  				<li><a href="">영상촬영·편집</a></li>
	  				<li><a href="">애니메이션</a></li>
	  				<li><a href="">3D·VR</a></li>
	  			</ul>
	  		</nav>
	  	</aside>
	  	
	  	<!-- content -->
	  	<ul class="cat_content">
	  		<% if(clist.size()==0){ %>
	  			<li>
	  				<div class="no">등록된 포트폴리오가 존재하지 않습니다 :(</div>
	  			</li>
	  		<% } %>
	  		<% for(CatVO vo : clist){ %>
	  		<li>
	  			<a href="http://localhost:9000/MyPrSite/prsite.jsp?id=<%= vo.getId() %>"><img src="http://localhost:9000/MyPrSite/upload/<%= vo.getImg() %>" class="pr_img"></a>
	  			<a href="#"><div class="con_name"><%= vo.getId() %></div></a>
	  			<a href="#"><div class="con_title">편집자 입니다:)</div></a>
	  			<!-- <div><img src="http://localhost:9000/MyPrSite/images/star.png" class="star" >4.9</div> -->
	  		</li>
	  		<% } %>
	  	</ul>
  	</div>
  	
	<!-- footer -->
  	<jsp:include page="../footer.jsp" />  	
</body>
</html>