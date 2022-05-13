<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/head.jsp">
	<jsp:param value=".." name="root"/>
</jsp:include>
<style type="text/css">
	
</style>
<script type="text/javascript">
$(function(){
	$('#popup').hide();
	$('.container form').one("submit",function(e){
		$('.container form').prev().html("수정 페이지");
		$('.container form input').filter(":gt(0)").removeProp('readonly');
		$('.container form button').eq(1).text('취소').attr('type','reset').removeClass('btn-danger')
		.next().one('click',function(){
			$('.container form').prev().html("상세 페이지");
			$('.container form input').filter(":gt(0)").prop('readonly', true);
			$('.container form button').eq(1).text('삭제').attr('type','button').addClass('btn-danger');
		});
		return false;
	});
	$('#popup>div').click(function(e){
		e.stopPropagation();
	});
	$('#popup, #popup button:button').click(function(e){
		$('#popup').hide();
	});
	$('.container form button').eq(1).click(function(e){
		if($(e.target).text()=='삭제'){
			$('#popup').show();
		}
	});
});
</script>
</head>
<%@ page import="java.sql.*, com.bit.util.*" %>
<%!
Connection conn;
Statement stmt;
ResultSet rs;

%>
<jsp:useBean id="bean" class="com.bit.util.EmpDto"></jsp:useBean>
<jsp:setProperty property="empno" name="bean"/>
<jsp:setProperty property="ename" name="bean"/>
<jsp:setProperty property="sal" name="bean"/>
<%
if(request.getMethod().equals("GET")){
	String sql="select * from emp where empno="+bean.getEmpno();
	try{
		conn=DBServer.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
			bean.setEname(rs.getString("ename"));
			bean.setSal(rs.getInt("sal"));
		}
	}finally{
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
}else{
	String sql="update emp set ename='"+bean.getEname()
		+"',sal="+bean.getSal()+" where empno="+bean.getEmpno();
	try{
		conn=DBServer.getConnection();
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
	
	response.sendRedirect("./");
	return;
}
%>
<body>
<nav>
	<h1><a href="../">비트 교육센터</a></h1>
	<jsp:useBean id="login" class="com.bit.util.EmpDto" scope="session"></jsp:useBean>
	<ul>
		<li><a href="../">HOME</a></li>
		<li><a href="../intro.jsp">INTRO</a></li>
		<li><a href="./">LIST</a></li>
		<%if(login.isResult()){ %>
		<li><a href="../login/logout.jsp">LOGOUT</a></li>
		<%} else{%>
		<li><a href="../login/form.jsp">LOGIN</a></li>
		<%} %>
	</ul>
	<%if(login.isResult()){ %>
	<span><jsp:getProperty property="ename" name="login"/>님 로그인 중...</span>
	<%} %>
</nav>
<div class="container">
	<div class="row">
		<div class="grid12">
		<!-- start -->
		<h2>상세 페이지</h2>
		<form class="form-control" method="post">
			<div class="form-group">
				<label for="empno">empno</label>
				<input type="number" name="empno" id="empno" value='<jsp:getProperty property="empno" name="bean"/>' readonly="readonly"  placeholder="사번을 입력"/>
			</div>
			<div class="form-group">
				<label for="ename">ename</label>
				<input type="text" name="ename" id="ename" value='<jsp:getProperty property="ename" name="bean"/>' readonly="readonly"  placeholder="이름을 입력"/>
			</div>
			<div class="form-group">
				<label for="sal">sal</label>
				<input type="number" name="sal" id="sal" value='<jsp:getProperty property="sal" name="bean"/>' readonly="readonly"  placeholder="금액을 입력"/>
			</div>
			<div class="form-group">
				<button class="btn btn-primary">수정</button>
				<button class="btn btn-danger" type="reset">삭제</button>
				<button class="btn" type="button">뒤로</button>
			</div>
		</form>
		<!-- end -->
		</div>
	</div>
	<div class="row">
		<div id="footer" class="grid12">
		&copy; Copyright by bitacademy co.ltd. All rights reserved. http://www.bitacademy.com
		</div>
	</div>
</div>
<div id="popup">
	<div>
		<h2>삭제하시겠습니까?</h2>
		<form action="delete.jsp" method="post">
			<input type="hidden" name="empno" value='<jsp:getProperty property="empno" name="bean"/>' />
			<button class="btn btn-danger">삭제</button>
			<button class="btn" type="button">취소</button>
		</form>
	</div>
</div>
</body>
</html>