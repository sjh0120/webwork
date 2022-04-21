<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>선생님 로그인 성공</h1>
	<%
	Connection conn = null;
	Statement stmt = null;
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/school";
	ResultSet rs = null;
	String sql = "select * from school.stuinfo";

	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "user01", "1234");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	%>
	<table width=600 align="center" border=1>
		<tr>
			<td align="center">학번</td>
			<td align="center">이름</td>
			<td align="center">국어</td>
			<td align="center">영어</td>
			<td align="center">수학</td>
			<td align="center">I D</td>
			<td align="center">P W</td>
		</tr>

		<%
			while (rs.next()) {
		%>
		<tr>
			<td align="center"><%=rs.getInt(1)%></td>
			<td align="center"><a href="scoreWork.jsp?s_Num=<%=rs.getInt(1) %>"> <%=rs.getString(2)%></a></td>
			<td align="center"><%=rs.getInt(3)%></td>
			<td align="center"><%=rs.getInt(4)%></td>
			<td align="center"><%=rs.getInt(5)%></td>
			<td align="center"><%=rs.getString(6)%></td>
			<td align="center"><%=rs.getString(7)%></td>
		</tr>
		<%
			}
		%>

	</table>
	<%
	} catch (Exception e) {

	} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
	}
	%>
</body>
</html>