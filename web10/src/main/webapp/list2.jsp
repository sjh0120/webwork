<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.bit.module01.mysql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@ include file="template/head.jspf"%>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

nav {
	background-color: gray;
	overflow: hidden;
}

nav>ul {
	list-style: none;
	padding: 0px;
	margin: 0px;
}

nav>ul>li {
	display: inline-block;
	width: 100px;
}

nav>ul>li>a {
	display: block;
	height: 40px;
	color: white;
	text-decoration: none;
	text-align: center;
	line-height: 20px;
}

.row img {
	width: 100%;
}

.btn {
	/*position:relative;*/
	width: 30px;
	height: 30px;
	border: 1px solid white;
	border-radius: 4px;
	overflow: hidden;
	float: right;
	background-color: darkgray;
}

.table, .table tr>th, .table tr>td{
	border: 1px solid gray;
	border-collapse: collapse;
	
}
.table{
	width: 80%;
	margin: 100px auto;
}
.table tr, .table tr>td{
	height: 50px;
}
.table tr>td>a{
	display: block;
	height: 50px;
}
.table tr>td:first-child>a{
	text-align: center;
}
.table tr>td:last-child>a{
	text-align: right;
}
.button{
	display: block;
	width: 80%;
	margin: 50px auto;
	height: 40px;
	text-decoration: none;
	background-color: blue;
	border-radius: 5px;
	color: white;
	text-align:center;
}

.btn>span {
	border: 0px solid white;
	width: 20px;
	display: inline-block;
	position: relative;
}

.btn>span:nth-child(2) {
	top: -10px;
}

.btn>span:nth-child(3) {
	top: -30px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('<div class="btn"/>').append('<span></span>').append('<span></span>')
				.append('<span></span>').appendTo('nav').click(function() {
					$('nav>ul>li').toggle();
				});
		$(window).on('resize', function() {
			if ($('nav').width() < 600) {
				$('.btn').show();
				$('nav>ul>li').css('display', 'block').hide();
			} else {
				$('.btn').hide();
				$('nav>ul>li').css('display', 'inline-block');
			}
		});
	});
	$(function() {
		if ($('nav').width() < 600) {
			$('.btn').show();
			$('nav>ul>li').css('display', 'block').hide();
		} else {
			$('.btn').hide();
			$('nav>ul>li').css('display', 'inline-block');
		}
		
		
		///scroll
		$(window).scroll(function(e){
			var h=$(window).scrollTop();
			console.log(h,$('body').height(),$(document).height());
			if(h+$(window).height()+100>$(document).height()){
				$('table').append(`<tr>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td>
					</tr>
					<tr>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td>
					</tr>
					<tr>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td>
					</tr>
					<tr>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td>
					<td><a href="#">add</a></td></tr>`);
			}
		});
	});
</script>
</head>
<body>
	<nav>
		<ul>
			<li><a href="index.jsp">HOME</a></li>
			<li><a href="list.jsp">EMP</a></li>
			<li><a href="#">DEPT</a></li>
			<li><a href="#">ETC</a></li>
		</ul>
	</nav>
	<div class="container">
		<div class="row">
			<div class="grid12">
				<table class="table">
					<thead>
					<tr>
						<th>empno</th>
						<th>ename</th>
						<th>sal</th>
					</tr>
					</thead>
					<tbody>
					<%
					BitEmp emp=new BitEmp();
					ArrayList<EmpBean> list= emp.getList();
					for(EmpBean bean : list){
					%>
						<tr>
							<td><a href="#"><%=bean.getEmpno() %></a></td>
							<td><a href="#"><%=bean.getEname() %></a></td>
							<td><a href="#"><%=bean.getSal() %></a></td>
						</tr>
					<%
					}
					%>
					</tbody>
				</table>
				<a href="add.jsp" class="button">입력</a>
			</div>
		</div>
		<div class="row" id="footer">
			<div class="grid12">&copy;Copyright by bitacademy co.ltd. All
				rights reserved.</div>
		</div>
	</div>
</body>
</html>