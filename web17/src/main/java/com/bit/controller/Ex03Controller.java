package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
	@WebServlet을 통해서 어노테이션을 설정하면
	자바코드를 고쳤지만 web.xml을 고친것과 같은 효과!
	-> 오류가 나면 서버 자체가 안켜진다!

	 * 주의해야할 사항
	1. / 안빼먹기
	2. url 주소 안겹치게 주의하기!
		=> url 주소가 겹친다 -> servlet-name이 중복되는 경우!
		 => 실행하자 말자 오류 발생! (오류가 안났다고 하더라도 그대로 쓰면 안됨!
	3. 메뉴설계도 그려서 url 주소 안겹치도록 주의하기!
	
	
	@WebServlet(name="/ex03.html") name으로 url을 줄 수도 있음!(그러나 1개만 들어 갈 수 있음)
	@WebServlet(value={"/ex03.html","/ex03.bit"})
	@WebServlet(value={"/ex03.html"})
	@WebServlet("/ex03.html") 다 가능!
 */
@WebServlet(value={"/ex03.html","/ex03.bit"}, initParams={
		@WebInitParam(name="key1", value="val1"),
		@WebInitParam(name="key2", value="val2")
})
public class Ex03Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String key1=getInitParameter("key1");
		String key2=getInitParameter("key2");
		System.out.println("ex03 controller...");
		System.out.println("key1:"+key1);
		System.out.println("key2:"+key2);
	}
}
