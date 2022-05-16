<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen and (min-width: 830px)" href="../css/crudlist.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 829px)" href="../css/crudlistMini.css"/>
<style rel="stylesheet" type="text/css">
body{
background-color: rgba(32, 33, 36, 0.6);
}
.detailtable tr:first-child:hover{
	background-color: white;
}
</style>
</head>
<%
DBcrud movie = new DBcrud();
ArrayList<MovieDto> list = movie.getList();
%>

<body>
	<div class="container">
		<h2>영화 리스트</h2>
		<table class="detailtable">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>장르</td>
				<td>내용</td>
			</tr>
			<%
			for (MovieDto movies : list) {
			%>
			<tr>
				<td><a href="detail.jsp?num=<%=movies.getNum() %>"><%=movies.getNum() %></a></td>
				<td><a href="detail.jsp?num=<%=movies.getNum() %>"><%=movies.getMovie_name() %></a></td>
				<td><%=movies.getMovie_genre() %></td>
				<td><%=movies.getMovie_detail() %></td>
			</tr>
			<%
			}
			%>
		</table>
		<div class="row"></div>
	</div>
</body>
</html>