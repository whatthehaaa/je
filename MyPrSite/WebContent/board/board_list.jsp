<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*, java.util.*" %>
<%
	String user_id = (String)session.getAttribute("id");
	TableDAO dao = new TableDAO();
	
	ArrayList<TableVO> all = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/myprsite.css">
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/am-pagination.css">
<script src="http://localhost:9000/MyWeb/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyCGV/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		ajax_list("all", "","");
		
		function page1(dbCount, pageSize, reqPage){
			var pager = jQuery("#ampaginationsm").pagination({
				maxSize : 5,
				totals : dbCount,
				pageSize :pageSize,
				page : reqPage,
				
				lastText : '&raquo;&raquo;',
				firstText : '&laquo;&laquo;',
				prevText : '&laquo;',
				nextText : '&raquo;',
				
				btnSize : 'sm'
			});
			
			jQuery("#ampaginationsm").on('am.pagination.change',function(e){
				ajax_list($("#sname").val(), $("#svalue").val(), e.page);
			});
		}
		
		
		$("#sname").change(function(){
			if($("#sname").val() == "all"){
				$("#svalue").val("");
			}
		});
		
		$("#search_btn").click(function(){
			if($("#svalue").val() == "" && $("#sname").val() != "all"){
				alert("검색할 데이터를 입력해 주세요");
				$("#svalue").focus();
				return false;
			}else{
				var sname = $("#sname").val();
				var svalue = $("#svalue").val();
				/* $("#svalue").val(""); */
				
				ajax_list(sname, svalue, "");
			}
		});
		
		function ajax_list(sname, svalue, rpage){
			$.ajax({
				url:"listProc.jsp?sname="+sname+"&svalue="+svalue+"&rpage="+rpage,
				success:function(result){
					var jdata = JSON.parse(result);
					var output = "";
					
					for(var i in jdata.jlist){ 
						output += '<tr class="d">';
						output += '<td>'+ jdata.jlist[i].rno + '</td>';
						output += '<td><a href="board_content.jsp?bid='
								+jdata.jlist[i].bid+'">'+jdata.jlist[i].btitle+'</a></td>';
						output += '<td>'+jdata.jlist[i].name+'</td>';
						output += '<td>'+jdata.jlist[i].bdate+'</td>';
						output += '<td>'+jdata.jlist[i].bhits+'</td>';
						output += '</tr>'
					} 
					output += '<tr class="d"><td colspan="6"> <div id="ampaginationsm"></div> </td>';
					
					$(".d").remove();
					
					$("#list_count").text("").append("게시글 " + jdata.dbCount + "개");
					$("#board_here").after(output);
					
					page1(jdata.dbCount, jdata.pageSize, jdata.reqPage);
				}
			
			});
		}
		
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<section class="board" id="board_list">
		<div>
			<select id="sname">
				<option value="all">전체</option>
				<option value="btitle">제목</option>
				<option value="bcontent">내용</option>
				<option value="user_id">아이디</option>
				<option value="name">작성자</option>
			</select>
			<input type="text" id="svalue" placeholder="검색할 단어를 입력해주세요 :)">
			<button type="button" id="search_btn" class="btn_style">검색</button>
		</div>
		<table border=1>
			<tr id="count">
				<td colspan='2'><span id='list_count'></span></td>
				<td colspan="3">
					<% if(user_id != null){  %>
						<a href="board_write.jsp"><button type="button" id="btn_write" class="btn_style">글쓰기</button></a>
					<% } %>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<tr id="board_here">
			</tr>
		</table>
	</section>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>