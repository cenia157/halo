package com.halo.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

@WebServlet("/ServiceC")
public class ServiceC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String step = request.getParameter("step");
		String svc = request.getParameter("svc");
		String svcSession = null;
		System.out.println(step);

		if (step == null) {
			step = "1";
		}
		
		if (svc != null) {
			System.out.println("세션 있어");
			svc = request.getParameter("svc");
			if (svc.equals("nursing")) {
				System.out.println("간호세션생성");
				session.setAttribute("svcSession", "nursing");
			}else if (svc.equals("texi")) {
				System.out.println("택시세션생성");
				session.setAttribute("svcSession", "texi");
			}else if (svc.equals("nursingTexi")) {
				System.out.println("간택세션생성");
				session.setAttribute("svcSession", "nursingTexi");
		}
			svcSession = (String) request.getSession().getAttribute("svcSession");
			System.out.println(svcSession);
		}
		if (step != null) {
			if (step.equals("1")) {
				session.setAttribute("step", "svcselect.jsp");
				request.setAttribute("serviceStep", "svcselect.jsp");
				request.setAttribute("step1Pos", "#ffdf6c");
			} else if (step.equals("2")) {
				request.setAttribute("serviceStep", "calselect.jsp");
				request.setAttribute("step2Pos", "#ffdf6c");
			} else if (step.equals("3")) {
				request.setAttribute("serviceStep", "timeselect.jsp");
				request.setAttribute("step3Pos", "#ffdf6c");
			} else if (step.equals("4") ) {
				request.setAttribute("step4Pos", "#ffdf6c");
				if (svcSession.equals("nursingTexi") && svcSession.equals("nursing")) {
					request.setAttribute("serviceStep", "nursingapply.jsp");
				}else if (svcSession.equals("nursingTexi") && svcSession.equals("texi")) {
					request.setAttribute("serviceStep", "taxiapply.jsp");
				}
			} else if (step.equals("6")) {
				request.setAttribute("serviceStep", "agree.jsp");
				request.setAttribute("step5Pos", "#ffdf6c");
			} else if (step.equals("7")) {
				request.setAttribute("serviceStep", "complet.jsp");
				request.setAttribute("step6Pos", "#ffdf6c");
			}
			request.setAttribute("menu", "user/menu-index.jsp");
			request.setAttribute("subMenu", "service/serviceApply/serviceApply.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);

		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
