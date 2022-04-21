<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String name=request.getParameter("name");
String id=request.getParameter("id");
String pw=request.getParameter("pw");

	Connection conn=null;
	Statement stmt=null;
	String driver="com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/school";
	ResultSet rs=null;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,"user01","1234");
		String sql="select s_id from school.stuinfo";
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
			if(rs.getString(1).equals(id)){
				response.sendRedirect("regFail.jsp");
				break;
			}
			else{ 
				String sql2="insert into stuinfo(s_Name,s_id,s_pw)  values ('"+name + "','" +id+"','" +pw+"');";
				System.out.println(sql2);
				stmt.execute(sql2);
				response.sendRedirect("regSucc.jsp");
			}
		}
	}catch(Exception e){
		
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}






%>
</body>
</html>