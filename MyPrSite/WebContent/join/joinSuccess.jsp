<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/myprsite.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<section class="joinSuccess">
			<div>
				<ul>
					<li>
						<div>회원가입 완료 :)</div>
						<img src ="../images/checked.png" ">
					</li>
					<li>
						<a href="http://localhost:9000/MyPrSite/index.jsp"><button type="button" class="btn_style">메인 페이지</button></a>
					</li>
				</ul>
			</div>
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>