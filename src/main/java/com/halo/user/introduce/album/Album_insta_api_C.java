package com.halo.user.introduce.album;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;

@WebServlet("/Album_insta_api_C")
public class Album_insta_api_C extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// 토큰 보안을 위해서 프로퍼티 파일을 만들어서 사용
        String configPath = "/user/introduce/album/token_config.properties";
        String apiToken = TokenConfigReader.loadApiToken(configPath, getServletContext());
    
        request.setAttribute("apiToken", apiToken);
        request.setAttribute("menu", "user/menu-index.jsp");
        request.setAttribute("subMenu", "/user/introduce/album/album_contentPage.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
