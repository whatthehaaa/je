package com.myprsite.dao;

import java.sql.ResultSet;
import com.myprsite.vo.JoinVO;

public class UserDAO extends DBConn{
	ResultSet rs;
	
	/** ȸ�������� **/
	public boolean join(JoinVO user) {
		boolean result = false;
		
		try {
			String sql = "insert into user_table values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			getPreparedStatement(sql);
			pstmt.setString(1, user.getChk1());
			pstmt.setString(2, user.getChk2());
			pstmt.setString(3, user.getChk3());
			pstmt.setString(4, user.getChk4());
			pstmt.setString(5, user.getId());
			pstmt.setString(6, user.getPass());
			pstmt.setString(7, user.getName());
			pstmt.setString(8, user.getBirth());
			pstmt.setString(9, user.getGender());
			pstmt.setString(10, user.getEmail());
			pstmt.setString(11, user.getHp());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * mypage1_intro
	 */
	public String getPass(String id) {
		String result = "";
		
		try {
			String sql = "select pass from user_table where id=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * ȸ������ ��������
	 */
	public JoinVO getUserList(String id) {
		JoinVO user = new JoinVO();
		
		try {
			String sql = "select name, id, pass, substr(birth, 1, 4) year, substr(birth, 6, 2) month, "
					+ " substr(birth, 9, 2) day, hp, email, chk4 "
					+ " from user_table where id=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				user.setName(rs.getString(1));
				user.setId(rs.getString(2));
				user.setPass(rs.getString(3));
				user.setYear(rs.getString(4));
				user.setMonth(rs.getString(5));
				user.setDay(rs.getString(6));
				user.setHp(rs.getString(7));
				user.setEmail(rs.getString(8));
				user.setChk4(rs.getString(9));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user; 
	}

	/** �α����� **/
	public int login(String id,String pass) {
		String SQL ="SELECT pass FROM USER_TABLE WHERE id=?";
		try {
			getPreparedStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pass)) {
					return 1;//�α��� ����
				}else {
					return 0;//��й�ȣ����ġ
				}
			}
			return -1;//���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;//�����ͺ��̽�����
	}
	/*
	 * find_id_pw ���̵�ã��
	 */
	public JoinVO findId(String name,String phone) {
		JoinVO vo = new JoinVO();
		try {
			String sql ="SELECT ID FROM USER_TABLE WHERE NAME=? AND HP=?";
			getPreparedStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,phone);
			rs = pstmt.executeQuery();
			if(rs.next())vo.setId(rs.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;//�����ͺ��̽�����
	}
	/*
	 * find_id_pw ��й�ȣã��
	 */
	public JoinVO findPass(String id) {
		JoinVO vo = new JoinVO();
		try {
			String sql ="SELECT PASS FROM USER_TABLE WHERE ID=?";
			getPreparedStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) vo.setPass(rs.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	/*
	 * find_id_pw ���̵�ã�� - �̸�,���� ��üũ
	 */
	public int findNamePhoneFormCheck(String name,String phone) {
		try {
			String sql ="SELECT NAME,HP FROM USER_TABLE WHERE NAME=? OR HP=?";
			getPreparedStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(!rs.getString(1).equals(name)) {
						return 1;//�̸���Ʋ��
				}else if(!rs.getString(2).equals(phone)) {
						return 2;//������Ʋ��
				}else {
					return 0;//����
				}
			}
			return -1;//�Ѵپ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;//��������
	}
	/*
	 * find_id_pw ���̵�ã�� - ���̵� ��üũ
	 */
	public int findIdFormCheck(String id) {
		try {
			String sql ="SELECT ID FROM USER_TABLE WHERE id=?";
			getPreparedStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(id))return 0;//���̵�ã��
			}
			return -1;//���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;//�����ͺ��̽�����
	}
	
	/**
	 * ȸ��Ż��
	 */
	public boolean withdrawal(String id) {
		boolean result=false;
		
		try {
			String sql = "delete user_table where id=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			
			int count = pstmt.executeUpdate();
			
			if(count != 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * ���������� ���� ����
	 */
	public boolean updateUser(JoinVO vo) {
		boolean result = false;
		
		try {
			String sql = "update user_table set name=?, pass=?, birth=?, hp=?, email=?, chk4=? where id=?";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getBirth());
			pstmt.setString(4, vo.getHp());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getChk4());
			pstmt.setString(7, vo.getId());
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("���� ��� : " + result);
		return result;
	}
	
	/**
	 * ���̵� �ߺ� üũ
	 */
	public int idCheck(String id) {
		int result = 0;
		
		try {
			String sql = "select count(*) from user_table where id=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * ��ȭ��ȣ �ߺ� üũ
	 */
	public int hpCheck(String hp) {
		int result = 0;
		
		try {
			String sql = "select count(*) from user_table where hp=?";
			getPreparedStatement(sql);
			pstmt.setString(1, hp);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * ��ȭ��ȣ �ߺ� üũ
	 */
	public int hpCheck(String hp, String id) {
		int result = 0;
		
		try {
			String sql = "select count(*) from user_table where hp=? and id != ?";
			getPreparedStatement(sql);
			pstmt.setString(1, hp);
			pstmt.setString(2, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * �̸� ��������
	 */
	public String getName(String id, String pass) {
		String result = "";
		
		try {
			String sql = "select name from user_table where id=? and pass=?";
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
