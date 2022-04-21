<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Properties info=System.getProperties();
Set<Map.Entry<Object, Object>> set=info.entrySet();
Iterator<Map.Entry<Object,Object>> ite=set.iterator();
while(ite.hasNext()){
	Map.Entry<Object,Object> entry=ite.next();
	System.out.println(entry.getKey()+"!@#$"+entry.getValue());
}
%>
	<p>
		<a href="index.jsp">[HOME]</a>
		<a href="dept.jsp">[DEPT]</a>
		<a href="emp.jsp">[E M P]</a>
	</p>
	<h1>사원관리 프로그램(ver 0.1.0)</h1>
	<p>사원 등록과 부서배정을 할 수 있는 프로그램입니다</p>
</body>
</html>