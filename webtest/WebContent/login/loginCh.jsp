<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 확인 중...</h1>
<%
Properties info=new Properties();
info.setProperty("user","user01");
info.setProperty("password","1234");

Properties info2=new Properties();
String u_id=request.getParameter("u_id");
String u_pw=request.getParameter("u_pw");
String who=request.getParameter("who");

String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/school";
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

if(who.equals("student")){
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, info);
		stmt=conn.createStatement();
		String sql="select s_id,s_pw from school.stuinfo";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
			if(rs.getString(1).equals(u_id) && rs.getString(2).equals(u_pw)){
				response.sendRedirect("../student/Smain.jsp");
				break;
			}
			else{ 
				response.sendRedirect("../index.jsp");
				System.out.println("로그인 실패");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
}else{
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, info);
		stmt=conn.createStatement();
		String sql="select t_id,t_pw from school.teacher";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
			if(rs.getString(1).equals(u_id) && rs.getString(2).equals(u_pw)){
				response.sendRedirect("../teacher/Tmain.jsp");
				break;
			}
			else{ 
				response.sendRedirect("../index.jsp");
				System.out.println("로그인 실패");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
}



%>
</body>
</html>