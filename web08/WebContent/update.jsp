<%@page import="java.lang.Thread.State"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
int deptno=Integer.parseInt(request.getParameter("deptno").trim());
String dname=request.getParameter("dname").trim();
String loc=request.getParameter("loc").trim();
String sql="update dept set dname='"+dname+"',loc='"+loc+"' where deptno="+deptno;
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/scott";
String user="user01";
String password="1234";

Connection conn=null;
Statement stmt=null;
Class.forName(driver);

try{
	if(request.getMethod().equals("POST")){
		conn=DriverManager.getConnection(url,user,password);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}else{
		response.sendRedirect(request.getContextPath());
	}
	
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
</body>
</html>