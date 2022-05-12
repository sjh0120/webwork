<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.bit.module01.mysql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@ include file="template/head.jspf"%>
<style type="text/css">
	body{
		margin: 0px;
		padding: 0px;
	}
	nav{
		background-color:gray;
		overflow: hidden;
	}
	nav>ul{
		list-style: none;
		padding:0px;
		margin: 0px;
	}
	nav>ul>li{
		display: inline-block;
		width: 100px;
	}
	nav>ul>li>a{
		display: block;
		height:40px;
		color:white;
		text-decoration: none;
		text-align: center;
		line-height: 20px;
	}
	
	.row img{
		width:100%;
	}
	.btn{
		/*position:relative;*/
		width: 30px;
		height:30px;
		border: 1px solid white;
		border-radius: 4px;
		overflow: hidden;
		float:right;
		background-color:darkgray;
	}
	.btn>span{
		border: 0px solid white;
		width: 20px;
		display: inline-block;
		position: relative;
	}
	.btn>span:nth-child(2){
		top:-10px;
	}
	.btn>span:nth-child(3){
		top:-30px;
	}
	
</style>
<script type="text/javascript">

	$(function(){
		$('<div class="btn"/>')
			.append('<span></span>')
			.append('<span></span>')
			.append('<span></span>')
			.appendTo('nav')
			.click(function(){
				$('nav>ul>li').toggle();
			})
		;
		$(window).on('resize',function(){
			if($('nav').width()<600){
				$('.btn').show();
				$('nav>ul>li').css('display','block').hide();
			}else{
				$('.btn').hide();
				$('nav>ul>li').css('display','inline-block');
			}
		});
	});
	$(function(){
		if($('nav').width()<600){
			$('.btn').show();
			$('nav>ul>li').css('display','block').hide();
		}else{
			$('.btn').hide();
			$('nav>ul>li').css('display','inline-block');
		}
	});
</script>
</head>
<body>
	<nav>
		<ul>
			<li><a href="index.jsp">HOME</a></li>
			<li><a href="list.jsp">EMP</a></li>
			<li><a href="#">DEPT</a></li>
			<li><a href="#">ETC</a></li>
		</ul>
	</nav>
	<div class="container">
		<div class="row">
			<div class="grid12">
			<img alt="" src="imgs/index.png"/>
			</div>
		</div>
		<div class="row" id="footer">
			<div class="grid12">
			&copy;Copyright by bitacademy co.ltd. All rights reserved.
			</div>
		</div>
	</div>
</body>
</html>