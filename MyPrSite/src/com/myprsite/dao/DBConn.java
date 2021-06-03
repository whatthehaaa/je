package com.myprsite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DBConn {
	//Field
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521";
		String user = "scott";
		String pass = "tiger";
	
		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
		
		//Constructor
		public DBConn() {
			try {
				//1. 드라이버 로딩
				Class.forName(driver);

				//2. Connection 객체 생성
				conn = DriverManager.getConnection(url, user, pass);
					
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
			
		//Method
		public void getStatement() {
			try {
				//3. Statement(PreparedStatement) 객체 생성
				stmt = conn.createStatement();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
			
		public void getPreparedStatement(String sql) {
			try {
				pstmt = conn.prepareStatement(sql);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
