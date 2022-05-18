<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*" %>
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
	int slidnum=Integer.parseInt(request.getParameter("current"));
	System.out.println(request.getParameter("current"));
	String sql="select * from movie_board where num="+slidnum+";";
			
	System.out.println("sql : "+sql);

	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
%>
<jsp:useBean id="moviedetail" class="com.sjh0120.cinema.MovieDto" scope="session"></jsp:useBean>
<jsp:setProperty property="movie_name" name="moviedetail"/>
<jsp:setProperty property="movie_image" name="moviedetail"/>
<jsp:setProperty property="movie_genre" name="moviedetail"/>
<jsp:setProperty property="movie_detail" name="moviedetail"/>
<%
	try{
		conn=DBServer.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			moviedetail.setMovie_name(rs.getString("movie_name"));
			moviedetail.setMovie_image(rs.getString("movie_image"));
			moviedetail.setMovie_genre(rs.getString("movie_genre"));
			moviedetail.setMovie_detail(rs.getString("movie_detail"));
			//추가
			moviedetail.setResult(rs.getInt(1)>0?true:false);
			//추가끝
		}
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
request.setAttribute("moviedetail", moviedetail);
//System.out.println(moviedetail.toString());
response.sendRedirect("../");
}
%>
</body>
</html>