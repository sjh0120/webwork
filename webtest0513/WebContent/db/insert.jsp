<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println(request.getMethod());
request.setCharacterEncoding("utf-8");
if(request.getMethod().equals("POST")){
	String[] params={
			request.getParameter("movie_name")
			,request.getParameter("movie_image")
			,request.getParameter("movie_genre")
			,request.getParameter("movie_detail")
		};
		String movieName=params[0];
		String movieImage=params[1];
		String movieGenre=params[2];
		String movieDetail=params[3];
		
		String sql="insert into movie_board (movie_name,movie_image,movie_genre,movie_detail) values ('"
			+movieName+"','"+movieImage+"','"+movieGenre+"','"+movieDetail+"')";
			
		System.out.println("sql : "+sql);

		String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/board";
		String user="user01";
		String password="1234";

		Class.forName(driver);

		Connection conn=null;
		Statement stmt=null;

		try{
			if(request.getMethod().equals("POST")){
				conn=DriverManager.getConnection(url,user,password);
				stmt=conn.createStatement();
				stmt.executeUpdate(sql);
			}
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
}


%>
</body>
</html>