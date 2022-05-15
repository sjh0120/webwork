<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<%
int num=Integer.parseInt(request.getParameter("num").trim());
String image= request.getParameter("movie_image").trim();
String genre= request.getParameter("movie_genre").trim();
String detail= request.getParameter("movie_detail").trim();
DBcrud movie = new DBcrud();
movie.updateOne(num, image, genre, detail);
%>
<body>

</body>
</html>