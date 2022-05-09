<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/jquery.bxslider.css">
    <style rel="stylesheet" type="text/css">
    	body{
    		background-color: gray;
    	}
        .bxslider{
            margin: 0px auto;
        }
        .card_items{
            padding: 0px;
            padding-bottom: 30px;
            background-color: white;
            border: 0px solid black;
            border-radius: 8%;
            opacity: 0.5;
        }
        .card_items:hover{
            opacity: 0.9;
            background-color: green;
            color: white;
        }
        .card_items>h1{
            padding: 0px;
            margin: 0px;
            text-align: center;
        }
        .card_items>p{
            padding: 0px;
            margin-left: 10px;
        }
        
        .bx-wrapper{
            top:200px;
            margin: 0px auto;
        }
    </style>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/jquery.bxslider.js"></script>
    <script type="text/javascript">
        var option={
            slideMargin:10,
            slideWidth:600,
            minSlides:2,
            maxSlides:3,
            startSlide:0,
            moveSlides:1
        };
        $(document).ready(function(){
            $('.bxslider').bxSlider(option);
        });
    </script>
    <title>Document</title>
</head>
<body>
    <%
	Connection conn = null;
	Statement stmt = null;
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	ResultSet rs = null;
	String sql = "select * from board.notice_board";

	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "user01", "1234");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		int i=1;
	%>
    <div class="bxslider">
        <%
			while (rs.next()) {
		%>
        <div class="card_items">
        <h1>제목 : <%=rs.getString(3) %></h1>
        <img src="https://dummyimage.com/600x400/000/fff&text=image0<%=i++%>" title="imga01">
        <p>작성자 : <%=rs.getString(2) %></p>
        <p>내용 : <%=rs.getString(4) %></p>
        </div>
    <%}
	}catch (Exception e) {

	} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
	}
	%>
    </div>
</body>
</html>