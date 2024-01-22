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
public class Img_uploadC곧지울거임 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Collection<Part> parts = request.getParts();

		for (Part part : parts) {
			if ("upload".equals(part.getName())) {
				// ���ε�� ���Ͽ� ����
				InputStream fileContent = part.getInputStream();

				// ���� ó�� ���� ����
				// ��: ������ ��򰡿� �����ϰų� �ٸ� ó�� ����

				// ������ �̸�
				String fileName = getFileName(part);

				// ���⼭ �ʿ��� ���� ����
				// ��: �����ͺ��̽��� ���� ���� ���� ��

				System.out.println("Received file: " + fileName);
			}
		}

		// Ŭ���̾�Ʈ���� ����
		response.getWriter().write("File Upload Successful");
	}

	// Part���� ���� �̸��� �����ϴ� �޼���
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
