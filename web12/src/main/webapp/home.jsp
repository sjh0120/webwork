<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="com.bit.util.EmpDto"></jsp:useBean>
<%
obj.setEname("아무개");
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>