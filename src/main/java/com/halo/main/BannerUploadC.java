package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/BannerUploadC")
public class BannerUploadC extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//지금컨트롤러, 결과 파라미터
		MainpageDAO.getMdao().getAllHompage_common(request);
		//Admin page 메뉴(index.jsp) 안고가기 => 디스페쳐
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		request.setAttribute("menu", "/admin/homepageSetting/banner/bannerContent.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MainpageDAO.getMdao().uploadBanner(request);
	}

}
