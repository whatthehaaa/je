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
		<section class="success">
			<div>
				<ul>
					<li>
						<div>완료되었습니다 :)</div>
						<img src ="../images/checked.png">
					</li>
					<li>
						<a href="http://localhost:9000/MyPrSite/board/board_list.jsp"><button type="button" class="btn_style">목록으로</button></a>
					</li>
				</ul>
			</div>
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>