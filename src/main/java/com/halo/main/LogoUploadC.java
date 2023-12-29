package com.halo.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogoUploadC")
public class LogoUploadC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MainpageDAO.getMdao().getAllHompage_common(request);
		//지금컨트롤러, 결과 파라미터
		//Admin page 메뉴(index.jsp) 안고가기 => 디스페쳐
		request.setAttribute("menu", "/admin/homepageSetting/logo/logoContent.jsp");
		request.getRequestDispatcher("admin/index.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//바꿀 로고 이미지파일 미리보기로 보여주기
		MainpageDAO.getMdao().uploadLogo(request, response);

		
	}

}
