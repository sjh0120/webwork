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
<p>
		<a href="../index.jsp">[로그아웃]</a>
	</p>
	<h1>학생 페이지 입니다</h1>
<%
String s_id=request.getParameter("s_id");
Connection conn=null;
Statement stmt=null;
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/school";
ResultSet rs=null;

try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,"user01","1234");
	stmt=conn.createStatement();
	String sql="select * from stuinfo where s_id='"+s_id+"';";
	rs=stmt.executeQuery(sql);
	if(rs.next()){
	%>
	<table width=300; border=1>
		<tr>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
		</tr>
		<tr>
			<td><%=rs.getInt(3) %></td>
			<td><%=rs.getInt(4) %></td>
			<td><%=rs.getInt(5) %></td>
		</tr>
	</table>
	<%
	}
	
}catch(Exception e){
	response.sendRedirect("../index.jsp");//잘못된 접근
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}

%>
<form action="reqCh.jsp">
<table width=600 border=1>
<tr>
<td align="center">수정요청</td>
<td colspan=2 align="center">제출 확인</td>
</tr>
<tr>
<td width=500><textarea cols="70" rows="10" name="s_request"></textarea></td>
 <td width=30><input type="checkbox" name="s_id"value=<%=s_id%>></td> 
<td width=10><input type="submit" value="제출"></td>
</tr>
</table>
</form>

	
</body>
</html>