<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="3;url=dept.jsp">
<title>Insert title here</title>
</head>
<body>
<%
//GET 방식 한글처리
//server.xml 수정
// <Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443"/>
    
String deptno=request.getParameter("deptno");
String dname=request.getParameter("dname");
String param3=request.getParameter("loc");
String loc=null;

if(param3.equals("1"))loc="서울";
if(param3.equals("2"))loc="대전";
if(param3.equals("3"))loc="대구";
if(param3.equals("4"))loc="부산";
if(param3.equals("5"))loc="광주";

String sql="insert into dept values("+deptno+",'"+dname+"','"+loc+"')";
System.out.println(sql);
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/scott";
String user="user01";
String pw="1234";

Connection conn=null;
Statement stmt=null;
int result=0;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,user,pw);
	stmt=conn.createStatement();
	result=stmt.executeUpdate(sql);
	
}catch (Exception e){%>
	<h1>중복된 부서입니다!</h1>
<%
} finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
if(result>0){
%>
<h1>등록 성공</h1>
<%}else{%>
<h1>등록 실패</h1>
<%} %>
</body>
</html>