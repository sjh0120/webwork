<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.client.*"%>
<%@ page import="org.bson.Document"%>
<%@ page import="org.bson.conversions.Bson" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String myPath=".";
%>
<%@ include file="template/header.jspf" %>
<h1>내용</h1>
<%
int id=Integer.parseInt(request.getParameter("id"));
%>
<table align="center" width="800" border="1">
<%
MongoClient client=new MongoClient();
try{
	MongoDatabase db=client.getDatabase("testDB2");
	MongoCollection<Document> coll = null;
	coll=db.getCollection("dummylist");
	FindIterable<Document> ite=coll.find(new Document("id", new Document("$eq",id)));
	MongoCursor<Document> cursor = ite.iterator();
	
	while(cursor.hasNext()){
		Document obj=cursor.next();
		%>
		<tr>
			<th width="100" align="center">글번호</th>
			<th width="100" align="center"><%=obj.getInteger("id") %></th>
			<th width="100" align="center">작성자</th>
			<th width="100" align="center"><%=obj.getInteger("userId") %></th>
			<th width="100" align="center">작성 시간</th>
			<th width="300" align="center">시간</th>
			
		</tr>
		<tr>
			<th align="center">제목</th>
			<th colspan="5" align="center"><%=obj.getString("title") %></th>
		</tr>
		<tr>
			<th align="center">내용</th>
			<td colspan="5"><%=obj.getString("body") %></td>
		</tr>
		<%
	}
	
}finally{
	client.close();
}

%>
</table>
<%@ include file="template/footer.jspf" %>
</body>
</html>