<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>param</h1>
<%
if(request.getMethod().equals("POST")){
	request.setCharacterEncoding("utf-8");
	String param1=request.getParameter("deptno");
	String param2=request.getParameter("dname");
	String param3=request.getParameter("loc");
	
	System.out.println("parma1 : "+param1);
	System.out.println("parma2 : "+param2);
	System.out.println("parma3 : "+param3);
	int deptno=Integer.parseInt(param1);
	String dname=param2.trim();
	String loc=param3.trim();
	
	String sql="insert into dept values ("+deptno+",'"+dname+"','"+loc+"')";
	String driver="com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/scott";
	String user="user01";
	String password="1234";
	
	Class.forName(driver);
	
	Connection conn=null;
	Statement stmt=null;
	try{
		conn=DriverManager.getConnection(url,user,password);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
}
%>
</body>
</html>