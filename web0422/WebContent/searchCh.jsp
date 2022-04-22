<%@page import="org.bson.BsonDocument"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.client.*"%>
<%@ page import="org.bson.Document"%>
<%@ page import="org.bson.conversions.Bson" %>
<%@ page import="com.mongodb.client.model.Filters" %>
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
<h1>검색결과</h1>
<%	
	//if(request.getMethod().equals("GET")){
	//	response.sendRedirect("boardlist.jsp");
	//	return;
	//}

	String keywordType="";
	String paramKwT=request.getParameter("keywordType");
	System.out.println("paramKwT:"+paramKwT);
	String keyword="";
	String paramKw=request.getParameter("keyword").trim();
	
	long totalCount;
	
	MongoClient client=null;
	int p=1;
	try{
	p=Integer.parseInt(request.getParameter("p"));
	}catch(NumberFormatException e){}
	if(paramKw!=null){
	try{
		client = new MongoClient();
		MongoDatabase db = null;
		db = client.getDatabase("testDB2");
		MongoCollection<Document> coll = null;
		coll = db.getCollection("dummylist");
		Document doc=null;
		if(paramKwT.equals("title")){
			doc=new Document(paramKwT, new Document("$regex",paramKw));
		}else if(paramKwT.equals("body")){
			doc=new Document("body", new Document("$regex",paramKw));
		}else{
			doc=new Document("userId", new Document("$eq",Integer.parseInt(paramKw)));
		}
		FindIterable<Document> ite=coll.find(doc);
		MongoCursor<Document> cursor = ite.iterator();
		
		
		//Bson query = Filters.regex(paramKwT, paramKw);
		
		totalCount=coll.countDocuments(Filters.regex(paramKwT, paramKw));
		
		System.out.println("숫자:"+totalCount);
		
		
		%>
		<table border="1" width="800">
			<tr>
				<th>글번호</th>
				<th width="600">제목</th>
				<th>작성자</th>
			</tr>
			<%
			while(cursor.hasNext()){
				Document obj = cursor.next();%>
				<tr>
					<td><%=obj.getInteger("id", 0)%></td>
					
					<td><a href="detail.jsp?id=<%=obj.getInteger("id", 0) %>"><%=obj.getString("title")%></a></td>
					
					<td><%=obj.getInteger("userId", 0)%></td>
				</tr>
			<%}
			%>
		</table>
		<%
		
		}catch(Exception e){
			out.print("<h1>검색된 결과가 없습니다</h1>");
		}finally{
			client.close();
		}
	} %>


<%@ include file="template/footer.jspf"%>
</body>
</html>