<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.sjh0120.cinema.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/carditem.css">
<link rel="stylesheet" href="css/popupwindow.css">
<link rel="stylesheet" href="css/base.css">
<style rel="stylesheet" type="text/css">
/*여기부터*/
/*detail popup*/
	#detail_popup{
		position: fixed;
		left: 0px;
		top:0px;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.5);
	}
	#detail_popup>div{
		background-color: white;
		width:800px;
		height:800px;
		margin: 100px auto;
		padding: 50px;
		box-sizing:border-box;/*사이즈 고정*/
		border-radius: 20px;
	}
	
	
	#detail_popup>div>form{}
	#detail_popup>div>form>div{
		margin-bottom:10px;
		text-align: center;
	}
	#detail_popup>div>div>label{
		width:20%;
		background-color: darkgray;
	}
	#detail_popup>div>div>input{
		width:50%;
	}
	#detail_popup>div>div>button{
		
	}
	#detail_popup>div>.err{
		background-color: red;
		color: white;
		text-align: center;
		font-style:italic;
	}
	
	#detail_popup>div>div:nth-child(2){
		float: right;
	}

	#detail_popup>div>div>img{
		display: block;
		width: 200px;
	}
	 
	#detail_table{
		margin : 0px auto;
		width : 600px;
		height : 400px;
		border: 2px solid black;
		border-radius: 10px;
		padding: 0px;
		box-sizing: border-box;
		overflow:hidden;
	}
	#detail_table>*{
		text-align: center;
	}
	
	#detail_table td{
		border-bottom:1px solid black;
	}
	/*제목*/
	#detail_table tr:first-child>td:first-child{
		height: 25px;
		background-color: rgb(239,239,239);
		font-weight:bold;
	}
	#detail_table tr:nth-child(2)>td:first-child{
		height: 112.5px;
	}
	
	/*장르*/
	#detail_table tr:nth-child(3)>td:first-child{
		height: 25px;
		background-color: rgb(239,239,239);
		font-weight:bold;
	}
	#detail_table tr:nth-child(4)>td:first-child{
		height: 112.5px;
	}
	
	/*이미지*/
	#detail_table tr:nth-child(1)>td:last-child{
		border-left:1px solid black;
		width: 400px;
	}
	#detail_table tr:nth-child(1)>td:last-child>img{
		width: 200px;
	}
	
	/*줄거리*/
	#detail_table tr:nth-child(5)>td{
		height: 25px;
		background-color: rgb(239,239,239);
		font-weight:bold;
	}
	#detail_table tr:last-child>td{
		border-bottom:0px solid black;
		overflow: hidden;
	}
	#detail_table tr:last-child>td>p{
		margin: 0px;
		padding: 0px;
	}
	
	
	#detail_popup>div>button{
		display: block;
		width: 400px;
		height: 30px;
		margin: 20px auto;
		border-radius: 20px;
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

</style>
<script src="js/jquery-1.12.4.min.js"></script>
<!-- 여기로 올림 -->

<script src="js/jquery.bxslider.js"></script>


<script type="text/javascript">

var current;
var option = {
		slideMargin : 10,
		slideWidth : 300,
		minSlides : 1,
		maxSlides : 3,
		startSlide : 0,
		moveSlides : 1,
		pager : false
	//controls:false//컨트롤끄기

	};
	var slider;
	$(document).ready(function() {
		slider = $('.bxslider').bxSlider(option);
		current = slider.getCurrentSlide();
	});
	var interval;
	function slideUp() {
		$('.card_items:hover .main_block>div').animate(
				{marginTop : parseInt($('.card_items:hover .main_block>div').css('margin-top'))-10 + 'px'}
				, 100);

		//console.log($('.card_items:hover .main_block>div').css('margin-top'));
		//끝나는 위치가 제각각이네....
	}

	$(function() {
		window.addEventListener('resize', function() {
		    console.log(window.innerWidth);
		    if(window.innerWidth > 980){
				count=3;
			}else if(window.innerWidth <=980 && window.innerWidth > 700 ){
				count=2;
			}else{
				count=1;
			}
		});
		//insert
		//$('#insert_popup').hide();
		$('#insert_popup').hide();
		$('.button_zone_insert').click(function() {
			$('#insert_popup').show();
			return false;
		});
		$('#insert_popup>div').find('button').eq(2).click(function() {
			$('#insert_popup').hide();
			$('#insert_popup .err').remove();
			return false;
		});
		var addList = function(param) {
			$.ajax({
				url : 'db/insert.jsp',
				data : param,
				type : 'post',
				error : function(xhr, a, b) {
					$('#insert_popup .err').remove();
					$('#insert_popup h2').before(
							'<div class="err">공백, 중복된 이름은 입력할 수 없습니다</div>');
				},
				success : function() {
					location.reload();
				}
			});
		};
		$('#insert_popup form').on('submit', function(e) {
			var param = $(e.target).serialize();
			addList(param);
			return false;
		});

		//detail
		$('#detail_popup').hide();
		
		$('.bx-wrapper').click(function() {
			var total = slider.getSlideCount();//토탈슬라이드 갯수
			current = slider.getCurrentSlide() + 2;//현재슬라이드 번호
			if (current > total)
				current = current - total;
			
			<%-- <%
			DBcrud moviedetail2=new DBcrud();
			MovieDto moviedetail_return2=moviedetail2.detailOne(3);
			%> --%>
			
			//여기
			//var items=document.getElementById('#detail_popup');
			//$(items).show();
			//$('#detail_popup>form').nth-children(0).last().html('test');
			//$('#detail_popup').show();
			//console.log(current);//current = db순서
			//MovieDto movie=new MovieDto();
			/* DBcrud db=new DBcrud();
			movie=db.detailOne(current);
			console.log(movie.toString()); */
			//작업중
			//detail.
			
			/* $.ajax({
				type:'post',
				url:'bbs/update.jsp',
				data:param,
				error:function(a,b,c){
					console.log(b,c);
				},
				success:function(){
					$('#menu a').eq(2).click();
					$('#popup').click();
				}
			});
			 */
			$.post('db/detail.jsp','current='+current,function(){
				$('#detail_popup').show();
			});
			
			//디테일창 안에서의 html db값으로 변경 => 디테일창 완성

			return false;
		});
		$('.bx-controls-direction a').click(function() {
			event.stopImmediatePropagation();
		});
		$('#detail_popup>div').find('button').eq(0).click(function() {
			//숨기기 + 내용 비우기
			$.post('db/detailout.jsp',function(){
				$('#detail_popup').hide();
				location.reload();
			});
			//location.reload();
			//끝
			//$('#detail_popup').hide();
			return false;
		});

		//애니메이션
		var moving = $('.main_block>div').mouseover(function() {
			interval = setInterval(slideUp, 100);
		});
		$('.main_block>div').mouseout(function() {
			moving.clearQueue().stop().delay(2000);
			clearInterval(interval);
			$('.main_block>div').animate({
				marginTop : '0px'
			}, 0)
		});
	});
</script>
<script type="text/javascript">
//배경색 변경
$(window)
		.scroll(
				function() {
					// selectors
					var $window = $(window), $body = $('body'), $panel = $('.panel');

					// Change 33% earlier than scroll position so colour is there when you arrive.
					var scroll = $window.scrollTop()
							+ ($window.height() / 3);

					$panel
							.each(function() {
								var $this = $(this);

								// if position is within range of this panel.
								// So position of (position of top of div <= scroll position) && (position of bottom of div > scroll position).
								// Remember we set the scroll to 33% earlier in scroll var.
								if ($this.position().top <= scroll
										&& $this.position().top
												+ $this.height() > scroll) {

									// Remove all classes on body with color-
									$body
											.removeClass(function(index,
													css) {
												return (css
														.match(/(^|\s)color-\S+/g) || [])
														.join(' ');
											});

									// Add class of currently active div
									$body.addClass('color-'
											+ $(this).data('color'));
								}
							});

				}).scroll();
</script>
<title>Movie Theater</title>
</head>
<jsp:useBean id="moviedetail" class="com.sjh0120.cinema.MovieDto" scope="session"></jsp:useBean>
<%
	DBcrud movie=new DBcrud();
	ArrayList<MovieDto> list= movie.getList();
	%>
<body>
	<div class="panel" data-color="violet">
		<div id="intro">
			<h1>Movie Board</h1>
			<p>영화 정보를 설명해주는 사이트입니다.</p>
			<p>영화에 대한 정보는 네이버에서 가져왔습니다.</p>
			<p>출처 : &copy; <a href="https://movie.naver.com/">https://movie.naver.com/</a></p>
		</div>
	</div>
	<div class="panel" data-color="gray">
		<div class="bxslider">
		<%
		for(MovieDto movies : list){
			%>
			<div class="card_items">
				<div class="header_block">
					<h1><%=movies.getMovie_name()%></h1>
				</div>
				<div id="image_zone">
					<img src="<%=movies.getMovie_image()%>">
				</div>
				<p>장르 :<%=movies.getMovie_genre()%></p>
				<div class="main_block">
					<div class="num<%=movies.getNum()%>">
						<p>내용 :<%=movies.getMovie_detail()%></p>
					</div>
				</div>
			</div>
		<%
		}
		%>
		</div>
	</div>
	<div class="button_zone">
		<div class="button_zone_insert">
			<button>+</button>
		</div>
		<div class="button_zone_delete">
			<button>-</button>
		</div>
	</div>

	<div id="footer">
		<hr>
		영화 정보를 설명해주는 사이트입니다.<br/>
		정보 출처 : &copy; <a href="https://movie.naver.com/">https://movie.naver.com/</a>
	</div>

	<div id="insert_popup">
		<div>
			<h2>입력 페이지</h2>
			<form action="#" method="POST">
				<div id="input_box">
					<label for="movie_name">제목</label>
					<input type="text" name="movie_name" id="movie_name" />
				</div>
				<div>
					<label for="movie_image">이미지</label>
					<input type="text" name="movie_image" id="movie_image" />
				</div>
				<div>
					<label for="movie_genre">장르</label>
					<input type="text" name="movie_genre" id="movie_genre" />
				</div>
				<div>
					<label for="movie_detail">줄거리</label>
					<input type="text" name="movie_detail" id="movie_detail" />
				</div>
				<div>
					<button>입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="detail_popup">
		<div>
			<h2>상세 페이지</h2>
			<form action="#" method="POST">
			</form>
			<table id="detail_table">
			<tr>
			<td>제목</td>
			<td rowspan="4"><img src=<jsp:getProperty property="movie_image" name="moviedetail"/> /></td>
			</tr>
			<tr>
			<td><jsp:getProperty property="movie_name" name="moviedetail"/></td>
			</tr>
			<tr>
			<td>장르</td>
			</tr>
			<tr>
			<td><jsp:getProperty property="movie_genre" name="moviedetail"/></td>
			</tr>
			<tr>
			<td colspan="2">줄거리</td>
			</tr>
			<tr>
			<td colspan="2"><p><jsp:getProperty property="movie_detail" name="moviedetail"/></p></td>
			</tr>
			</table>
				<!-- <div id="namebox">
				
				</div>
				<div id="imgbox">
					
				</div>
				<div id="genrebox">
					<label for="movie_genre">장르</label>
					<input type="text" readonly="readonly" value=''/>
				</div>
				<div id="detailbox">
					<label for="movie_detail">줄거리</label>
					<input type="text" readonly="readonly" value=''/>
				</div>
				<div> -->
					<button type="button">뒤로</button>
		</div>
	</div>
</body>
</html>