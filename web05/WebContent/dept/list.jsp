<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.client.*"%>
<%@ page import="org.bson.Document"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="gray">
<%
String myPath="..";
%>
<%@ include file="../template/header.jspf" %>
				<h1>DEPT List</h1>
				<table width="500" align="center" border="1">
					<tr>
						<th>deptno</th>
						<th>dname</th>
						<th>loc</th>
					</tr>
					<%
					//Mongo mongo=new MongoClient(); // -> default 일때 localhost에 27017이다
					//DB db=mongo.getDB("testDB");
					//DBCollection coll=db.getCollection("dept02");
					//DBCursor cursor=coll.find();

					MongoClient client = null;
					int p=0;//페이지 번호
					try{
						p=Integer.parseInt(request.getParameter("p"));
					}catch(NumberFormatException e){
						
					}
					try {
						client=new MongoClient();

						MongoDatabase db = null;
						db = client.getDatabase("testDB");
						MongoCollection<Document> coll = null;
						coll = db.getCollection("dept02");
						FindIterable<Document> ite = coll.find().skip(5*(p-1)).limit(5);
						MongoCursor<Document> cursor = ite.iterator();

						while (cursor.hasNext()) {
							//DBObject obj=cursor.next();
							Document obj = cursor.next();
					%>
					<tr>
						<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id",0) %>"><%=obj.getInteger("_id", 0)%></a></td>
						<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id",0) %>"><%=obj.getString("dname")%></a></td>
						<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id",0) %>"><%=obj.getString("loc")%></a></td>
					</tr>
					<%
						}
					} finally {
					client.close();
					}
					%>
				</table>
				<p align="center"><a href="add.jsp">[입 력]</a></p>
<%@ include file="../template/footer.jspf" %>
</body>
</html>