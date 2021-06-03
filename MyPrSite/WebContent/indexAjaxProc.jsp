<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.myprsite.dao.*,com.myprsite.vo.*,java.util.*,com.google.gson.*"
%>

<%
String user_id = (String)session.getAttribute("id");
// System.out.println("xpxpxpxp테트스ㅡ");
ProfileDAO dao = new ProfileDAO();
UserDAO dao2 = new UserDAO();

ArrayList<ProfileVO> list = dao.getFace();	
JoinVO vo2 = dao2.getUserList(user_id);	
//System.out.println(vo);
//list객체의 데이터를 JSON 객체로 변환작업 필요  ---> JSON 라이브러리 설치(gson)
JsonArray jarray = new JsonArray();
JsonObject jdata = new JsonObject();
Gson gson = new Gson();


	JsonObject jobj = new JsonObject();
	
	jobj.addProperty("name",vo2.getName());
	int count=1;
	for(ProfileVO vo : list){
		jobj.addProperty("s_face_file_"+count,vo.getS_face_file());
		jobj.addProperty("id_"+count,vo.getId());
		count++;
	}
	
	
	//{"rno" : 1, "empno" :7369, "ename":smith, "hiredate":2020-10-15}
	jarray.add(jobj);

	jdata.add("jlist", jarray); // jarray.add(jobj);는 지금 배열 형태이기때문에 json은 전송을 하지 못함 ! 객체형태로 바꿔줘야해서 또 덮어주는것임!
	out.write(gson.toJson(jdata)); //gson.toJson(변환할 객체);
%>