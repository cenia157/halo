package com.halo.user.introduce.album;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tokenServlet")
public class TokenServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 토큰을 서버 사이드에서 가져오는 로직 구현
		String token = "IGQWRQZAWR4ZA2Q5QVk3bVlMQnhmZADFLaUZANQ3RsZAlRoWWJQbWV1RGp6c3F3VUNXM0VFWlllOWx3V3d5aGF5N28zMDJWTU02djJmdTVzdGJYT3hTaGhyQllHNUticWZAMVkdkb2xyQnlOelVsTF82anJrMk9oSExHQ3cZD";

		// 토큰을 request 속성에 추가
		request.setAttribute("token", token);

		// JSP 페이지로 포워드
		request.getRequestDispatcher("${pageContext.request.contextPath}/user/introduce/album/").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
