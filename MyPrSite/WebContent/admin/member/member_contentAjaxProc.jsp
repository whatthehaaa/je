<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import = "com.myprsite.dao.*,com.myprsite.vo.*,java.util.*,com.google.gson.*"%>
<%
//String user_id = (String)session.getAttribute("id");
// System.out.println("xpxpxpxp테트스ㅡ");
ProfileDAO dao = new ProfileDAO();
String id = request.getParameter("id");


ProfileVO vo = dao.getProfileContent(id);	

//System.out.println(vo);
//list객체의 데이터를 JSON 객체로 변환작업 필요  ---> JSON 라이브러리 설치(gson)
JsonArray jarray = new JsonArray();
JsonObject jdata = new JsonObject();
Gson gson = new Gson();


	JsonObject jobj = new JsonObject();
	
	
	
	
	jobj.addProperty("face_file",vo.getFace_file());
	jobj.addProperty("s_face_file",vo.getS_face_file());
	jobj.addProperty("area_select",vo.getArea_select());
	jobj.addProperty("introduce",vo.getIntroduce());
	jobj.addProperty("job_select_input_content",vo.getJob_select_input_content());
	jobj.addProperty("category_tech1_input_content",vo.getCategory_tech1_input_content());
	jobj.addProperty("univercity",vo.getUnivercity());
	jobj.addProperty("univercity_major",vo.getUnivercity_major());
	jobj.addProperty("attendance_status",vo.getAttendance_status());
	jobj.addProperty("univercity_file",vo.getUnivercity_file());
	jobj.addProperty("s_univercity_file",vo.getS_univercity_file());
	jobj.addProperty("certificate_name",vo.getCertificate_name());
	jobj.addProperty("certificate_date",vo.getCertificate_date());
	jobj.addProperty("certificate_agency",vo.getCertificate_agency());
	jobj.addProperty("certificate_file",vo.getCertificate_file());
	jobj.addProperty("s_certificate_file",vo.getS_certificate_file());
	jobj.addProperty("company",vo.getCompany());
	jobj.addProperty("department",vo.getDepartment());
	jobj.addProperty("position",vo.getPosition());
	jobj.addProperty("career_year",vo.getCareer_year());
	jobj.addProperty("career_month",vo.getCareer_month());
	jobj.addProperty("career_file",vo.getCareer_file());
	jobj.addProperty("s_career_file",vo.getS_career_file());

	
	//{"rno" : 1, "empno" :7369, "ename":smith, "hiredate":2020-10-15}
	jarray.add(jobj);

	jdata.add("jlist", jarray); // jarray.add(jobj);는 지금 배열 형태이기때문에 json은 전송을 하지 못함 ! 객체형태로 바꿔줘야해서 또 덮어주는것임!
	out.write(gson.toJson(jdata)); //gson.toJson(변환할 객체);
%>