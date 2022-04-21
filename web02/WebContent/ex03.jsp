<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내장객체</h1>
	<%
	//내장객체(참조변수)의 지원은 스크립트릿
	String addr = request.getRemoteAddr();
	String host = request.getRemoteHost();
	int port = request.getRemotePort();
	String url = request.getRequestURI();
	StringBuffer url2 = request.getRequestURL();
	out.println(addr);
	//접속한 사람의 ip가 아닌 자기자신의 ip만 나옴
	//강사님 사이트에 접속해도 나한테는 내 ip만 나옴!
	out.println("<br>");
	out.println(host);
	out.println("<br>");
	out.println(port);
	//브라우저가 사용하는 포트 8080아님!
	//뒤의 사용하지 않는 포트번호를 랜덤으로 사용 -> 브라우저마다 다름!
	out.println("<br>");
	out.println(url);
	out.println("<br>");
	out.println(url2);
	out.println("<br>");
	
	%>
</body>
</html>