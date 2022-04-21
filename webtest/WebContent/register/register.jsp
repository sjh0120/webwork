<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		<a href="index.jsp">[HOME]</a>
	</p>
	<h1>학생 회원가입 페이지입니다</h1>
	
	<form action=registerCh.jsp>
		<table>
			<tr>
				<td> 이름 </td>
				<td><input type="text" name="name" ></td>
			</tr>
			<tr>
				<td> ID </td>
				<td><input type="text" name="id" ></td>
			</tr>
			<tr>
				<td> PW </td>
				<td><input type="text" name="pw" ></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>