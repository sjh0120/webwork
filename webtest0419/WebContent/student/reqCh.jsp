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
<%
String s_id=request.getParameter("s_id");
String text=request.getParameter("s_request");
Connection conn=null;
Statement stmt=null;
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/school";

try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,"user01","1234");
	stmt=conn.createStatement();
	String sql="insert into request(s_id, text) values('"+s_id+"','"+text+"');";
	System.out.println(sql);
	stmt.execute(sql);
	response.sendRedirect("success.jsp");
}catch(Exception e){
	response.sendRedirect("faile.jsp");
	
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
</body>
</html>