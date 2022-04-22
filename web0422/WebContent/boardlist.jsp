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
<body>
	<%
		String myPath = ".";
	%>
	<%@ include file="template/header.jspf"%>
	<h1>게시판</h1>
	<form action="searchCh.jsp">
		<table align="center">
			<tr>
				<td>
				<select name="keywordType">
					<option value="id">id</option>
					<option value="title">제목</option>
					<option value="body">내용</option>
				</select>
				<input type="text" name="keyword">
				<input type="submit"value="검색">
				</td>
			</tr>
		</table>
	</form>
	<%
	MongoClient client = null;
	int totalCount;
	int p=1;
	try{
	p=Integer.parseInt(request.getParameter("p"));
	}catch(NumberFormatException e){}
	try {
		client = new MongoClient();
		MongoDatabase db = null;
		db = client.getDatabase("testDB2");
		MongoCollection<Document> coll = null;
		coll = db.getCollection("dummylist");
		FindIterable<Document> ite=coll.find().skip(10*(p-1)).limit(10);
		totalCount=Long.valueOf(coll.countDocuments()).intValue();
		
		MongoCursor<Document> cursor = ite.iterator();
	%>

	<table border="1" width="800">
		<tr>
			<th align="center">순서</th>
			<th align="center" width="600">제목</th>
			<th align="center">작성자</th>
		</tr>
		<%
		while(cursor.hasNext()){
			Document obj = cursor.next();%>
			
		<tr>
			<td><%=obj.getInteger("id", 0)%></td>
			<td><a href="detail.jsp?id=<%=obj.getInteger("id", 0) %>"><%=obj.getString("title")%></a></td>
			<td><%=obj.getInteger("userId", 0)%></td>
		</tr>
		<%
		}
	} finally {
		client.close();
	}
		%>
	</table>
	<table align="center">
		<tr>
		<%
		for(int i=1; i<=totalCount/10; i++){%>
			<td><a href="boardlist.jsp?p=<%=i %>>"><%=i %></a></td>
		<%}
		%>
		</tr>
	</table>
	<%
	//int count=
	%>
	<%@ include file="template/footer.jspf"%>
</body>
</html>