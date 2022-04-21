<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800" align="center">
		<tr>
			<td colspan="5"><img src="imgs/logo.jpg"></td>
		</tr>
		<tr>
			<td bgcolor="gray" ></td>
			<td bgcolor="gray" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
			<td bgcolor="gray"></td>
		</tr>
		<tr>
			<td colspan="5">
			<h1>MySQL Page</h1>
			<!-- content start -->
	<%
	String by=request.getParameter("by");
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";
	if(by==null) by="deptno";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:mysql://localhost:3306/scott";
	String driver="com.mysql.cj.jdbc.Driver";
	String sql = "select * from dept where dname like '%"+keyword+"%' order by "+by;
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "user01", "1234");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	%>
	<table width=500 align="center" cellspacing=0 border=1>
		<tr>
			<td><a href=list2.jsp?by=deptno>deptno</a></td>
			<td><a href=list2.jsp?by=dname>dname</a></td>
			<td><a href=list2.jsp?by=loc>loc</a></td>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>


		<%}%>
	<%
	} finally {
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	%>
		</table>
			<p>
				<form>
					<input type="text" name="keyword">
					<input type="submit" value="검 색">
				</form>
			</p>
	<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by
				bitacademy co.ltd. All rights reserved. http://www.bitacademy.com</td>
		</tr>
	</table>
</body>
</html>