<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style rel="stylesheet" type="text/css">
.container>*{
	text-align: center;
}
.detailtable{
	border: 2px solid black;
	border-radius: 5px;
	display: block;
	width: 800px;
	margin: 0px auto;
}
.detailtable>*{
	text-align: center;
}
.detailtable tr{
	display: block;
	border-top: 1px solid black;
	height: 40px;
}
.detailtable tr:hover{
	background-color: rgb(239,239,239);
}

.detailtable tr:first-child{
	border-top: 0px solid black;
	font-weight: bold;
}
.detailtable tr>td{
	height: 40px;
	display: inline-block;
	overflow: hidden;
	line-height: 40px;
}
.detailtable tr>td:first-child{
	width : 60px;
}
.detailtable tr>td:first-child>a{
	text-decoration: none;
	color: black;
}
.detailtable tr>td:nth-child(2){
	width : 100px;
}
.detailtable tr>td:nth-child(2)>a{
	text-decoration: none;
	color: black;
}
.detailtable tr>td:nth-child(3){
	width : 100px;
}
.detailtable tr>td:last-child{
	width : 500px;
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