package com.halo.user.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/NursingTexiC")
public class NursingTexiC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 문자인코딩형식
	request.setCharacterEncoding("UTF-8");
	SeviceApplyDAO.calSelect(request);
	SeviceApplyDAO.timeSelect(request);
	SeviceApplyDAO.nursingTexi(request);

	request.setAttribute("agree", "ApplyNursingTexiC");
	request.setAttribute("serviceStep", "agree.jsp");
	request.setAttribute("step5Pos", "#ffdf6c");
	request.setAttribute("menu", "user/menu-index.jsp");
	request.setAttribute("subMenu", "service/serviceApply/serviceApply.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	
	}

}