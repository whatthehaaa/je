<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String user_id = (String)session.getAttribute("id"); 
	String name = (String)session.getAttribute("name");
	
	if(user_id != null){
%>

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
	<section class="board" id="board_write">
		<form name="board_wirte" action="writeProc.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="user_id" value="<%= user_id %>">
			<input type="hidden" name="name" value="<%= name %>">
			<table border="1">
				<tr>
					<th><input type="text" name="btitle" placeholder="제목"></th>
				</tr>
				<tr>
					<td>
						<textarea name="bcontent" placeholder="내용"></textarea>
					</td>
				</tr>
				<tr>
					<td><input name="bfile" type="file"></td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn_style">작성</button>
						<a href="board_list.jsp"><button type="button" class="btn_style">취소</button></a>
					</td>
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