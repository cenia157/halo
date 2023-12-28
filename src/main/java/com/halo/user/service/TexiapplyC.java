package com.halo.user.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TexiapplyC")
public class TexiapplyC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	SeviceApplyDAO.calSelect(request);
	SeviceApplyDAO.timeSelect(request);
	SeviceApplyDAO.nursingApply(request);
	SeviceApplyDAO.texiApply(request);
	
	request.setAttribute("serviceStep", "agree.jsp");
	request.setAttribute("step4Pos", "#ffdf6c");
	request.setAttribute("menu", "user/menu-index.jsp");
	request.setAttribute("subMenu", "service/serviceApply/serviceApply.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	
	}

}