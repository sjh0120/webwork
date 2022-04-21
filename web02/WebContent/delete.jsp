<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="2;url=dept.jsp">

<title>Insert title here</title>
</head>
<body>
<%
String deptno=request.getParameter("deptno");
String sql="delete from dept where deptno="+deptno;
String driver="com.mysql.cj.jdbc.Driver";

String url="jdbc:mysql://localhost:3306/scott";
String user="user01";
String pw="1234";
java.util.Properties info=new java.util.Properties();
info.setProperty("user",user);
info.setProperty("password", pw);
//System.setProperty("mysql.user","user01");
//System.setProperty("mysql.password","1234");


Connection conn=null;
Statement stmt=null;

try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,info);
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
</body>
</html>