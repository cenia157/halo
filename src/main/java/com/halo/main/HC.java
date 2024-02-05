package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.halo.user.introduce.announcement.AnnouncedDAO;

@WebServlet("/HC")
public class HC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MainpageDAO.getMdao().getAllHompage_common(request);
		
		AnnouncedDAO.getMainAnnouncements(request);
//			request.setAttribute("menu", "user/menu-index.jsp");
//			request.setAttribute("subMenu", subMenu + ".jsp");
		request.setAttribute("menu", "home.jsp");
		request.setAttribute("modalSetting", 1);
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
