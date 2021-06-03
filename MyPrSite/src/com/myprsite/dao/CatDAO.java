package com.myprsite.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.myprsite.vo.CatVO;

public class CatDAO extends DBConn{

	public ArrayList<CatVO> getCat1(String cat) {
		ArrayList<CatVO> clist = new ArrayList<CatVO>();
		
		try {
			String sql = "select * from (select id, substr(CATEGORY_TECH1_INPUT_CONTENT, 1, 9) cat, S_FACE_FILE from user_profile_test2) where cat like '%'||?||'%'";
			getPreparedStatement(sql);
			pstmt.setString(1, cat);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CatVO vo = new CatVO();
				vo.setId(rs.getString(1));
				vo.setCat1(rs.getString(2));
				vo.setImg(rs.getString(3));
				
				clist.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return clist;
	}
}
