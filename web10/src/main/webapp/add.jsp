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


.button{
	display: block;
	width: 80%;
	margin: 50px auto;
	height: 40px;
	text-decoration: none;
	background-color: blue;
	border-radius: 5px;
	color:white;
}

.btn {
	width: 30px;
	height: 30px;
	border: 1px solid white;
	border-radius: 4px;
	overflow: hidden;
	float: right;
	background-color: darkgray;
	
}

form{
	margin: 100px auto;
}
form>div{

}
form>div>label{
	display: block;
	width: 80%;
	margin: 0px auto;
}
form>div>input{
	display: block;
	width: 80%;
	margin: 10px auto 0px auto;
	height: 50px;
	font-size: 30pt;
}
.err{
	background-color: red;
	height: 50px;
	text-align: center;
	color:white;
}
</style>
<script type="text/javascript">
	$(function() {
		$(document).on('click','form button:eq(2)',function(){
			history.back();
		});
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
	});
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String[] param={
	request.getParameter("empno"),
	request.getParameter("ename"),
	request.getParameter("sal")
};
try{
	if("POST".equals(request.getMethod())){
		int empno=Integer.parseInt(param[0].trim());
		String ename=param[1].trim();
		int sal=Integer.parseInt(param[2].trim());
		BitEmp emp=new BitEmp();
		if(emp.insertOne(empno,ename,sal)) response.sendRedirect("list.jsp");
	}
}catch(Exception e){
	out.print("<div class=\"err\">에러발생<span class=\"btn\">x</span></div>");
}
%>
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
				<h2>입력페이지</h2>
				<form method="post">
					<div>
						<label for="empno">empno</label>
						<input type="text" name="empno" id="empno" value="<%=param[0]==null?"":param[0]%>"/>
					</div>
					<div>
						<label for="ename">ename</label>
						<input type="text" name="ename" id="ename" value="<%=param[1]==null?"":param[1]%>"/>
					</div>
					<div>
						<label for="sal">sal</label>
						<input type="text" name="sal" id="sal" value="<%=param[2]==null?"":param[2]%>"/>
					</div>
					<div>
						<button class="button">입력</button>
						<button class="button" type="reset">취소</button>
						<button class="button" type="button">뒤로</button>
					</div>
				</form>
			</div>
		</div>
		<div class="row" id="footer">
			<div class="grid12">&copy;Copyright by bitacademy co.ltd. All
				rights reserved.</div>
		</div>
	</div>
</body>
</html>