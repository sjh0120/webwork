<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.util.Map.Entry" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>파라미터 값 파싱</h1>
	<!-- /web02/ex04.jsp?id=asdf&password=1234 -->
	<!-- /web02/ex04.jsp?items=itm1&items=itm2&items=itm3 -->
	<p>id:<%=request.getParameter("id")%></p>
	<p>name:<%=request.getParameter("name")%></p>
	<p>pw:<%=request.getParameter("password")%></p>
	<p>item:<%=request.getParameter("items")%></p>
	<p>item:<%=java.util.Arrays.toString(request.getParameterValues("items"))%></p>
	<%
	String[] arr1 = request.getParameterValues("items");
	arr1 = new String[] {};
	for (int i = 0; i < arr1.length; i++) {
	%>
	<p>item<%=i + 1%>:<%=arr1[i]%></p>
	<%}%>
	<%
	System.out.println(request.getRemoteAddr());
	java.util.Enumeration<String> enu = request.getParameterNames();
	while (enu.hasMoreElements()){
		String paramName=enu.nextElement();
		String[] params=request.getParameterValues(paramName);
		for(int i=0; i<params.length; i++){
			System.out.println(paramName+"="+params[i]);
		}
	}
	System.out.println("-----------------------");
	java.util.Map<String,String[]> paramMap=request.getParameterMap();
	Set<Entry<String,String[]>> entrys=paramMap.entrySet();
	Iterator<Entry<String, String[]>> ite=entrys.iterator();
	while(ite.hasNext()){
		Entry<String,String[]> entry=ite.next();
		String key=entry.getKey();
		String[] val=entry.getValue();
		for(int i=0; i<val.length; i++){
			System.out.println(key+":"+val[i]);
		}
	}
	%>
	<p></p>
	<p></p>
	<p></p>

</body>
</html>