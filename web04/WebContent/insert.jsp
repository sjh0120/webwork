<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.*"%>
<%@ page import="org.bson.Document"%>
<%@ page import="com.mongodb.client.result.*"%>
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
			<td bgcolor="gray"></td>
			<td bgcolor="gray" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
			<td bgcolor="gray"></td>
		</tr>
		<tr>
			<td colspan="5">
				<!-- content start -->
	<%
	int deptno = 0;
	try {
		deptno = Integer.parseInt(request.getParameter("deptno"));
		//String deptno=request.getParameter("deptno");
		// 이때까지 mysql 에서는 문자열을 통해 처리해서 값을 전달했기 때문에 문제가 발생하지 않는다
		// 그러나 mongodb에서는 스키마 정의가 없기 때문에 이렇게 전달하면 문자열로 값이 전달된다!
		// 이는 나중에 _id 검색에 있어 숫자로 검색하면 문자열은 안나오기 때문에 문제가 발생할 수 있다
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");

		String ip = "127.0.0.1";
		int port = 27017;

		MongoClient client = null;
		try {
			client = new MongoClient(ip, port);
			DB db = client.getDB("testDB");
			DBCollection coll = db.getCollection("dept02");

			BasicDBObject doc = new BasicDBObject();
			doc.append("_id", deptno);
			doc.append("dname", dname);
			doc.append("loc", loc);

			coll.insert(doc);
		} finally {
			client.close();
		}

		response.sendRedirect("list.jsp");

	} catch (NumberFormatException e) {
		//out.println("<h1>오류발생</h1>");
		//out.println("<p>계속 문제가 발생시 전산관리자(tel : 000-0000-0000)에게 연락바랍니다</p>");
		response.sendRedirect("add.jsp?err=number01");
	}
	%>
	<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com</td>
		</tr>
	</table>
</body>
</html>