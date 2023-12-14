package com.halo.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServiceC")
public class ServiceC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String step = request.getParameter("step");
		if (step != null) {
			if (step.equals("1")) {
				request.setAttribute("serviceStep", "svcselect.jsp");
				request.setAttribute("step1Pos", "#ffdf6c");
			} else if (step.equals("2")) {
				request.setAttribute("serviceStep", "calselect.jsp");
				request.setAttribute("step2Pos", "#ffdf6c");
			} else if (step.equals("3")) {
				request.setAttribute("serviceStep", "timeselect.jsp");
				request.setAttribute("step3Pos", "#ffdf6c");
			} else if (step.equals("4")) {
				request.setAttribute("serviceStep", "nursingapply.jsp");
				request.setAttribute("step4Pos", "#ffdf6c");
			} else if (step.equals("4")) {
				request.setAttribute("serviceStep", "taxiapply.jsp");
				request.setAttribute("step5Pos", "#ffdf6c");
			} else if (step.equals("5")) {
				request.setAttribute("serviceStep", "agree.jsp");
				request.setAttribute("step5Pos", "#ffdf6c");
			} else if (step.equals("7")) {
				request.setAttribute("serviceStep", "complet.jsp");
				request.setAttribute("step6Pos", "#ffdf6c");
			}
			request.setAttribute("contentPage", "service/serviceApply/serviceApply.jsp");
			request.getRequestDispatcher("user/menu-index.jsp").forward(request, response);

		}else {
			
		}

		if (request.getParameter("link") != null) {
			if (request.getParameter("link").equals("7")) {
				request.setAttribute("contentPage", "service/serviceApply/serviceApply.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
