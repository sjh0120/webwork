<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="0; url=list.jsp">
<title>Insert title here</title>
</head>
<body>
	<%
	int empno = Integer.parseInt(request.getParameter("empno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	int mgr = Integer.parseInt(request.getParameter("mgr"));
	int deptno = Integer.parseInt(request.getParameter("deptno"));

	String sql = "insert into emp values (" + empno + ",'" + ename + "','" + job + "'," + mgr + ", now(),0,null," + deptno + ")";
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scott";

	Map<String, String> map = System.getenv();
	String user = map.get("MYSQL_USER") == null ? "user01" : map.get("MYSQL_USER");
	String password = map.get("MYSQL_PASSWORD") == null ? "1234" : map.get("MYSQL_PASSWORD");

	Set<String> keys = map.keySet();
	Iterator<String> ite = keys.iterator();

	Properties props = new Properties();
	props.setProperty("user", user);
	props.setProperty("password", password);

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName(driver);
		conn=DriverManager.getConnection(url,props);
		stmt=conn.createStatement();
		stmt.execute(sql);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}
	//메타태그를 이용한 리다이렉션 -> 브라우저에게 명령을 통해서 x초 뒤 페이지 새로고침
	//response를 통한 리다이렉션 -> 약속된 프로토콜을 통한
	//페이지 인포(문서 헤더정보)에 300번대를 주면서 페이지 인포의 규칙을 통해서 페이지 이동
	//몇 초뒤 새로고침을 통한 이동 x 문서 헤더정보를 통해 바로 이동하기 때문에
	//response.sendRedirect(list.jsp); ...?
	
	//잠시 페이지의 정보를 보여줬다가 이동을 하려면 메타태그를 통한 이동이 좋으며,
	//바로 이동을 할때에는 센드리다이렉션
	//+ 메타태그는 브라우저가 http 규격을 지키지 않는다면 리다이렉션을 하지 않을 수 있음
	//  그러나 센드리다이렉션은 무조건 작동을 한다
	%>

</body>
</html>