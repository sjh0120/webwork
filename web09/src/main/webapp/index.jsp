 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/mygrid.css">
	<style rel="stylesheet" type="text/css">
	
	#header{
	}
	#header h1{
		height:42px;
		background-image: url("imgs/logo.jpg");
		background-repeat: no-repeat;
		text-indent: -9999px
	}
	#menu{
		text-align: center;
		background-color: gray;
	}
	#menu a{
		color : white;
		text-decoration: none;
		display: block;
		height: 35px;
		line-height: 32px;
	}
	#menu a:hover{
		border-bottom: 5px solid black;
		border-top: 5px solid black;
		box-sizing: border-box;
	}
	#bx{
		width:800px;
		margin:10px auto;
		position: relative;
	}
	#bx img{
		width:800px
	}
	#bx a{
		display: inline-block;
		position: absolute;
		top: 17px;
		height:220px;
		width: 100px;
		background-color:black;
		opacity:0.4;
		color:white;
		line-height:200px;
		text-decoration: none;
		font-weight:bold;
		font-size: 100px;
		text-align: center;
	}
	#bx a:last-child{
		left:700px;
	}
	#footer{
		padding-top:100px;
		padding-left: 200px;
	}
	#list-group{
		width:80%;
		margin:0px auto;
		border-radius:10px;
		border: 1px solid gray;
	}
	#list-group>*{
		padding: 20px;
	}
	#list-group>*:not(:last-child){
		border-bottom: 1px solid gray;
	}
	#list-group>*:first-child{
		background-color: aqua;
		border-radius: 10px 10px 0px 0px;
	}
	#list-group>*:last-child{
		border-radius: 0px 0px 10px 10px;
	}
	#popup{
		position: absolute;
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
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
	<script type="text/javascript">
	$(function(){
		// 이벤트 callback
		var delEvent=function(e){
			e.preventDefault();
			delOne($(e.target).parent().parent().find('[type=number]').val());
		}
		var addEvent=function(e){
			var param=$(e.target).serialize();
			addList(param);
			return false;
		};
		var editEvent=function(e){
			var param=$(e.target).serialize();
			editOne(param);
			$(e.target).off('submit',editEvent).on('submit',detailEvent);
			return false;
		};
		var detailEvent=function(e){
			$(e.target).prev().text('수정페이지');
			$(e.target).find('button').eq(1).text('취소').off('click',delEvent);
			$(e.target).find('input').each(function(idx,ele){
				if(idx!=0) $(ele).removeProp('readonly');
			});
			$(e.target).off('submit',detailEvent).on('submit',editEvent);
			return false;
		}
		var menu1Click=function(){
			$('#content>.row').hide().eq(0).show();
			return false;
		};
		var menu2Click=function(){
			$('#content>.row').hide().eq(1).show();
			return false;
		};
		var menu3Click=function(){
			$('#content>.row').hide().eq(2).show();
			getList();
			return false;
		};
		
		
		// ajax
		var delOne=function(param){
			$.post('bbs/delete.jsp','empno='+param,function(){
				$('#menu a').eq(2).click();
				$('#popup').click();
			});
		};
		var editOne=function(param){
			$.ajax({
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
		};
		var getOne=function(empno){
			$('#popup').find('h2').text('상세페이지');
			$('#popup').find('button')
							.first().text('수정')
							.next().text('삭제').on('click',delEvent);
			$('#popup').find('input').prop('readonly',true);
			$.getJSON('bbs/detail.jsp','empno='+empno,function(data){
				$('#popup').find('input').eq(0).val(data.root[0].empno);
				$('#popup').find('input').eq(1).val(data.root[0].ename);
				$('#popup').find('input').eq(2).val(data.root[0].sal);
			});
			$('#popup form').off('submit',addEvent);
			$('#popup form').on('submit',detailEvent);
			
			$('#popup').show();
		};
		var getList=function(){
			$('#list-group').html('<div><span>ename</span></div>')
			$.getJSON('bbs/list.jsp',function(data){
				data.root.forEach(function(ele,idx){
					var alink=$('<a/>').text(ele.ename).attr('href','#');
					alink.click(function(){
						getOne(ele.empno);
						return false;
					});
					$('<div/>')
						.append(alink)
						.appendTo('#list-group');
				});
			});
		};
		var addList=function(param){
			/* $.post('bbs/insert.jsp',param,function(){
				$('#menu a').eq(2).click();
				$('#popup').click();
			}); */
			$.ajax({
				url:'bbs/insert.jsp',
				data:param,
				type:'post',
				error:function(xhr,a,b){
					$('#popup .err').remove();//여기도 넣어야할듯
					$('#popup h2').before('<div class="err">에러발생('+b+')</div>');
				},
				success:function(){
					$('#menu a').eq(2).click();
					$('#popup').click();
				}
			});
		};
		
		// 이벤트 등록
		$('#menu a')
			.first()
			.click(menu1Click)
			.end().eq(1)
			.click(menu2Click)
			.end().eq(2)
			.click(menu3Click)
		;
		$('#popup>div').click(function(e){
			e.stopPropagation();
		});
		$('#popup').add('#popup form button:eq(2)').click(function(){
			$('#popup form input').val('');
			$('#popup .err').remove();
			$('#popup').find('h2').text('입력페이지');
			$('#popup').find('button')
							.first().text('입력')
							.next().text('취소').off('click',delEvent);
			$('#popup').find('input').removeProp('readonly');
			$('#popup form').off('submit',detailEvent).on('submit',addEvent);
			$('#popup').hide();
		});
		$('#p3>a').click(function(){
			$('#popup').show();
			return false;
		});
		$('#popup form').on('submit',addEvent);
		
		// init
		$('#popup').hide();
		
		$('#bx>ul').bxSlider({
			slideWidth:800,
			minSlides:1,
			maxSlides:1,
			moveSlides:1,
			auto:true,
			pager:false,
			prevText:'<',
			nextText:'>'
		});
		$('#menu a').first().click();
	});
	
	</script>
</head>
<body>

	<div class="container">
		<div id="header" class="row">
			<div class="grid12">
				<h1>비트교육센터</h1>
			</div>
		</div>
		<div id="menu" class="row">
			<div class="grid11">
				<div class="grid2">&nbsp;</div>
				<div class="grid2"><a href="#">HOME</a></div>
				<div class="grid2"><a href="#">INTRO</a></div>
				<div class="grid2"><a href="#">BBS</a></div>
				<div class="grid2"><a href="#">LOGIN</a></div>
				<div class="grid23">&nbsp;</div>
			</div>
		</div>
		<div id="content">
			<div id="p1" class="row">
				<div id="bx">
					<ul>
						<li><img src="https://www.bitacademy.com/img/main_bn_0503.png"/></li>
						<li><img src="https://www.bitacademy.com/img/main_bn_0414_1.png"/></li>
						<li><img src="https://www.bitacademy.com/img/main_bn_0414_2.png"/></li>
						<li><img src="https://www.bitacademy.com/img/main_bn_0414_3.png"/></li>
					</ul>
				</div>
			</div>
			<div id="p2" class="row">
				<dl>
					<dt>dt1</dt>
					<dd>정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다. 대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다.</dd>
					<dt>dt2</dt>
					<dd>선거와 국민투표의 공정한 관리 및 정당에 관한 사무를 처리하기 위하여 선거관리위원회를 둔다. 대통령·국무총리·국무위원·행정각부의 장·헌법재판소 재판관·법관·중앙선거관리위원회 위원·감사원장·감사위원 기타 법률이 정한 공무원이 그 직무집행에 있어서 헌법이나 법률을 위배한 때에는 국회는 탄핵의 소추를 의결할 수 있다.</dd>
					<dt>dt3</dt>
					<dd>모든 국민은 근로의 의무를 진다. 국가는 근로의 의무의 내용과 조건을 민주주의원칙에 따라 법률로 정한다. 국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.</dd>
				</dl>
			</div>
			<div id="p3" class="row">
				<h2>리스트</h2>
				<a href="#">입력</a>
				<div id="list-group">
				
				</div>
			</div>
		</div>
		<div id="footer" class="row">
			<address>
			서울특별시 서초구 서초대로74길33 비트빌 3층
			</address>
			&copy; Copyright by bitacademy co.ltd. All rights reserved.
		</div>
	</div>
	
	<div id="popup">
		<div>
			<h2>입력 페이지</h2>
			<form action="#" method="post">
				<div>
					<label for="empno">empno</label>
					<input type="number" name="empno" id="empno"/>
				</div>
				<div>
					<label for="ename">ename</label>
					<input type="text" name="ename" id="ename"/>
				</div>
				<div>
					<label for="sal">sal</label>
					<input type="text" name="sal" id="sal"/>
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