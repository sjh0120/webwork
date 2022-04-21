<%@ page info="out class" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"
	info="new Date()를 하기위해 import가 필요하기 때문에! + 어시스트가 제대로 작동하지 않기 때문에 와일드 처리를 많이함!"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% //스크립트릿 - 자바코드 => in main이라는 말!
	//public void func(){}  -> 자바를 돌리는 곳이지만 안됨!
%>



<%!//선언부 - 메서드 정의 부분 - in class, out main
	int su = 1234;
	/*
	int su;
	su=1234; => 안됨!
	*/
	
	//선언부에서 변수의 선언의 경우 private를 해두는 것이 좋다!
	/*이유
	어짜피 모두가 하나의 자바파일을 통해 생성되는 클래스 이기 때문에 접근제한자가 딱히 의미가 없음
	따라서 선언부를 통해 선언한 변수는 전역변수가 되는데, 이는 나중에 실행부를 통해 전역변수의 값이 출력되어진다
	근데 만약 이 전역변수가 비밀번호라면...? => 문제가 생김!
	따라서 jsp에 있어 선언부에서의 변수선언은 되도록이면
	접근제한자 private를 통해 실행부에서 변수의 값을 출력하지 못하도록 하는 것이 좋다!
	*/

	//내부 클래스 가능!
	static class Inner1 {
	}

	class Inner2 {
	}

	//선언부 - 메서드 정의 부분! -> 선언부는 아무곳에 들어가도됨!
	public static Date func() {
		return new Date();
		//스크립트릿에서만 내장객체를 지원하기 때문에
		//out.println("화면에..."); -> 안됨!
		//return을 통해서 값을 전달해주고 
		//선언부가 아닌 표현식을 통해서만 출력이 가능하다
	}

	//사용하는 사람마다 다르기 때문에 되도록이면 모아두는 것이 보기 좋음!
	public static void func1() {
	}
	//다중 선언 또한 가능!%>
<body>
	<h1>jsp 페이지</h1>
	<%=1 + 2 + 3 + 4 + 6%>
	<%=new Date()/*하려면 자바에서 import가 필요!*/ %>
	<%
		/*public void func(){} 안됨 선언부에 해야함!*/
	%>
	<%=func()%>

	<!-- 내부 클래스 사용 -->
	<%=new Inner1()%>
	<%=new Inner2()%>
</body>
</html>