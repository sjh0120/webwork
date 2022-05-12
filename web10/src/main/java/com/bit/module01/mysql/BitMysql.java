package com.bit.module01.mysql;

import java.sql.*;

public class BitMysql {
	// 디자인패턴 - 싱글톤 패턴
	private static Connection conn=null;
	
	// 무지성 객체 생성 제한
	private BitMysql(){}
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException{
		String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/scott";
		String user="user01";
		String password="1234";
//		try {
			if(conn==null || conn.isClosed()) {
				Class.forName(driver);
				conn=DriverManager.getConnection(url,user,password);
			}
//		}catch(ClassNotFoundException e){
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		return conn;
	}
//	public static void main(String[] args) {
//		Connection conn=null;
//		try {
//			conn=getConnection();
//			Connection conn2=getConnection();
//			//conn.close();
//			//close()가 있다면 conn==conn2 => false
//			//close()가 없다면 conn==conn2 => true
//			//System.out.println(conn==conn2);
//		} 
////		catch (SQLException e) {
////			e.printStackTrace();
////		}
//		finally{
//			try {
//				if(conn!=null)conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}
}
