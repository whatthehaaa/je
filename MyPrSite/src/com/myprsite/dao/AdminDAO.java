package com.myprsite.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.myprsite.vo.MemberVO;
import com.myprsite.vo.ProfileVO;



public class AdminDAO extends DBConn {
	

	
	/**
	 *  content : 회원상세정보
	 * */
	
	public MemberVO getContent(String id) {
		MemberVO vo = new MemberVO();
		try {
			String sql = "select id,name,gender,hp" + 
					" from user_table where id=? ";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setGender(rs.getString(3));
				vo.setHp(rs.getString(4));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	/**
	 * 검색 기능
	 */
	public ArrayList<MemberVO> getSearchList(String sname, String svalue,
													int start, int end){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			String str="";
			if(sname.equals("total")) {
				str="";
			}else {
				str = " where " + sname +"='"+svalue+"'";
			}
			
			String sql = " select * from (select rownum rno, id, name, hp, gender, to_char(mdate,'yyyy.mm.dd') mdate " + 
					" from (select * from user_table order by mdate desc) " 
					+ str + ") where rno between "+ start + " and " + end ;
			System.out.println("sql-->" + sql);				
			getStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setRno(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setHp(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setMdate(rs.getString(6));
				
				list.add(vo);
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}	
	
	
	
	
	/**
	 * 검색기능 시 리스트 카운트
	 */
	public int getListCount(String sname, String svalue) {
		int result = 0;
		
		try {
			String str="";
			if(!sname.equals("total")) {
				str = " where "+sname+"="+"'" + svalue+"'";
			}
			
			String sql = "select count(*) from user_table " + str;
			getStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) result = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
