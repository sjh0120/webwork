<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style rel="stylesheet" type="text/css">
.detailtable{
	border: 2px solid black;
	border-radius: 5px;
	width: 800px;
	height : 800px;
	margin: 0px auto;
}
.detailtable td{
	border-top : 1px solid black;
}

/*제목*/
.detailtable tr:first-child>td:first-child{
	border-top : 0px solid black;
	height: 70px;
	background-color: rgb(239,239,239);
	font-weight: bold;
	width: 280px;
}
.detailtable tr:first-child>td{
	border-top : 0px solid black;
}
.detailtable tr:nth-child(2)>td{
	height: 140px;
}
/*이미지*/
.detailtable tr:first-child>td:last-child{
	border-left : 1px solid black;
	width: 500px;
}
.detailtable tr:first-child>td:last-child>img{
	width: 300px;
	margin: 0px;
	padding : 0px;
}

.detailtable>*{
	text-align: center;
}
/*장르*/
.detailtable tr:nth-child(3)>td{
	height: 70px;
	background-color: rgb(239,239,239);
	font-weight: bold;
}
.detailtable tr:nth-child(4)>td{
	height: 140px;
}
/*줄거리*/
.detailtable tr:nth-child(5)>td{
	height: 70px;
	background-color: rgb(239,239,239);
	font-weight: bold;
}
.container>*{
	text-align: center;
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
		<button><a href="update.jsp?num=<%=moviedetail.getNum() %>">수정</a></button>
		<button><a href="delete.jsp?num=<%=moviedetail.getNum() %>">삭제</a></button>
	</div>

</body>
</html>