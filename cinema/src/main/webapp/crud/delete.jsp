<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));
DBcrud movie=new DBcrud();
movie.deleteOne(num);

response.sendRedirect("./list.jsp");
%>

</body>
</html>