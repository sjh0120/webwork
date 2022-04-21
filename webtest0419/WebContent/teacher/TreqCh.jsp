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
ResultSet rs=null;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,"user01","1234");
	stmt=conn.createStatement();
	String sql="select * from request;";
	System.out.println("확인용:"+sql);
	rs=stmt.executeQuery(sql);%>
	<table width=700 border=1>
		<tr>
			<td colspan=2 align="center">수정 요청 사항</td>
		</tr>
		<tr>
			<td width=100>요청자 id</td>
			<td align="center">요청 내용</td>
		</tr>
	<%
	while(rs.next()){%>
		<tr>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(2) %></td>
		</tr>
	<% }%>
	<!--  <tr>
	<td colspan=3><input type="submit" value="돌아가기"></td>
	</tr>-->
	</table>
	<%
}catch(Exception e){
	
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
	
		
	
</body>
</html>