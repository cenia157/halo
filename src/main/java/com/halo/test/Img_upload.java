package com.halo.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Img_upload")
public class Img_upload extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Collection<Part> parts = request.getParts();

		for (Part part : parts) {
			if ("upload".equals(part.getName())) {
				// 업로드된 파일에 접근
				InputStream fileContent = part.getInputStream();

				// 파일 처리 로직 구현
				// 예: 파일을 어딘가에 저장하거나 다른 처리 수행

				// 파일의 이름
				String fileName = getFileName(part);

				// 여기서 필요한 로직 수행
				// 예: 데이터베이스에 파일 정보 저장 등

				System.out.println("Received file: " + fileName);
			}
		}

		// 클라이언트에게 응답
		response.getWriter().write("File Upload Successful");
	}

	// Part에서 파일 이름을 추출하는 메서드
	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");
		for (String content : partHeader.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
