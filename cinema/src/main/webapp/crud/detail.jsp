<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen and (min-width: 830px)" href="../css/cruddetail.css" />
<link rel="stylesheet" type="text/css" media="screen and (max-width: 829px)" href="../css/cruddetailMini.css" />
<style rel="stylesheet" type="text/css">
body{
background-color: rgba(32, 33, 36, 0.6);
}

</style>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num").trim());
DBcrud movie = new DBcrud();
MovieDto moviedetail = movie.detailOne(num);
%>
	<div class="container">
		<h2>영화 정보</h2>
		<table class="detailtable">
			<tr>
				<td>제목</td>
				<td rowspan=4><img src="<%=moviedetail.getMovie_image() %>"/></td>
			</tr>
			<tr>
				<td><%=moviedetail.getMovie_name() %></td>
			</tr>
			<tr>
				<td>장르</td>
			</tr>
			<tr>
				<td><%=moviedetail.getMovie_genre() %></td>
			</tr>
			<tr>
				<td colspan=2>줄거리</td>
			</tr>
			<tr>
				<td colspan=2><%=moviedetail.getMovie_detail() %></td>
			</tr>
		</table>
		<div>
			<button><a href="update.jsp?num=<%=moviedetail.getNum() %>">수정</a></button>
			<button><a href="delete.jsp?num=<%=moviedetail.getNum() %>">삭제</a></button>
		</div>
	</div>

</body>
</html>