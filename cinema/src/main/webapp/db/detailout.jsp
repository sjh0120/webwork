<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="moviedetail" class="com.sjh0120.cinema.MovieDto" scope="session"></jsp:useBean>
<jsp:setProperty property="result" name="moviedetail" value="false"/> 

<jsp:forward page="../index.jsp">
	<jsp:param value="true" name="msg"/>
</jsp:forward>
</body>
</html>