<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<style rel="stylesheet" type="text/css">
	.navbar-header{
		overflow: hidden;
	}

</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$('button[type=button]').click(function(){
		history.back();
	});
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="../">
								<img alt="Brand" src="../imgs/logo.jpg">
							</a>
						</div>
						<p class="navbar-text">
							<a href="../emp/list.html" class="btn btn-default">EMP</a>
							<a href="../dept/list.html" class="btn btn-default">DEPT</a>
						</p>
						<p class="navbar-text navbar-right">
							<% if(session.getAttribute("result")!=null) {
								out.print(session.getAttribute("id").toString()+"님 로그인 중...");
							%>
							<a href="../login/index.html">LOGOUT</a>
							<%}else{ %>
							<a href="../login/index.html">LOGIN</a>
							<%} %>
						</p>
					</div>
				</nav>
			</div>
		</div>
		<div id="content" class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h1>EMP Detail Page <small>상세보기</small></h1>
				</div>
				<%
					com.bit.model.EmpDto bean=(com.bit.model.EmpDto)request.getAttribute("emp");
				%>
				<form method="post">
				  <div class="form-group">
				    <label for="empno">empno</label>
				    <input type="text" class="form-control" id="empno" name="empno" value="<%=bean.getEmpno() %>" placeholder="empno" readonly="readonly">
				  </div>
				  <div class="form-group">
				    <label for="ename">ename</label>
				    <input type="text" class="form-control" id="ename" name="ename" value="<%=bean.getEname() %>" placeholder="ename" readonly="readonly">
				  </div>
				  <div class="form-group">
				    <label for="sal">sal</label>
				    <input type="text" class="form-control" id="sal" name="sal" value="<%=bean.getSal() %>" placeholder="sal" readonly="readonly">
				  </div>
				  <div class="form-group">
				    <label for="hiredate">hiredate</label>
				    <input type="text" class="form-control" id="hiredate" name="hiredate" value="<%=bean.getHiredate() %>" placeholder="hiredate" readonly="readonly">
				  </div>
				  <div class="form-group">
				    <label for="job">job</label>
				    <input type="text" class="form-control" id="job" name="job" value="<%=bean.getJob() %>" placeholder="job" readonly="readonly">
				  </div>
				  <a href="edit.html?idx=<%=bean.getEmpno() %>" role="button" class="btn btn-primary btn-block">수정</a>
				  <a href="delete.html?idx=<%=bean.getEmpno() %>" role="button" class="btn btn-danger btn-block">삭제</a>
				  <button type="button" class="btn btn-default btn-block">뒤로</button>
				</form>
			</div>
		</div>
		<div id="footer" class="row">
			<div class="col-md-12">
			<address>
 			<strong>&copy; by bitacademy co.ltd. All rights reserved.</strong><br>
  			서울특별시 서초구 서초대로74길33 비트빌 3층<br>
  			<abbr title="Phone">P:</abbr> 02-3486-3456
			</address>
			</div>
		</div>

	</div>
</body>
</html>