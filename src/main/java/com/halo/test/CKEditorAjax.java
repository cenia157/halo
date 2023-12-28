package com.halo.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CKEditorAjax")
public class CKEditorAjax extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 이곳은 CKEditor에 올라온 이미지를 ajax로 보내는 역할을 한다. 만든이 : 선생님
		MZConfig.uploadFile(request, response);

	}

}
