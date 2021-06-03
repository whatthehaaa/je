package com.myprsite.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.myprsite.vo.ReplyVO;

public class ReplyDAO extends DBConn{
	/**
	 * 댓글달기
	 */
	public int write(ReplyVO vo){
		int count = 0;
		
		try {
			String sql = "insert into reply_table values('r_'||SEQ_REPLY.nextval, ?, ?, ?, sysdate, ?,?,?)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getUser_id());
			pstmt.setString(2, vo.getBid());
			pstmt.setString(3, vo.getRcon());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getPfile());
			pstmt.setString(6, vo.getPsfile());
			
			count = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	/**
	 * 댓글 가져오기
	 */
	public ArrayList<ReplyVO> select(String bid){
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		
		try {
			String sql = "select * from reply_table where bid=? order by rdate";
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				ReplyVO vo = new ReplyVO();
				vo.setRid(rs.getString(1));
				vo.setUser_id(rs.getString(2));
				vo.setBid(rs.getString(3));
				vo.setRcon(rs.getString(4));
				vo.setRdate(rs.getString(5));
				vo.setName(rs.getString(6));
				vo.setPfile(rs.getString(7));
				vo.setPsfile(rs.getString(8));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 댓글 삭제
	 */
	public int delete(String rid) {
		int result = 0;
		
		try {
			String sql = "delete from reply_table where rid=?";
			getPreparedStatement(sql);
			pstmt.setString(1, rid);
			result = pstmt.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 수정
	 */
	public int update(String rid, String rcon) {
		int result = 0;
		System.out.println(rid+", "+ rcon);
		try {
			String sql = "update reply_table set rcon = ? where rid = ?";
			getPreparedStatement(sql);
			pstmt.setString(1, rcon);
			pstmt.setString(2, rid);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 프로필 업데이트
	 */
	public boolean updateProfile(String id, String pfile, String psfile) {
		boolean result = false;
		
		try {
			String sql = "update reply_table set pfile=?, psfile=? where user_id=?";
			getPreparedStatement(sql);
			pstmt.setString(1, pfile);
			pstmt.setString(2, psfile);
			pstmt.setString(3, id);
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
