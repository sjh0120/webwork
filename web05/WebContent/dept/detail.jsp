<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="org.bson.*" %>
<%@ page import="org.bson.conversions.Bson" %>
<%@ page import="com.mongodb.client.model.Filters" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String myPath = "..";%>
	<%@ include file="../template/header.jspf"%>
	<%
	int deptno=Integer.parseInt(request.getParameter("deptno"));
	//String dname=request.getParameter("dname");
	String dname=null;
	String loc=null;
	MongoClient client=null;
	try{
		client=new MongoClient();
		MongoDatabase db=client.getDatabase("testDB");
		MongoCollection<Document> coll=db.getCollection("dept02");
		
		//필터사용 방법 2 / 싱글 디자인 패턴 import는 위에!
		Bson filter=Filters.eq("_id",deptno);
		//Bson filter=Filters.and(Filters.eq("_id",deptno),Filters.eq("dname",dname));
		
		MongoCursor<Document> cur=coll.find(filter).iterator();
		if(cur.hasNext()){
			Document doc=cur.next();
			deptno=doc.getInteger("_id");
			dname=doc.getString("dname");
			loc=doc.getString("loc");
		}
		
		/*
		//방법 1
		//Document filter=new Document();
		//filter.append("_id", deptno);
		MongoCursor<Document> cur=coll.find(filter).iterator();
		if(cur.hasNext()){
			Document doc=cur.next();
			deptno=doc.getInteger("_id");
			dname=doc.getString("dname");
			loc=doc.getString("loc");
		}
		*/
	}finally{
		client.close();
	}
	%>
	<h1>DEPT Detail Page</h1>
	<table align="center">
	
		<tr>
			<td width="100" bgcolor="#cccccc" align="center">deptno</td>
			<td><input type="text" name="deptno" value="<%=deptno %>"readonly></td>
		</tr>
		<tr>
			<td bgcolor="#cccccc" align="center">dname</td>
			<td><input type="text" name="dname" value="<%=dname %>"readonly></td>
		</tr>
		<tr>
			<td bgcolor="#cccccc" align="center">loc</td>
			<td><input type="text" name="loc" value="<%=loc %>"readonly></td>
		</tr>
		<tr>
			<td align="center">
			<form action="edit.jsp">
				<input type="submit" value="수 정">
			</form>
			</td>
			<td align="center">
			<form action="delete.jsp" method="post">
				<input type="hidden" name="deptno" value=<%=deptno %>>
				<input type="submit" value="삭 제">
			</form>
			</td>
		</tr>
		
	</table>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>