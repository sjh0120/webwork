<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
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

Connection conn=null;
Statement stmt=null;
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/school";
ResultSet rs=null;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,"user01","1234");
	stmt=conn.createStatement();
	String sql="select * from school.stuinfo where s_Num=\'"+s_Num+"\';";
	System.out.println(sql);
	rs=stmt.executeQuery(sql);
	%>
	<h1>성적 수정</h1>
	<table width=500 border=1>
	<tr>
		<td>학번</td>
		<td>이름</td>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
	</tr>
	<%
	while(rs.next()){%>
	<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getInt(3) %></td>
		<td><%=rs.getInt(4) %></td>
		<td><%=rs.getInt(5) %></td>
	</tr>
	<%
	}
	%>
	</table>
	<%
}catch(Exception e){
	
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}

%>
<form action=change.jsp>
<table>
<tr>
<td>국어 : </td>
<td><input type="text" name=kor></td>
</tr>
<tr>
<td>영어 : </td>
<td><input type="text" name=eng></td>
</tr>
<tr>
<td>수학 : </td>
<td><input type="text" name=math></td>
</tr>

</table>
<input type="submit" value="변경하기">
</form>

<!-- <form action=remove.jsp>
<input type="submit" value="삭제하기" name=s_Num>
</form>
 -->

</body>
</html>