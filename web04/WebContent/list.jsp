<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.*"%>
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
				<h1>List Page</h1>
				<table border="1" width="80%" align="center">
					<tr>
						<!-- 강사님 코드 -->
						<td width="100"><a href="list.jsp?by=_id">deptno</a></td>
						<td width="50%"><a href="list.jsp?by=dname">dname</a></td>
						<td><a href="list.jsp?by=loc">loc</a></td>
						<!-- 내코드<td width="50%"><a href="list.jsp?sort=dname">dname</a></td>
						<td><a href="list.jsp?sort=loc">loc</a></td> -->
					</tr>
					<%
					String ip = "127.0.0.1";
					int port = 27017;

					MongoClient client = new MongoClient(new ServerAddress(ip, port));
					//java.util.List<String> names=client.getDatabaseNames();
					//for(int i=0; i<names.size(); i++){
					//	System.out.println(names.get(i));
					//}
					DB db = client.getDB("testDB");
					//java.util.Set<String> colls=db.getCollectionNames();
					//Iterator ite=colls.iterator();
					//while(ite.hasNext()){
					//	System.out.println(ite.next());
					//	
					//}
					DBCollection coll = db.getCollection("dept02");
					
					//강사님 코드
					String keyword=request.getParameter("keyword");
					if(keyword==null) keyword="";
					String by=request.getParameter("by");
					if(by==null) by="_id";
					BasicDBObject orderby=new BasicDBObject(by,1);		
					
					BasicDBObject doc=new BasicDBObject("dname", new BasicDBObject("$regex",keyword));
					
					DBCursor cursor= coll.find(doc).sort(orderby);
					
					
					/* 내 코드
					
					DBCursor cursor= coll.find().sort(new BasicDBObject("_id",1));//ResultSet과 같은 거인듯;
					
					String sort="";
					String param=request.getParameter("sort");
					if(param!=null){
						if(param.equals("dname")){
							cursor = coll.find().sort(new BasicDBObject("dname", 1));
						}else if(param.equals("loc")){
							cursor = coll.find().sort(new BasicDBObject("loc", 1));
						}
					}
					*/
					
					
					while (cursor.hasNext()) {
						DBObject obj = cursor.next();
						 out.println("<tr>");
		                  out.print("<td><a href=\"dept.jsp?deptno=" +obj.get("_id")
		                           + "\">" + obj.get("_id") + "</a></td>");
		                  out.print("<td><a href=\"dept.jsp?deptno=" +obj.get("_id")
		                           + "\">" + obj.get("dname") + "</a></td>");
		                  out.println("<td><a href=\"dept.jsp?deptno=" +obj.get("_id")
		                           + "\">" + obj.get("loc") + "</a></td>");
		                  out.println("</tr>");
					}
					client.close();
					%>
				</table> 
				<p align="center">
					<a href="add.jsp">[입 력]</a>
					<a href="search.jsp">[검 색]</a>
					<form>
					<input type="text" name="keyword">
					<input type="submit" value="검 색">
					</form>
				</p>
				<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by
				bitacademy co.ltd. All rights reserved. http://www.bitacademy.com</td>
		</tr>
	</table>
</body>
</html>