<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적관리 사이트(ver 0.1.0)</title>
</head>
<body>
	<p>
		<a href="index.jsp">[HOME]</a>
	</p>
	<h1>학생 성적관리 사이트 입니다</h1>
	
	<form action="login/loginCh.jsp">
	<input type="radio" name="who" value="teacher" checked>선생님
	<input type="radio" name="who" value="student">학생
		<table>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="u_id"></td>
			</tr>
			<tr>
				<td>PW :</td>
				<td><input type="password" name="u_pw"></td>
			</tr>
		</table>
		<input type="submit" value="로그인">
	</form>
	<form action="register/register.jsp">
	<input type="submit" value="학생회원가입">
	</form>


</body>
</html>