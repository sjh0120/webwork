<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="com.mongodb.client.model.Filters" %>
<%@ page import="org.bson.*" %>
<%@ page import="org.bson.conversions.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.mongodb.client.model.Updates" %>
<%@ page import="com.mongodb.client.model.UpdateOptions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String param1=request.getParameter("deptno");
String param2=request.getParameter("dname");
String param3=request.getParameter("loc");

int deptno=Integer.parseInt(param1);
String dname=param2.trim();
String loc=param3.trim();

/////////////////////////////
////////문자열 검사//////////
/////////////////////////////

if(request.getMethod().equals("GET")){
	response.sendRedirect("edit.jsp?deptno="+param1);
	return;
}

MongoClient client=null;
Document doc=new Document("$set",new Document("dname",dname).append("loc", loc));
try{
	/*
	client=new MongoClient();
	client.getDatabase("testDB")
		.getCollection("dept02")
			.updateOne(Filters.eq("_id",deptno)
					,doc);
	*/
	client=new MongoClient();
	client.getDatabase("testDB")
		.getCollection("dept02")
			.updateOne(
					//Filters.eq("_id",deptno) // 밑에꺼랑 바껴도 상관없음
					new Document().append("_id",deptno)
					,Updates.combine(
	                    Updates.set("dname", dname),
	                    Updates.set("loc", loc)
	                 )
					//,new UpdateOptions().upsert(true) // 없어도됨
					);
	//db.dept02.updateOne({'_id':10},{$set:{'dname':'abcd',loc:'abcd2'}})
	
}finally{
	client.close();
}

response.sendRedirect("list.jsp");
%>

</body>
</html>