<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.*"%>
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
			<td bgcolor="gray"></a></td>
			<td bgcolor="gray" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
			<td bgcolor="gray"></td>
		</tr>
		<tr>
			<td colspan="5">
				<!-- content start -->
				<h1>Search Page</h1>
				<form action="search.jsp">
					<table>
						<tr>
							<td>검색할 이름을 입력하세요</td>
							<td><input type="text" name=s_dname></td>
						</tr>
						<tr>
							<td><input type="submit" value="검색"></td>
						</tr>
					</table>
				</form>
				<%
				String s_dname="";
				String param=request.getParameter("s_dname");
				if(param!=null){
					try{
						DBCollection colls=new MongoClient("127.0.0.1",27017).getDB("testDB").getCollection("dept02");
						DBCursor cursor=colls.find(new BasicDBObject("dname",param));
						System.out.println("커서:"+cursor);
						DBObject obj=cursor.next();
						System.out.println("커서 id" + obj.get("_id"));
						
						out.println("<table width=300 border=1><tr>");
						out.print("<td>이름</td><td>dname</td><td>loc</td></tr>");
		                out.print("<td>"+obj.get("_id"));
		                out.print("<td>"+obj.get("dname"));
		                out.print("<td>"+obj.get("loc"));
		                out.println("</tr></table>");
					}catch(Exception e){
						out.print("<h1>검색된 결과가 없습니다</h1>");
					}
				} %>
				
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