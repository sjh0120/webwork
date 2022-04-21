<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<table width="800" align="center">
		<tr>
			<td colspan="5"><img src="imgs/logo.jpg"></td>
		</tr>
		<tr>
			<td bgcolor="gray"></td>
			<td bgcolor="gray" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
			<td bgcolor="gray"></td>
		</tr>
		<tr>
			<td colspan="5">
			<!-- content start -->
			<!-- http/1.1 GET, POST -->
			
			<!-- 
			GET -> 주소창의 쿼리문을 통해 전달
			POST -> 문서의 헤더부분에 필요한 정보를 담아서 숨겨서 전달
			=> 브라우저만 가지고는 접근할 수 없는 방식이다!
			-->
			<%
			int deptno=Integer.parseInt(request.getParameter("deptno"));
			if(request.getMethod().equals("POST")){
				MongoClient client=null;
				
				try{
					client=new MongoClient("127.0.0.1",27017);
					
					client.getDB("testDB")
						.getCollection("dept02")
							.remove(new BasicDBObject("_id",deptno));
					
				}catch(Exception e){
					
				}finally{
					
				}
				response.sendRedirect("list.jsp");
			}
			
			%>
			<h1><%=deptno %>번을 삭제하시겠습니까?</h1>
			<form action="" method="post">
				<input type="hidden" name="deptno" value="<%=deptno %>">
				<input type="submit" value="삭 제">
			</form>
			<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com</td>
		</tr>
	</table>
</body>
</html>