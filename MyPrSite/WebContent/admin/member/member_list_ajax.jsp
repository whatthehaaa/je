<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import = "com.myprsite.dao.*, com.myprsite.vo.*, java.util.*" %>
<%
	
	String user_id = (String)session.getAttribute("id");
	//svo 객체 != null ==>> 로그인 성공!!
	//svo 객체 == null ==>> 로그인 하지 않은 상태
	if(user_id != null){
%>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_wook/admin.css">
<link rel="stylesheet" href = "http://localhost:9000/MyPrSite/css_jh/am-pagination.css">
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyPrSite/js/am-pagination.js"></script>

<script>
	$(document).ready(function(){
		/** 페이지 로딩 시 회원 전체 리스트 출력 **/
		member_list("total","","");		
		
		
		/** Ajax를 활용한 회원전체 리스트 출력 **/
		function member_list(sname,svalue,rpage){
			$.ajax({
				url:"member_list_ajax_proc.jsp?sname="+sname+"&svalue="+svalue+"&rpage="+rpage ,
				success:function(result){
					//alert(result);
					var jdata = JSON.parse(result);
					
					//결과를 출력
					var output = '<table class="admin_member_list">';
					output += '<tr><th>번호</th>';
					output += '<th>아이디</th>';
					output += '<th>성명</th>';
					output += '<th>핸드폰번호</th>';
					output += '<th>성별</th>';
					output += '<th>가입일자</th></tr>';

					for(var i in jdata.jlist){ 
					output += '<tr>';
					output += '<td>'+ jdata.jlist[i].rno + '</td>';
					output += '<td><a href="member_content.jsp?id='
							+jdata.jlist[i].id+'">'+jdata.jlist[i].id+'</a></td>';
					output += '<td>'+jdata.jlist[i].name+'</td>';
					output += '<td>'+jdata.jlist[i].cp+'</td>';
					output += '<td>'+jdata.jlist[i].sex+'</td>';
					output += '<td>'+jdata.jlist[i].mdate+'</td>';
					output += '</tr>'
					} 
					
					output += '<tr><td colspan="6" class="last_td"> <div id="ampaginationsm"></div> </td>';
					output += '</tr></table>';
					
					$("table").remove();
					$(".search").after(output);
					$(".last_td").css("border","1px solid white");
					page(jdata.dbcount, jdata.reqpage, jdata.pagesize);  //페이지 출력
					
				}//success
			});//ajax
		}//member_list
		
		
		/** 검색 버튼 이벤트 처리 **/
		$("#btnSearch").click(function(){
			if($("#sname").val() !="total" && $("#svalue").val() == ""){
				alert("검색할 데이터를 입력해 주세요");
				$("#svalue").focus();
				return false;
			}else{
				var sname = $("#sname").val();
				var svalue = $("#svalue").val();
				
				member_list(sname, svalue,"");
				//member_list($("#sname").val(),$("#svalue").val());
			}
		});
		
		
		/** 페이징 처리 함수 **/
		function page(dbcount, reqpage, pagesize){
			//페이지 번호 및 링크 		
			var pager = jQuery("#ampaginationsm").pagination({
				maxSize : 5,			
				totals:dbcount,
				page : reqpage,
				pageSize : pagesize,
						
				
				lastText : '&raquo;&raquo;',
				firstText : '&laquo;&laquo',
				prevTest : '&laquo;',
				nextTest : '&raquo;',
				
				btnSize : 'sm' 			
			}); 
			
			//
			jQuery("#ampaginationsm").on('am.pagination.change',function(e){
				//$(location).attr('href','http://localhost:9000/MyCGV/admin/member/member_list.jsp?rpage='+e.page);  
				//location.href('이동페이지');				
				member_list($("#sname").val(), $("#svalue").val(),e.page);
			});
		}//page
		
	});//ready

</script>
<style>
	.search { 
		margin-bottom: 10px;
		padding-left:450px;
		}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<aside class="admin_main">
			<nav>
				<ul>
					<li><a href="http://localhost:9000/MyPrSite/admin/member/member_list_ajax.jsp">회원관리</a></li>
					<li><a href="http://localhost:9000/MyPrSite/admin/notice/notice_list.jsp">공지사항 관리</a></li>
				</ul>
			</nav>
		</aside>
		<section class="section1" id="admin_section1">
			<div>
					<h1>회원리스트 </h1>
					<div class="search">
						<select id="sname">
							<option value="total">전체</option>
							<option value="id">아이디</option>
							<option value="name">성명</option>
							<option value="hp">핸드폰번호</option>
						</select>
				
						<input type="text" id="svalue">
						<button type="button" id="btnSearch">검색</button>
						
					</div>				
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>
<% }else{ %>
<script>
	alert("로그인을 진행하셔야 접근이 가능합니다.");
</script>
<% } %>













