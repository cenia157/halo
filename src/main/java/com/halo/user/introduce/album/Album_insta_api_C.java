package com.halo.user.introduce.album;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Album_insta_api_C")
public class Album_insta_api_C extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 토큰을 서버 사이드에서 가져오는 로직 구현
		String token = "IGQWRQQmNnTXNaZA2hCMEtvUmhSSFhEUDJXSFF4dEsweU9tb2xiTmJReURSbVExUTVQcTJtQlhhZAFdyWnU3LTBSdms3RWRVNnVwa0ZAZAOVQxc2VjMGl1TjlPcE1yYVdJZAGxoNWZAOb1pGWnN4RzQzemtzMWdHYU84X28ZD";
		// 토큰을 request 속성에 추가
		request.setAttribute("token", token);
		request.setAttribute("menu", "user/menu-index.jsp");
		request.setAttribute("subMenu", "/user/introduce/album/album_contentPage.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
