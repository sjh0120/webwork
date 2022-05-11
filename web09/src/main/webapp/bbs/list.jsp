{"root":[
<%
String sql="select empno,ename,sal from emp order by empno asc";
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/scott";
String user="user01";
String password="1234";

Class.forName(driver);
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	conn=DriverManager.getConnection(url,user,password);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	boolean boo=true;
	while(rs.next()){
		if(boo) boo=false;
		else out.print(',');
	%>
{"empno":<%=rs.getInt("empno")%>, "ename":"<%=rs.getString("ename")%>","sal":<%=rs.getInt("sal")%>}
	<%
	}
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
]}