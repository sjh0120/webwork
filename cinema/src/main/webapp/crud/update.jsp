<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, com.sjh0120.cinema.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/crudupdate.css"/>
<style rel="stylesheet" type="text/css">
body{
background-color: rgba(32, 33, 36, 0.6);
}
</style>
<script type="text/javascript">
$(function() {
	var updateOne = function(param) {
		$.ajax({
			url : 'update2.jsp',
			data : param,
			type : 'post',
			error : function(xhr, a, b) {
				/* $('#insert_popup .err').remove();
				$('#insert_popup h2').before(
						'<div class="err">공백, 중복된 이름은 입력할 수 없습니다</div>'); */
			},
			success : function() {
				location.href="./list.jsp";
			}
		});
	};
	$('.container form').on('submit', function(e) {
		/* $('.container .err').remove(); */
		var param = $(e.target).serialize();
		console.log(e.target);
		updateOne(param);
		
		return false;
	});
});
</script>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num").trim());
DBcrud movie = new DBcrud();
MovieDto moviedetail = movie.detailOne(num);
%>
	<div class="container">
		<h2>영화 정보 수정</h2>
		<form action="#">
		<table class="detailtable">
			<tr>
				<td><input type="text" name="num" id="num" value=<%=moviedetail.getNum() %> readonly="readonly"></td>
				<td><%=moviedetail.getMovie_name() %></td>
			</tr>
			<tr>
				<td colspan="2">이미지</td>
			</tr>
			<tr>
				<td>기존</td>
				<td><%=moviedetail.getMovie_image() %></td>
			</tr>
			<tr>
				<td>수정</td>
				<td><input type="text" name="movie_image" id="movie_image" /></td>
			</tr>
			<tr>
				<td colspan="2">장르</td>
			</tr>
			<tr>
				<td>기존</td>
				<td><%=moviedetail.getMovie_genre() %></td>
			</tr>
			<tr>
				<td>수정</td>
				<td><input type="text" name="movie_genre" id="movie_genre" /></td>
			</tr>
			<tr>
				<td colspan="2">줄거리</td>
			</tr>
			<tr>
				<td>기존</td>
				<td><%=moviedetail.getMovie_detail() %></td>
			</tr>
			<tr>
				<td>수정</td>
				<td><input type="text" name="movie_detail" id="movie_detail" /></td>
			</tr>
		</table>
		<button id="btn">수정완료</button>
		</form>
		<button id="btn"><a href="./list.jsp">취소</a></button>
	</div>

</body>
</html>
