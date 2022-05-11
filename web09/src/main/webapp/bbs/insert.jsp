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
request.setCharacterEncoding("utf-8");
String[] params={
	request.getParameter("empno")
	,request.getParameter("ename")
	,request.getParameter("sal")
};
int empno=Integer.parseInt(params[0].trim());
String ename=params[1].trim();
int sal=Integer.parseInt(params[2].trim());
String sql="insert into emp (empno,ename,sal,hiredate) values ("
	+empno+",'"+ename+"',"+sal+",now())";
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/scott";
String user="user01";
String password="1234";

Class.forName(driver);

Connection conn=null;
Statement stmt=null;

try{
	if(request.getMethod().equals("POST")){
		conn=DriverManager.getConnection(url,user,password);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}


%>
</body>
</html>