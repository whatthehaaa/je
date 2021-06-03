package com.myprsite.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.myprsite.vo.NoticeVO;

public class NoticeDAO extends DBConn {

	/**
	 * 전체 리스트 카운드
	 * @param bid
	 * @return
	 */
	public int getListCount() {
		int result=0;
		try {
			String sql = "select count(*) from myprnotice";
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	/**
	 *  update : 조쇠수 업데이트
	 */
	public void getUpdateHits(String nid) {
		try {
			String sql=" update myprnotice set nhits=nhits+1 where nid=? ";
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * delete : 내용삭제
	 * */
	public boolean getDelete(String id) {
		boolean result = false;
		try {
			String sql="delete from myprnotice where nid=? ";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			int val = pstmt.executeUpdate();
			if(val!=0) result=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/**
	 *  update : 내용 수정
	 * */
	public boolean getUpdate(NoticeVO vo) {
		boolean result =false;
		try {
			String sql=" update myprnotice set ntitle=?, ncontent=? , nfile=? , nsfile=? "
					+ " where nid= ? ";
			
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getNsfile());
			pstmt.setString(5, vo.getNid());
			System.out.println(vo.getNtitle()+"SSS가져와?");
			System.out.println(vo.getNcontent()+"SSS가져와?");
			System.out.println(vo.getNfile()+"SSS가져와?");
			System.out.println(vo.getNsfile()+"SSS가져와?");
			System.out.println(vo.getNid()+"SSS가져와?");
			int val = pstmt.executeUpdate();
			if(val!=0) result =true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * select : 상세정보 출력
	 */
	public NoticeVO getContent(String nid ) {
		NoticeVO vo = new NoticeVO();
		try {
			String sql="select nid,ntitle,ncontent,to_char(ndate,'yyyy.mm.dd'),nhits,nfile,nsfile "
					+ " from myprnotice where nid =? ";
			
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			ResultSet rs =pstmt.executeQuery();
			if(rs.next()) {
				vo.setNid(rs.getString(1));
				vo.setNtitle(rs.getString(2));
				vo.setNcontent(rs.getString(3));
				vo.setNdate(rs.getString(4));
				vo.setNhits(rs.getInt(5));
				vo.setNfile(rs.getString(6));
				vo.setNsfile(rs.getString(7));
				/* System.out.println(vo.getNsfile() +"asdasdasdasd"); */
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	/*
	 * select : 전체 리스트 출력 
	 * */
	
	public ArrayList<NoticeVO> getList(int start, int end){
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			String sql = " select * from(select rownum rno,nid,ntitle,to_char(ndate,'yyyy.mm.dd'),nhits " + 
					" from(select *from myprnotice order by ndate desc)) where rno between ? and ? ";
			
			getPreparedStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNdate(rs.getString(4));
				vo.setNhits(rs.getInt(5));
				
				list.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public ArrayList<NoticeVO> getList(){
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			String sql = " select rownum rno,nid,ntitle,to_char(ndate,'yyyy.mm.dd'),nhits " + 
					" from(select *from myprnotice order by ndate desc) ";
			
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNdate(rs.getString(4));
				vo.setNhits(rs.getInt(5));
				
				list.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/*
	 * Insert : 공지사항 글쓰기
	 * */
	
	public boolean getInsert(NoticeVO vo) {
		boolean result = false;
		try {
			String sql="insert into myprnotice values('n_'||sequ_myprnotice.nextval,?,?,?,?,sysdate,0)";
			
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getNsfile());
			
			int val = pstmt.executeUpdate();
			if(val!=0) result=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
}
