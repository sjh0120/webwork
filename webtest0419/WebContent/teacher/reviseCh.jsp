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
String s_Num=request.getParameter("s_Num");
String kor=request.getParameter("kor");
String eng=request.getParameter("eng");
String math=request.getParameter("math");
Connection conn=null;
String driver="com.mysql.cj.jdbc.Driver";
Statement stmt=null;
String url="jdbc:mysql://localhost:3306/school";
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,"user01","1234");
	stmt=conn.createStatement();
	
	String sql="update stuinfo set kor='" + Integer.parseInt(kor)
	+ "',eng='" + Integer.parseInt(eng) + "',math='"+ Integer.parseInt(math)
	+"' where s_Num="+Integer.parseInt(s_Num)+";";
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