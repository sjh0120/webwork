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
    <link rel="stylesheet" href="css/carditem.css">
    <style rel="stylesheet" type="text/css">
    	body{
    		background-color: gray;
    	}
        .bxslider{
            margin: 0px auto;
        }
        .bx-wrapper{
            top:200px;
            margin: 0px auto;
            width:930px;
            height:730px;
        }
        .button_zone{
        	display:block;
        	width:50px;
        	height:100px;
        	position:fixed;
        	top: 40%;
        	left: 90%;
        	background-color: rgb(220,220,220);
        	border-radius: 20%;
        }
        .button_zone>.button_zone_insert, .button_zone>.button_zone_delete{
        	padding:0px;
        	margin:0px;
        	display:block;
        	width:50px;
        	height:50px;
        }
        .button_zone>.button_zone_insert>button{
        	display:block;
        	width:49px;
        	height:49px;
        	font-size:25px;
        	border:0.5px solid rgb(250,250,250);
        	border-radius: 40%
        }
        .button_zone>.button_zone_delete>button{
        	display:block;
        	width:49px;
        	height:49px;
        	font-size:25px;
        	border:0.5px solid rgb(250,250,250);
        	border-radius: 40%
        }
        
    </style>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/jquery.bxslider.js"></script>
    <script type="text/javascript">
        var option={
            slideMargin:10,
            slideWidth:300,
            minSlides:2,
            maxSlides:3,
            startSlide:0,
            moveSlides:1
        };
        $(document).ready(function(){
            $('.bxslider').bxSlider(option);
        });
        var interval;
        function slideUp(){
        	$('.card_items:hover .main_block>div')
			.animate({marginTop:parseInt($('.card_items:hover .main_block>div').css('margin-top'))-10+'px'},100);
        	//console.log($('.card_items:hover .main_block>div').css('margin-top'));
        	//끝나는 위치가 제각각이네....
        }
        
        $(function(){
        	var moving=$('.main_block>div').mouseover(function(){
        		interval=setInterval(slideUp,100);
        	});
        	$('.main_block>div').mouseout(function(){
            		moving.clearQueue().stop().delay(2000);
            		clearInterval(interval);
            		$('.main_block>div')
            			.animate({marginTop:'0px'},0)
            });
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
	String sql = "select * from board.movie_board";

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
        <div class="header_block"><h1><%=rs.getString(2) %></h1></div>
        <img src=<%=rs.getString(3) %>" title="imga01">
        <p>장르 : <%=rs.getString(4) %></p>
        <div class="main_block"><div class="num<%=rs.getInt(1)%>"><p>내용 : <%=rs.getString(5) %></p></div></div>
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
    
    <div class="button_zone">
    	<div class="button_zone_insert"><button>+</button></div>
    	<div class="button_zone_delete"><button>-</button></div>
    </div>
</body>
</html>