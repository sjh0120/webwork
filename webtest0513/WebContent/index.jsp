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
    /*팝업css*/
    #popup{
		position: fixed;
		left: 0px;
		top:0px;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.5);
	}
	#popup>div{
		background-color: white;
		width:400px;
		height:400px;
		margin: 100px auto;
		padding: 50px;
		box-sizing:border-box;/*사이즈 고정*/
		border-radius: 20px;
	}
	#popup>div>form{}
	#popup>div>form>div{
		margin-bottom:10px;
		text-align: center;
	}
	#popup>div>form>div>label{
		display:inline-block;
		width:40%;
		background-color: darkgray;
	}
	#popup>div>form>div>input{
		width:50%;
	}
	#popup>div>form>div>button{
		
	}
	#popup>div>.err{
		background-color: red;
		color: white;
		text-align: center;
		font-style:italic;
	}
    </style>
    <style rel="stylesheet" type="text/css">
    	body{
    		transition: background-color 1s ease;
    	}
        .bxslider{
        	padding-top:10px;
            padding-bottom:10px;
            margin: 0px auto;
            
        }
        /*여기부터*/
        .card_items{
        	display:block;
            padding: 0px;
            padding-bottom: 0px;
            border: 0px solid black;
            border-radius: 13px 13px 13px 13px;
            opacity: 0.5;
            height:698px;
        }
        .card_items:hover{
            opacity: 0.9;
            background-color: rgb(230,230,230);
        }
        .card_items:hover .main_block>div>p{
        	color: red;
        }
        .card_items>.header_block{
        	display:block;
        	padding:0px;
            margin: 0px;
            height:100px;
            border:1px solid gray;
        	border-radius: 15px;
        }
        .card_items>div>h1{
        	text-align: center;
        	margin-top: 5px;
        	margin-left: 5px;
        	margin-right: 5px;
        	
        }
        .main_block{
        	
        }
        .bx-viewport{
        	margin-bottom:10px;
        }
        .card_items>.main_block{
        	display:block;
        	height:110px;
        	margin-bottom:0px;
        	overflow:hidden;
        	border:1px solid gray;
        	border-radius: 15px;
        }
        .card_items>.main_block>div>p{
        	display:block;
        	padding: 0px;
            margin-left: 10px;
            margin-right: 10px;
            margin-top:5px;
            margin-bottom:0px;
            height: 90px;
        }
        .card_items>p{
            padding: 0px;
            margin-top:5px;
            margin-bottom:5px;
            padding-left: 20px;
            border:1px solid gray;
        	border-radius: 15px;
        }
        .card_items>img{
        	padding-top:10px;
        	width:300px;
        }
        /*여기까지*/
        /*
        .bx-controls-direction a{
        	display: inline-block;
			position: absolute;
			top: 18px;
			height:550px;
			width: 250px;
			background-color:rgba(0,0,0,0.5);
			color:rgba(0,0,0,0.4);
			font-size:20pt;
			text-decoration: none;
			line-height: 700px;
			text-align:center;
        }
        .bx-controls-direction a:last-child{
			left:670px;
		}*/
        .bx-wrapper{
        	top:100px;
            margin: 0px auto;
            width:930px;
            height:720px;
        }
        .button_zone{
        	display:block;
        	width:50px;
        	height:100px;
        	position:fixed;
        	top: 40%;
        	left: 90%;
        	background-color: rgb(220,220,220);
        	border: 0.5px solid black;
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
        	border-radius: 40%;
        	border : 0.3px solid black;
        }
        .button_zone>.button_zone_delete>button{
        	display:block;
        	width:49px;
        	height:49px;
        	font-size:25px;
        	border-radius: 40%;
        	border : 0.3px solid black;
        }
        .panel {
		  /* min height incase content is higher than window height */
		  min-height: 1000px;
		  display: flex;
		  justify-content: space-around;
		  align-items: center;
		  /* outline: 10px solid hotpink; */
		  /* turn above on to see the edge of panels */
		}
		
		.color-violet {
		  background-color: rgba(122,78,171,0.8);
		}
		.color-gray {
		  background-color: rgba(10,10,10,0.5);
		}
		
		#footer{
			
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
            moveSlides:1,
            pager:false
            //controls:false//컨트롤끄기
            
        };
        $(document).ready(function(){
            $('.bxslider').bxSlider(option);
        });
        var interval;
        function slideUp(){
        	$('.card_items:hover .main_block>div')
			.animate({marginTop:parseInt($('.card_items:hover .main_block>div').css('margin-top'))-10+'px'},100);
        	
        	console.log($('.card_items:hover .main_block>div').css('margin-top'));
        	//끝나는 위치가 제각각이네....
        }
        
        $(function(){
        	//팝업메뉴
        	$('#popup').hide();
        	$('.button_zone_insert').click(function(){
    			$('#popup').show();
    			return false;
    		});
        	 $('#popup>div').find('button').eq(2).click(function(){
        		$('#popup').hide();
    			return false;
        	
        	}); 
        	var addEvent=function(e){
    			var param=$(e.target).serialize();
    			addList(param);
    			return false;
    		};
    		
    		var addList=function(param){
    			/* $.post('bbs/insert.jsp',param,function(){
    				$('#menu a').eq(2).click();
    				$('#popup').click();
    			}); */
    			$.ajax({
    				url:'db/insert.jsp',
    				data:param,
    				type:'post',
    				error:function(xhr,a,b){
    					console.log(param);
    					//$('#popup .err').remove();//여기도 넣어야할듯
    					//$('#popup h2').before('<div class="err">에러발생('+b+')</div>');
    				},
    				success:function(){
    					//$('#menu a').eq(2).click();
    					//$('#popup').click();
    				}
    			});
    		};
    		$('#popup form').on('submit',addEvent);
        	
        	
        	//애니메이션
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
    <script type="text/javascript">
    //배경색 변경
    $(window).scroll(function() {
    	  
    	  // selectors
    	  var $window = $(window),
    	      $body = $('body'),
    	      $panel = $('.panel');
    	  
    	  // Change 33% earlier than scroll position so colour is there when you arrive.
    	  var scroll = $window.scrollTop() + ($window.height() / 3);
    	 
    	  $panel.each(function () {
    	    var $this = $(this);
    	    
    	    // if position is within range of this panel.
    	    // So position of (position of top of div <= scroll position) && (position of bottom of div > scroll position).
    	    // Remember we set the scroll to 33% earlier in scroll var.
    	    if ($this.position().top <= scroll && $this.position().top + $this.height() > scroll) {
    	          
    	      // Remove all classes on body with color-
    	      $body.removeClass(function (index, css) {
    	        return (css.match (/(^|\s)color-\S+/g) || []).join(' ');
    	      });
    	       
    	      // Add class of currently active div
    	      $body.addClass('color-' + $(this).data('color'));
    	    }
    	  });    
    	  
    	}).scroll();
    
    </script>
    <title>Document</title>
</head>
<body>
	<div class="panel" data-color="violet">
	    <div>
	      <h1>Magic scrolling colours</h1>
	      <p>Scroll to animate the background colour of the body as a full height panel becomes visible.</p>
	      <p>I have tried to comment the code, particurly the JavaScript, as much as possible. I hope it's clear to understand.</p>
	      <p>If you have any questions my twitter is <a href="https://twitter.com/daveredfern">@daveredfern</a>.</p>
	  </div>
	</div>
	<div class="panel"  data-color="gray">
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
   
    </div>
    <div class="button_zone">
    	<div class="button_zone_insert"><button>+</button></div>
    	<div class="button_zone_delete"><button>-</button></div>
    </div>
    
    <div id="footer">
    <address>
			서울특별시 서초구 서초대로74길33 비트빌 3층
			</address>
			&copy; Copyright by bitacademy co.ltd. All rights reserved.
    </div>
    
    <div id="popup">
		<div>
			<h2>입력 페이지</h2>
			<form action="#" method="post">
				<div>
					<label for="movie_name">제목</label>
					<input type="text" name="movie_name" id="movie_name"/>
				</div>
				<div>
					<label for="movie_image">이미지</label>
					<input type="text" name="movie_image" id="movie_image"/>
				</div>
				<div>
					<label for="movie_genre">장르</label>
					<input type="text" name="movie_genre" id="movie_genre"/>
				</div>
				<div>
					<label for="movie_detail">줄거리</label>
					<input type="text" name="movie_detail" id="movie_detail"/>
				</div>
				<div>
					<button>입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>