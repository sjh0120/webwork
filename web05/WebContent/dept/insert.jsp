<%@page import="com.mongodb.client.MongoCollection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="org.bson.Document" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//if 코드가 없다면? -> 쿼리문을 통한 값 입력으로 db에 바로 io작업을 할 수 있음!
//-> 데이터를 조작하는 문제가 발생 된다
if(request.getMethod().equals("GET")){
	response.sendRedirect("add.jsp");
	return;
}

request.setCharacterEncoding("utf-8");
//get은 서버설정에서 utf-8 한번만 하면 되지만
//post방식은 매번 request 하기전에 utf-8을 해줘야만 한다
String param1=request.getParameter("deptno");
String param2=request.getParameter("dname");
String param3=request.getParameter("loc");

int deptno=Integer.parseInt(param1.trim());
String dname=param2.trim(); // 사용자 편의성을 위해서 '   ㅁㄴㅇㄹ   ' 입력이 되어도 'ㅁㄴㅇㄹ'로 되도록 하기 위해서
String loc=param3.trim();
//// 방법1
/*
Mongo client=null;
try{
	client=new MongoClient();
	DBCollection coll=client.getDB("testDB").getCollection("dept02");
	BasicDBObject doc=new BasicDBObject("_id",deptno);
	doc.append("dname", dname);
	doc.append("loc", loc);
	coll.insert(doc);
	
}finally{
	client.close();
}
*/
////
MongoClient client=null;
try{
	client=new MongoClient();
	MongoDatabase db=client.getDatabase("testDB");
	MongoCollection<Document> coll=db.getCollection("dept02");
	
	Document doc=new Document();
	doc.put("_id",deptno);
	doc.put("dname",dname);
	doc.put("loc",loc);
	
	Document doc2=new Document();
	doc.put("_id",deptno+1);
	doc.put("dname","re:"+dname);
	doc.put("loc","re:"+loc);
	
	java.util.List<Document> documents =new java.util.ArrayList<Document>();
	documents.add(doc);
	documents.add(doc2);
	
	//coll.insertOne(doc);
	coll.insertMany(documents);
	
}finally{
	client.close();
}

response.sendRedirect("list.jsp");
%>
</body>
</html>