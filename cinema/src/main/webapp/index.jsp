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
<script src="js/jquery.bxslider.js"></script>
<script type="text/javascript">
	var option = {
		slideMargin : 10,
		slideWidth : 300,
		minSlides : 2,
		maxSlides : 3,
		startSlide : 0,
		moveSlides : 1,
		pager : false
	//controls:false//컨트롤끄기

	};
	var slider;
	$(document).ready(function() {
		slider = $('.bxslider').bxSlider(option);
		var current = slider.getCurrentSlide();
	});
	var interval;
	function slideUp() {
		$('.card_items:hover .main_block>div').animate(
				{marginTop : parseInt($('.card_items:hover .main_block>div').css('margin-top'))-10 + 'px'}
				, 100);

		//console.log($('.card_items:hover .main_block>div').css('margin-top'));
		//끝나는 위치가 제각각이네....
	}

	//여기
	MovieDto movie=new MovieDto();
	DBcrud db=new DBcrud();
	//끝
	
	$(function() {
		//insert
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
			var current = slider.getCurrentSlide() + 2;//현재슬라이드 번호
			if (current > total)
				current = current - total;
			console.log(current);//current = db순서
			movie=db.detailOne(current);
			console.log(movie.toString());
			//MovieDto movie=new MovieDto();
			/* DBcrud db=new DBcrud();
			movie=db.detailOne(current);
			console.log(movie.toString()); */
			//작업중
			//detail.
			$('#detail_popup').show();
			//디테일창 안에서의 html db값으로 변경 => 디테일창 완성

			return false;
		});
		$('.bx-controls-direction a').click(function() {
			event.stopImmediatePropagation();
		});
		$('#detail_popup>div').find('button').eq(0).click(function() {
			$('#detail_popup').hide();
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
<title>Document</title>
</head>
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
	
	<%
	DBcrud movie=new DBcrud();
	ArrayList<MovieDto> list= movie.getList();%>
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
		영화 정보를 설명해주는 사이트입니다.<br /> 정보 출처 : &copy; <a
			href="https://movie.naver.com/">https://movie.naver.com/</a>
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
				<div id="input_box">
					<label for="movie_name">제목</label>
				</div>
				<div>
					<label for="movie_image">이미지</label>
				</div>
				<div>
					<label for="movie_genre">장르</label>
				</div>
				<div>
					<label for="movie_detail">줄거리</label>
				</div>
				<div>
					<button type="button">뒤로</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>