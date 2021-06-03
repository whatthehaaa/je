package com.myprsite.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.myprsite.vo.NoticeVO;

public class NoticeDAO extends DBConn {

	/**
	 * ��ü ����Ʈ ī���
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
	 *  update : ����� ������Ʈ
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
	 * delete : �������
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
	 *  update : ���� ����
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
			System.out.println(vo.getNtitle()+"SSS������?");
			System.out.println(vo.getNcontent()+"SSS������?");
			System.out.println(vo.getNfile()+"SSS������?");
			System.out.println(vo.getNsfile()+"SSS������?");
			System.out.println(vo.getNid()+"SSS������?");
			int val = pstmt.executeUpdate();
			if(val!=0) result =true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * select : ������ ���
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
	 * select : ��ü ����Ʈ ��� 
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
	 * Insert : �������� �۾���
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
