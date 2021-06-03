<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.dao.*,com.myprsite.vo.*,java.util.*,com.google.gson.*"%>


<%
	AdminDAO dao = new AdminDAO();

	String sname = request.getParameter("sname");
	String svalue = request.getParameter("svalue");
	
	//start, end 구하기
   //1. 선택한 페이지값
   String rpage = request.getParameter("rpage");
  
   //2-1. 페이지값에 따라서 start, end count 구하기
   //1페이지(1~10), 2페이지(11~20) ...
   int start =0;
   int end = 0;
   int pageSize = 5; // 한페이지당 출력되는 row
   int pageCount = 1; // 전체 페이지 수 : 전체 리스트 row / 한 페이지당 출력되는 row
   int dbCount = dao.getListCount(sname,svalue); //DB연동 후 전체로우수 출력
   System.out.println("dbcount--->" + dbCount);
   int reqPage = 1; //요청페이지
   
   //2-2. 전체페이지 수 구하기 - 화면출력
   if(dbCount % pageSize == 0) {
      pageCount = dbCount/pageSize;
   }else {
      pageCount = dbCount/pageSize +1;
   }
   
   //2-3. start, end 값 구하기
   if(rpage != "") {
      reqPage = Integer.parseInt(rpage);
      start = (reqPage -1) * pageSize +1;
      end = reqPage*pageSize;
   } else {
      start = reqPage;
      end = pageSize;
   }	
   
 	ArrayList<MemberVO> list = dao.getSearchList(sname,svalue,start,end);	
	
	//list객체의 데이터를 JSON 객체로 변환작업 필요  ---> JSON 라이브러리 설치(gson)
	JsonArray jarray = new JsonArray();
	JsonObject jdata = new JsonObject();
	Gson gson = new Gson();
	
	for(MemberVO vo : list){
		JsonObject jobj = new JsonObject();
		jobj.addProperty("rno",vo.getRno());
		jobj.addProperty("id",vo.getId());
		jobj.addProperty("name",vo.getName());
		jobj.addProperty("cp",vo.getHp());
		jobj.addProperty("sex",vo.getGender());
		jobj.addProperty("mdate",vo.getMdate());
		
		//{"rno" : 1, "empno" :7369, "ename":smith, "hiredate":2020-10-15}
		jarray.add(jobj);
	}
	jdata.add("jlist", jarray); // jarray.add(jobj);는 지금 배열 형태이기때문에 json은 전송을 하지 못함 ! 객체형태로 바꿔줘야해서 또 덮어주는것임!
	jdata.addProperty("dbcount",dbCount);
	jdata.addProperty("reqpage",reqPage);
	jdata.addProperty("pagesize",pageSize);
	out.write(gson.toJson(jdata)); //gson.toJson(변환할 객체); 
	
%>