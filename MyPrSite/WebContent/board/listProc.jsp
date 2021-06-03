<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.myprsite.dao.*, com.myprsite.vo.*, java.util.*, com.google.gson.*" %>
<%
   String sname = request.getParameter("sname");
   String svalue = request.getParameter("svalue");
   String rpage = request.getParameter("rpage");
   
   System.out.println(sname + ", "+ svalue+", "+rpage);
   
   TableDAO dao = new TableDAO();
   
   //2. 페이지값에 따라서 start, end count 구하기
   int start = 0;
   int end = 0;
   int pageSize = 10;
   int totPage = 1;
   int dbCount = dao.getCount(sname, svalue);
   int reqPage = 1;
      
   //2-2. 전체 페이지 수 구하기
   if((dbCount % pageSize) == 0){
      totPage = dbCount/pageSize;
   }else{
      totPage = (dbCount/pageSize)+1;
   }
      
   //2-3. start, end 값 구하기
   if(rpage != ""){
      reqPage = Integer.parseInt(rpage);
      start = (reqPage-1)*pageSize+1;
      end = reqPage*pageSize;
   }else{
      start = reqPage;
      end = pageSize;
   }
   
   ArrayList<TableVO> list = dao.getList(sname, svalue, start, end);
   
   //list객체의 데이터를 JSON 객체로 변환 --> JSON 라이브러리 설치(gson)
   JsonArray jarray = new JsonArray();
   JsonObject jdata = new JsonObject();
   Gson gson = new Gson();
   
   for(TableVO vo : list){
      JsonObject jobj = new JsonObject();
      
      jobj.addProperty("rno", vo.getRno());
      jobj.addProperty("id", vo.getUser_id());
      jobj.addProperty("bid", vo.getBid());
      jobj.addProperty("btitle", vo.getBtitle());
      jobj.addProperty("name", vo.getName());
      jobj.addProperty("bdate", vo.getBdate());
      jobj.addProperty("bhits", vo.getBhits());
      
      jarray.add(jobj);
   }
   
   jdata.add("jlist", jarray);
   jdata.addProperty("dbCount", dbCount);
   jdata.addProperty("reqPage", reqPage);
   jdata.addProperty("pageSize", pageSize);
   out.write(gson.toJson(jdata)); //gson.toJson(변환할 객체)

%>
