package com.myprsite.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.myprsite.vo.ProfileVO;


public class ProfileDAO extends DBConn{
   
   /**
    *  index화면에 유저 얼굴 나오게하는 부분
    * **/
   public ArrayList<ProfileVO> getFace() {
      
      ArrayList<ProfileVO> list = new ArrayList<ProfileVO>();
      try {
         //4. SQL 실행 - ResultSet 객체 생성 
         
         String sql = "select id,s_face_file from(" + 
               "  select id,s_face_file from user_profile_test2 order by DBMS_RANDOM.RANDOM " + 
               " ) where rownum < 6 ";
         getPreparedStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         //5. ResultSet 객체 생성되는 경우 - 데이터 가져오기
         while(rs.next()){
            ProfileVO vo  = new ProfileVO();
            vo.setId(rs.getString(1));
            vo.setS_face_file(rs.getString(2));
         
            list.add(vo);

         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return list;
      
   }
   
   
   
   
   /**
    * 
    * update  file: 경력증명파일 업데이트
    */
   public boolean getUpdatefile(String file ,String sfile,String file_name,String sfile_name,String id) {
      boolean result=false;
      try {
         String sql =" update user_profile_test2 set "+file_name +"= '"+file+ "'," +sfile_name+"= '" + sfile +"'"
               + " where id='" + id +"'";
         getStatement();
         
         int val = stmt.executeUpdate(sql);
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   /**
    * 
    * update Career file: 경력증명파일 업데이트
    */
   public boolean getUpdateCareerfile(ProfileVO vo) {
      boolean result=false;
      try {
         String sql =" update user_profile_test2 set area_select=?,introduce=? ,"
               + " job_select_input_content=? ,category_tech1_input_content=?,univercity=? ,"
               + " univercity_major=? ,attendance_status=? ,"
               + " certificate_name=? ,certificate_date=?,certificate_agency=? ,"
               + " company =?,department=?,position =?,career_year =?,career_month =?, career_file =?,s_career_file =? "
               + " where id= ? ";
         getPreparedStatement(sql);
         
         pstmt.setString(1, vo.getArea_select());
         pstmt.setString(2, vo.getIntroduce());
         pstmt.setString(3, vo.getJob_select_input_content());
         pstmt.setString(4, vo.getCategory_tech1_input_content());
         pstmt.setString(5, vo.getUnivercity());
         pstmt.setString(6, vo.getUnivercity_major());
         pstmt.setString(7, vo.getAttendance_status());
         
         
         pstmt.setString(8, vo.getCertificate_name());
         pstmt.setString(9, vo.getCertificate_date());
         pstmt.setString(10, vo.getCertificate_agency());
         
         
         pstmt.setString(11, vo.getCompany());
         pstmt.setString(12, vo.getDepartment());
         pstmt.setString(13, vo.getPosition());
         pstmt.setString(14, vo.getCareer_year());
         pstmt.setString(15, vo.getCareer_month());
         
         pstmt.setString(16, vo.getCareer_file());
         pstmt.setString(17, vo.getS_career_file());
         
         pstmt.setString(18, vo.getId());
         
         
         int val = pstmt.executeUpdate();
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   /**
    * 
    * update Certificate file: 자경증파일 업데이트
    */
   public boolean getUpdateCertificatefile(ProfileVO vo) {
      boolean result=false;
      try {
         String sql =" update user_profile_test2 set area_select=?,introduce=? ,"
               + " job_select_input_content=? ,category_tech1_input_content=?,univercity=? ,"
               + " univercity_major=? ,attendance_status=? ,"
               + " certificate_name=? ,certificate_date=?,certificate_agency=? ,certificate_file =?,s_certificate_file =? ,"
               + " company =?,department=?,position =?,career_year =?,career_month =? "
               + " where id= ? ";
         getPreparedStatement(sql);
         
         pstmt.setString(1, vo.getArea_select());
         pstmt.setString(2, vo.getIntroduce());
         pstmt.setString(3, vo.getJob_select_input_content());
         pstmt.setString(4, vo.getCategory_tech1_input_content());
         pstmt.setString(5, vo.getUnivercity());
         pstmt.setString(6, vo.getUnivercity_major());
         pstmt.setString(7, vo.getAttendance_status());

         
         pstmt.setString(8, vo.getCertificate_name());
         pstmt.setString(9, vo.getCertificate_date());
         pstmt.setString(10, vo.getCertificate_agency());
         pstmt.setString(11, vo.getCertificate_file());
         pstmt.setString(12, vo.getS_certificate_file());
         
         pstmt.setString(13, vo.getCompany());
         pstmt.setString(14, vo.getDepartment());
         pstmt.setString(15, vo.getPosition());
         pstmt.setString(16, vo.getCareer_year());
         pstmt.setString(17, vo.getCareer_month());
         
         pstmt.setString(18, vo.getId());
         
         
         int val = pstmt.executeUpdate();
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   /**
    * 
    * update Univercity file: 대학증명파일 업데이트
    */
   public boolean getUpdateUnivercityfile(ProfileVO vo) {
      boolean result=false;
      try {
         String sql =" update user_profile_test2 set area_select=?,introduce=? ,"
               + " job_select_input_content=? ,category_tech1_input_content=?,univercity=? ,"
               + " univercity_major=? ,attendance_status=? ,"
               + " certificate_name=? ,certificate_date=?,certificate_agency=? ,"
               + " company =?,department=?,position =?,career_year =?,career_month =? "
               + " where id= ? ";
         getPreparedStatement(sql);
         
         pstmt.setString(1, vo.getArea_select());
         pstmt.setString(2, vo.getIntroduce());
         pstmt.setString(3, vo.getJob_select_input_content());
         pstmt.setString(4, vo.getCategory_tech1_input_content());
         pstmt.setString(5, vo.getUnivercity());
         pstmt.setString(6, vo.getUnivercity_major());
         pstmt.setString(7, vo.getAttendance_status());
         pstmt.setString(8, vo.getUnivercity_file());
         pstmt.setString(9, vo.getS_univercity_file());
         
         pstmt.setString(10, vo.getCertificate_name());
         pstmt.setString(11, vo.getCertificate_date());
         pstmt.setString(12, vo.getCertificate_agency());
         
         pstmt.setString(13, vo.getCompany());
         pstmt.setString(14, vo.getDepartment());
         pstmt.setString(15, vo.getPosition());
         pstmt.setString(16, vo.getCareer_year());
         pstmt.setString(17, vo.getCareer_month());
         
         pstmt.setString(18, vo.getId());
         
         
         int val = pstmt.executeUpdate();
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   /**
    * 
    * update face file: 얼굴사진 업데이트
    */
   public boolean getUpdateFacefile(ProfileVO vo) {
      boolean result=false;
      try {
         String sql =" update user_profile_test2 set face_file=? ,s_face_file=?, area_select=?,introduce=? ,"
               + " job_select_input_content=? ,category_tech1_input_content=?,univercity=? ,"
               + " univercity_major=? ,attendance_status=? ,"
               + " certificate_name=? ,certificate_date=?,certificate_agency=? ,"
               + " company =?,department=?,position =?,career_year =?,career_month =? "
               + " where id= ? ";
         getPreparedStatement(sql);
         
         pstmt.setString(1, vo.getFace_file());
         pstmt.setString(2, vo.getS_face_file ());
         pstmt.setString(3, vo.getArea_select());
         pstmt.setString(4, vo.getIntroduce());
         pstmt.setString(5, vo.getJob_select_input_content());
         pstmt.setString(6, vo.getCategory_tech1_input_content());
         pstmt.setString(7, vo.getUnivercity());
         pstmt.setString(8, vo.getUnivercity_major());
         pstmt.setString(9, vo.getAttendance_status());
   
         pstmt.setString(10, vo.getCertificate_name());
         pstmt.setString(11, vo.getCertificate_date());
         pstmt.setString(12, vo.getCertificate_agency());
         
         pstmt.setString(13, vo.getCompany());
         pstmt.setString(14, vo.getDepartment());
         pstmt.setString(15, vo.getPosition());
         pstmt.setString(16, vo.getCareer_year());
         pstmt.setString(17, vo.getCareer_month());
         
         pstmt.setString(18, vo.getId());
         

         int val = pstmt.executeUpdate();
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   
   /**
    * 
    * update : 내용업데이트 - 기존파일 유지
    */
   public boolean getUpdateNofile(ProfileVO vo) {
      boolean result=false;
      try {
         String sql =" update user_profile_test2 set area_select=?,introduce=? ,"
               + " job_select_input_content=? ,category_tech1_input_content=?,univercity=? ,"
               + " univercity_major=? ,attendance_status=? ,"
               + " certificate_name=? ,certificate_date=?,certificate_agency=? ,"
               + " company =?,department=?,position =?,career_year =?,career_month =? "
               + " where id= ? ";
         getPreparedStatement(sql);
         
         pstmt.setString(1, vo.getArea_select());
         pstmt.setString(2, vo.getIntroduce());
         pstmt.setString(3, vo.getJob_select_input_content());
         pstmt.setString(4, vo.getCategory_tech1_input_content());
         pstmt.setString(5, vo.getUnivercity());
         pstmt.setString(6, vo.getUnivercity_major());
         pstmt.setString(7, vo.getAttendance_status());
   
         pstmt.setString(8, vo.getCertificate_name());
         pstmt.setString(9, vo.getCertificate_date());
         pstmt.setString(10, vo.getCertificate_agency());
         
         pstmt.setString(11, vo.getCompany());
         pstmt.setString(12, vo.getDepartment());
         pstmt.setString(13, vo.getPosition());
         pstmt.setString(14, vo.getCareer_year());
         pstmt.setString(15, vo.getCareer_month());
         
         pstmt.setString(16, vo.getId());
         

         int val = pstmt.executeUpdate();
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   
   
   /**
    * 
    * update : 내용업데이트 - 기존파일 유지
    */
   public boolean getUpdateNofile2(ProfileVO vo) {
      boolean result=false;
      try {
         String sql =" update user_profile_test3 set top1_per=? , "
               + " top2_per=? , top3_per=?, video_name =?, video_content =? "
               + " where id= ? ";
         
         getPreparedStatement(sql);
         

    
         pstmt.setString(1, vo.getTop1_per());
         pstmt.setString(2, vo.getTop2_per());
         pstmt.setString(3, vo.getTop3_per());                 
         pstmt.setString(4, vo.getVideo_name());
         pstmt.setString(5, vo.getVideo_content());
         
         pstmt.setString(6, vo.getId());      
         

         int val = pstmt.executeUpdate();
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   

   
   
//   /**
//    * write 
//    */
//   public boolean setContent(ProfileVO vo){
//      boolean result = false;
//      
//      try {
//         String sql = "insert into user_profile " + 
//               " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//         getPreparedStatement(sql);
//         pstmt.setString(1, vo.getFace_file());
//         pstmt.setString(2, vo.getS_face_file ());
//         pstmt.setString(3, vo.getId());
//         pstmt.setString(4, vo.getArea_select());
//         pstmt.setString(5, vo.getIntroduce());
//         pstmt.setString(6, vo.getJob_select_input_content());
//         pstmt.setString(7, vo.getCategory_tech1_input_content());
//         pstmt.setString(8, vo.getUnivercity());
//         pstmt.setString(9, vo.getUnivercity_major());
//         pstmt.setString(10, vo.getAttendance_status());
//         pstmt.setString(11, vo.getUnivercity_file());
//         pstmt.setString(12, vo.getS_univercity_file());
//         pstmt.setString(13, vo.getCertificate_name());
//         pstmt.setString(14, vo.getCertificate_date());
//         pstmt.setString(15, vo.getCertificate_agency());
//         pstmt.setString(16, vo.getCertiticate_file());
//         pstmt.setString(17, vo.getS_certificate_file());
//         pstmt.setString(18, vo.getCompany());
//         pstmt.setString(19, vo.getDepartment());
//         pstmt.setString(20, vo.getPosition());
//         pstmt.setString(21, vo.getCareer_year());
//         pstmt.setString(22, vo.getCareer_month());
//         pstmt.setString(23, vo.getCareer_file());
//         pstmt.setString(24, vo.getS_career_file());
//         
//         
//         
//         
//         
//         int count = pstmt.executeUpdate();
//         if(count!=0) result = true;
//         
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      
//      return result;
//   }
   
   /**
    * write 
    */
/*
 * public boolean setContent(ProfileVO vo){ boolean result = false;
 * 
 * try { String sql = "insert into user_profile_test(face_file,s_face_file,id) "
 * + " values(?,?,?)"; getPreparedStatement(sql); pstmt.setString(1,
 * vo.getFace_file()); pstmt.setString(2, vo.getS_face_file());
 * pstmt.setString(3, vo.getId()); int count = pstmt.executeUpdate();
 * if(count!=0) result = true;
 * 
 * } catch (Exception e) { e.printStackTrace(); }
 * 
 * return result; }
 */
   /**
    * write :프로필 등록되어잇지 않는 경우 인서트
    */
   public boolean setProfileInsert(ProfileVO vo){
      boolean result = false;
      
      try {
         String sql = "insert into user_profile_test2 " + 
               " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
         getPreparedStatement(sql);
   pstmt.setString(1, vo.getFace_file());
   pstmt.setString(2, vo.getS_face_file ());
   pstmt.setString(3, vo.getId());
   pstmt.setString(4, vo.getArea_select());
   pstmt.setString(5, vo.getIntroduce());
   pstmt.setString(6, vo.getJob_select_input_content());
   pstmt.setString(7, vo.getCategory_tech1_input_content());
   pstmt.setString(8, vo.getUnivercity());
   pstmt.setString(9, vo.getUnivercity_major());
   pstmt.setString(10, vo.getAttendance_status());
   pstmt.setString(11, vo.getUnivercity_file());
   pstmt.setString(12, vo.getS_univercity_file());
   pstmt.setString(13, vo.getCertificate_name());
   pstmt.setString(14, vo.getCertificate_date());
   pstmt.setString(15, vo.getCertificate_agency());
   pstmt.setString(16, vo.getCertificate_file());
   pstmt.setString(17, vo.getS_certificate_file());
   pstmt.setString(18, vo.getCompany());
   pstmt.setString(19, vo.getDepartment());
   pstmt.setString(20, vo.getPosition());
   pstmt.setString(21, vo.getCareer_year());
   pstmt.setString(22, vo.getCareer_month());
   pstmt.setString(23, vo.getCareer_file());
   pstmt.setString(24, vo.getS_career_file());
         int count = pstmt.executeUpdate();
         if(count!=0) result = true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   
   
   /**
    * write :프로필 등록되어잇지 않는 경우 인서트(영상 및 사진)
    */
   public boolean setProfileInsert2(ProfileVO vo) {
      boolean result = false;
      
      try {
         String sql = "insert into user_profile_test3 " + 
               " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
         getPreparedStatement(sql);
         pstmt.setString(1, vo.getTop1_file());
         pstmt.setString(2, vo.getS_top1_file());
         pstmt.setString(3, vo.getTop2_file());
         pstmt.setString(4, vo.getS_top2_file());
         pstmt.setString(5, vo.getTop3_file());
         pstmt.setString(6, vo.getS_top3_file());         
         pstmt.setString(7, vo.getId());         
         pstmt.setString(8, vo.getTop1_per());
         pstmt.setString(9, vo.getTop2_per());
         pstmt.setString(10, vo.getTop3_per());         
         pstmt.setString(11, vo.getVideo_file());
         pstmt.setString(12, vo.getS_video_file());         
         pstmt.setString(13, vo.getVideo_img_file());
         pstmt.setString(14, vo.getS_video_img_file());         
         pstmt.setString(15, vo.getVideo_name());
         pstmt.setString(16, vo.getVideo_content());
         
            int count = pstmt.executeUpdate();
            if(count!=0) result = true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return result;
   }
   
   
   /**
    * 
    * update  file: 경력증명파일 업데이트(영상 및 사진)
    */
   public boolean getUpdatefile2(String file ,String sfile,String file_name,String sfile_name,String id) {
      boolean result=false;
      try {
         String sql =" update user_profile_test3 set "+file_name +"= '"+file+ "'," +sfile_name+"= '" + sfile +"'"
               + " where id='" + id +"'";
         getStatement();
         
         int val = stmt.executeUpdate(sql);
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   
   /**
    * 
    * update : 프로필 등록 되어있는 경우에 업데이트
    */
   public boolean setProfileUpdate(ProfileVO vo) {
      boolean result=false;
      try {
         String sql =" update user_profile_test2 set face_file=? ,s_face_file=?,area_select=?,introduce=? ,"
               + " job_select_input_content=? ,category_tech1_input_content=?,univercity=? ,"
               + " univercity_major=? ,attendance_status=? ,univercity_file =?,s_univercity_file=?,"
               + " certificate_name=? ,certificate_date=?,certificate_agency=? ,certificate_file =?,"
               + " s_certificate_file=? ,company =?,department=?,position =?,career_year =?,career_month =?,career_file =?,s_career_file =? "
               + " where id= ? ";
         getPreparedStatement(sql);
         pstmt.setString(1, vo.getFace_file());
         pstmt.setString(2, vo.getS_face_file ());
         pstmt.setString(3, vo.getArea_select());
         pstmt.setString(4, vo.getIntroduce());
         pstmt.setString(5, vo.getJob_select_input_content());
         pstmt.setString(6, vo.getCategory_tech1_input_content());
         pstmt.setString(7, vo.getUnivercity());
         pstmt.setString(8, vo.getUnivercity_major());
         pstmt.setString(9, vo.getAttendance_status());
         pstmt.setString(10, vo.getUnivercity_file());
         pstmt.setString(11, vo.getS_univercity_file());
         pstmt.setString(12, vo.getCertificate_name());
         pstmt.setString(13, vo.getCertificate_date());
         pstmt.setString(14, vo.getCertificate_agency());
         pstmt.setString(15, vo.getCertificate_file());
         pstmt.setString(16, vo.getS_certificate_file());
         pstmt.setString(17, vo.getCompany());
         pstmt.setString(18, vo.getDepartment());
         pstmt.setString(19, vo.getPosition());
         pstmt.setString(20, vo.getCareer_year());
         pstmt.setString(21, vo.getCareer_month());
         pstmt.setString(22, vo.getCareer_file());
         pstmt.setString(23, vo.getS_career_file());
         pstmt.setString(24, vo.getId());
         

         int val = pstmt.executeUpdate();
         if(val!=0) result= true;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
   }
   
   /**
    * 프로필 등록여부  체크
    * @param bid
    * @return
    */
   public int getProfileCount(String id) {
      int result=0;
      try {
         String sql = " select count(*) from user_profile_test2 where id = ? ";
         getPreparedStatement(sql);
         pstmt.setString(1, id);
         ResultSet rs = pstmt.executeQuery();
         
         if(rs.next()) result = rs.getInt(1);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return result;
      
   }
   
   /**
    *    select : 상세 내용 
    * */
   public ProfileVO getContent(String id) {
      ProfileVO vo = new  ProfileVO ();
       try {
         String sql=" select face_file ,s_face_file ,area_select,introduce ,job_select_input_content ,category_tech1_input_content,"
               + " univercity ,univercity_major ,attendance_status ,univercity_file ,s_univercity_file,certificate_name ,"
               + " certificate_date,certificate_agency ,certificate_file ,s_certificate_file ,company ,department,position ,"
               + " career_year ,career_month ,career_file ,s_career_file from user_profile_test2 where id= ? " ;
               
         getPreparedStatement(sql);
         pstmt.setString(1, id);
         ResultSet rs = pstmt.executeQuery();
         if(rs.next()) {
      
            vo.setFace_file(rs.getString(1));
            vo.setS_face_file (rs.getString(2));
            vo.setArea_select(rs.getString(3));
            vo.setIntroduce(rs.getString(4));
            vo.setJob_select_input_content(rs.getString(5));
            vo.setCategory_tech1_input_content(rs.getString(6));
            vo.setUnivercity(rs.getString(7));
            vo.setUnivercity_major(rs.getString(8));
            vo.setAttendance_status(rs.getString(9));
            vo.setUnivercity_file(rs.getString(10));
            vo.setS_univercity_file(rs.getString(11));
            vo.setCertificate_name(rs.getString(12));
            vo.setCertificate_date(rs.getString(13));
            vo.setCertificate_agency(rs.getString(14));
            vo.setCertificate_file(rs.getString(15));
            vo.setS_certificate_file(rs.getString(16));
            vo.setCompany(rs.getString(17));
            vo.setDepartment(rs.getString(18));
            vo.setPosition(rs.getString(19));
            vo.setCareer_year(rs.getString(20));
            vo.setCareer_month(rs.getString(21));
            vo.setCareer_file(rs.getString(22));
            vo.setS_career_file(rs.getString(23));
            
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
       
       return vo;
   }
   
   public ProfileVO getProfileContent(String id) {
      ProfileVO vo  = new ProfileVO();
      try {
         //4. SQL 실행 - ResultSet 객체 생성 
         
         String sql = "select * from user_profile_test2 where id = ?";
         getPreparedStatement(sql);
         pstmt.setString(1, id);
         ResultSet rs = pstmt.executeQuery();
         //5. ResultSet 객체 생성되는 경우 - 데이터 가져오기
         while(rs.next()){

            vo.setFace_file(rs.getString(1));
            vo.setS_face_file (rs.getString(2));
            vo.setId(rs.getString(3));
            vo.setArea_select(rs.getString(4));
            vo.setIntroduce(rs.getString(5));
            vo.setJob_select_input_content(rs.getString(6));
            vo.setCategory_tech1_input_content(rs.getString(7));
            vo.setUnivercity(rs.getString(8));
            vo.setUnivercity_major(rs.getString(9));
            vo.setAttendance_status(rs.getString(10));
            vo.setUnivercity_file(rs.getString(11));
            vo.setS_univercity_file(rs.getString(12));
            vo.setCertificate_name(rs.getString(13));
            vo.setCertificate_date(rs.getString(14));
            vo.setCertificate_agency(rs.getString(15));
            vo.setCertificate_file(rs.getString(16));
            vo.setS_certificate_file(rs.getString(17));
            vo.setCompany(rs.getString(18));
            vo.setDepartment(rs.getString(19));
            vo.setPosition(rs.getString(20));
            vo.setCareer_year(rs.getString(21));
            vo.setCareer_month(rs.getString(22));
            vo.setCareer_file(rs.getString(23));
            vo.setS_career_file(rs.getString(24));
            
         
            //System.out.println("Asdasdas");
            System.out.println(vo.getIntroduce());
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return vo;
      
   }
   
   public ProfileVO getProfileContent2(String id) {
      ProfileVO vo  = new ProfileVO();
      try {
         //4. SQL 실행 - ResultSet 객체 생성 
         
         String sql = "select * from user_profile_test3 where id = ?";
         getPreparedStatement(sql);
         pstmt.setString(1, id);
         ResultSet rs = pstmt.executeQuery();
         //5. ResultSet 객체 생성되는 경우 - 데이터 가져오기
         while(rs.next()){
            
            vo.setTop1_file(rs.getString(1));
            vo.setS_top1_file(rs.getString(2));            

            vo.setTop2_file(rs.getString(3));
            vo.setS_top2_file(rs.getString(4));
            
            vo.setTop3_file(rs.getString(5));
            vo.setS_top3_file(rs.getString(6));   
            
            vo.setId(rs.getString(7));
            
            vo.setTop1_per(rs.getString(8));
            vo.setTop2_per(rs.getString(9));
            vo.setTop3_per(rs.getString(10));

            vo.setVideo_file(rs.getString(11));
            vo.setS_video_file(rs.getString(12));
                        
            vo.setVideo_img_file(rs.getString(13));
            vo.setS_video_img_file(rs.getString(14));
            
            vo.setVideo_name(rs.getString(15));
            vo.setVideo_content(rs.getString(16));
         
            //System.out.println("Asdasdas");
            System.out.println(vo.getIntroduce());
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return vo;
      
   }
   
   
}