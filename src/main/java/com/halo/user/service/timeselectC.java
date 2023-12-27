package com.halo.user.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/timeselectC")
public class timeselectC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	SeviceApplyDAO.timeSelect(request);
	
	// 세션 객체 가져오기
	HttpSession session = request.getSession();

	// 세션에서 데이터 불러오기
	String selectedService = (String) session.getAttribute("selectedService");
	String service = null;
	// 불러온 데이터 사용 예시
	if (selectedService != null) {
		if (selectedService.equals("texi")) {
			service = "texiapply";
		}else {
			if (selectedService.equals("nursingTexi")) {
				request.setAttribute("sevice", "NursingTexiC");
			}
			service = "nursingapply";
			request.setAttribute("sevice", "NursingApplyC");
		}
	    System.out.println("Selected Service: " + selectedService);
	} else {
	    System.out.println("No selected service found in session.");
	}
	
	request.setAttribute("serviceStep", service + ".jsp");
	request.setAttribute("step4Pos", "#ffdf6c");
	request.setAttribute("menu", "user/menu-index.jsp");
	request.setAttribute("subMenu", "service/serviceApply/serviceApply.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	
	}

}