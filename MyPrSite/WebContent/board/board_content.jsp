<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.vo.*, com.myprsite.dao.*" %>
<% 
	String user_id = (String)session.getAttribute("id");
	String bid = request.getParameter("bid");
	
	TableDAO dao = new TableDAO();
	TableVO vo = dao.getContent(bid);
	ProfileDAO pdao = new ProfileDAO();
	ProfileVO pvo = pdao.getContent(user_id);
	
	dao.setHits(bid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyPrSite/css_jh/myprsite.css">
<script src="http://localhost:9000/MyPrSite/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyPrSite/js/jihye.js"></script>
<style>
	#rimg {border-radius:50%;}
</style>
<script>
	$(document).ready(function(){
		ajax_list();
		
		/**
	    * 댓글달기
	    */
	   $("#btn_send").click(function(){
		  if($("#r_content").val() == ""){
			  alert("댓글을 입력해주세요");
			  $("#r_content").focus();
			  return false;
		  }else{
			  $.ajax({
				  url:"replyProc_write.jsp?u_id="+$("#u_id").val()+"&bid="+$("#bid").val()+"&rcon="+$("#r_content").val()+"&name="+name+"&psfile=<%= pvo.getS_face_file() %>"+"&pfile=<%= pvo.getFace_file() %>",
				  success:function(result){
					  if(result == 1){
						  alert("댓글이 성공적으로 작성되었습니다 :)");
						  $("#r_content").val("");
						  ajax_list();
					  }
				  },
				  error:function(){
					  alert("실패");
				  }
			  });
		  }
	   });
		
	   $(document).on("click","#rcon_cancel",function(){
		  	ajax_list();
	   });
	
	/* 댓글 수정 버튼 클릭 시 */
	   $(document).on("click","#rcon_update",function(){
		    var rid = $(this).val(); 
			var rcon = $("#rcon_text").val();
			
			$.ajax({
				url:"replyProc_update.jsp?rid="+rid+"&rcon="+rcon,
				success:function(result){
					if(result == 1){
						  alert("댓글이 성공적으로 수정되었습니다 :)");
						  ajax_list();
					  }
				}
			});
	   });
	
	   $(document).on("click","#r_update",function(){
		   $(".r_update").remove();
		   var rcon_id = $(this).val();
		   var text = $("#"+rcon_id).text();
		   $("#"+rcon_id).text("");
		   $("#"+rcon_id).append("<textarea id='rcon_text' placeholder='댓글을 남겨주세요.(200자)'>" + text +"</textarea>");
		   $("#rcon_text").focus();
		   $("#"+rcon_id).append("<button type='button' class='btn_style' id='rcon_cancel' value='"+rcon_id+"'>취소</button>");
		   $("#"+rcon_id).append("<button type='button' class='btn_style' id='rcon_update' value='"+rcon_id+"'>수정</button>");
	  		$(this).remove();
	   });
	   
	   $(document).on("click",".r_delete",function(){
		   $.ajax({
			  url:"replyProc_delete.jsp?rid="+$(this).val(),
			  success:function(result){
				  if(result == 1){
					  alert("삭제되었습니다");
				  }
				  ajax_list();
			  }
		   });
	   });

		
		/* 댓글 리스트 */
		function ajax_list(){
			$.ajax({
				url:"replyProc_list.jsp?bid="+$("#bid").val()+"&psfile=<%= pvo.getS_face_file() %>"+"&pfile=<%= pvo.getFace_file() %>",
				success:function(result){
					var jdata = JSON.parse(result);
					
					var output = "<table border=1 id='reply_table'>";
                   
					for(var i in jdata.jlist){
						output += "<tr>";
						if(jdata.jlist[i].psfile != "null"){
							output += "<td><img src='http://localhost:9000/MyPrSite/upload/" + jdata.jlist[i].psfile + "' id='rimg' style='width:30px; height:30px;'></td>";
						}else{
							output += "<td><img src='http://localhost:9000/MyPrSite/images/circle.png' id='rimg' style='width:30px; height:30px;'></td>";
						}
		                output += "<td>" + jdata.jlist[i].name +"</td>";   
		                output += "<td id='"+ jdata.jlist[i].rid +"'>" + jdata.jlist[i].rcon +"</td>";   
		                if($("#u_id").val() == jdata.jlist[i].uid){
		                	output += "<td>"; 
		                	output += "<button type='button' class='r_update' id='r_update' value='"+ jdata.jlist[i].rid +"'>수정</button>";
		                	output += "<button type='button' class='r_delete' id='r_delete' value='"+ jdata.jlist[i].rid +"'>삭제</button>";
		                	output += "</td>";
		                }else{
		                	output += "<td></td>";
		                }
		                output += "<td>" + jdata.jlist[i].rdate +"</td>"; 
		                
					 	output += "</tr>";
					}
					output+="</table>";
					
					$("#reply_table").remove();
	                $("#here").append(output); 
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
	<section class="board" id="board_content">
		<table border=1 id="con_table">
			<tr><th colspan="3"><%= vo.getBtitle() %></th></tr>
			<tr>
				<td>작성자 : <%= vo.getName() %></td>
				<td>등록일 : <%= vo.getBdate() %></td>
				<td>조회수 : <%= vo.getBhits()+1 %></td>
			</tr>
			<tr>
				<td colspan="3" id="content">
					<% if(vo.getBcontent() != null){ %>
					<%= vo.getBcontent().replace("\r\n", "<br>") %><br>
					<% } %>
					<% if(vo.getBsfile() != null){ %>
						<img src="http://localhost:9000/MyPrSite/upload/<%= vo.getBsfile() %>">
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<% if(vo.getUser_id().equals(user_id)){ %>
						<a href="board_update.jsp?bid=<%= bid %>"><button type="button" class="btn_style">수정</button></a>
					<% } %>
					<a href="board_list.jsp"><button type="button" class="btn_style">목록</button></a>
					<% if(vo.getUser_id().equals(user_id)){ %>
						<a href="board_delete.jsp?bid=<%= bid %>"><button type="button" class="btn_style">삭제</button></a>
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="3" id="last">
					<input type="hidden" id="u_id" value="<%= user_id %>">
					<input type="hidden" id="bid" value="<%= bid %>">
					<br>
					<% if(pvo.getS_face_file() != null){ %>
						<img src="http://localhost:9000/MyPrSite/upload/<%= pvo.getS_face_file() %>" id="user_img">						
					<% }else{ %>
						<img src="http://localhost:9000/MyPrSite/images/circle.png" id="user_img">
					<% } %>
					<% if(user_id != null){ %>		
					<textarea id="r_content" placeholder="댓글을 남겨주세요.(200자)"></textarea>
					<% }else{ %>
					<textarea id="r_content" placeholder="로그인 이후에 작성할 수 있습니다 :)"></textarea>
					<% } %>
					<% if(user_id != null){ %>
					<button type="button" id="btn_send" class="btn_style">작성</button>
					<% } %>
					<br>
					<div id="here"></div>
				</td>
			</tr>
		</table>
	</section>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
	
</body>
</html>