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
		String token = "IGQWRPUUlmTElqTHpXNXZAxUE1SNTBHRS0tY2M2RUxWTXNFT2htWmhaX1JKdnFLOGhpTDVlZAjlNQVlySkM1ZAm1fVGg4cktRcVFfaVF4ZAnh3b3VnVXJMeENEOUZAxU1ZAhY2t1Um9wVFRXaHpBNkRwUmZA0WTkzc2FzeXcZD";
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
