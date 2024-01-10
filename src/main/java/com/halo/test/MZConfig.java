package com.halo.test;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MZConfig {

	public static void uploadFile(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			String path = request.getServletContext().getRealPath("admin/_js/ckeditor/file");
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
					new DefaultFileRenamePolicy());

			Enumeration<String> fileNames = mr.getFileNames();
			while (fileNames.hasMoreElements()) {

				
				String fileName = fileNames.nextElement();
				File file = mr.getFile(fileName);
				
				System.out.println("--------------------------------");
				System.out.println("MZConfig.java진입");
				System.out.println("파일경로 ::: " + file.getAbsolutePath());
				System.out.println("파일이름 :::: " + file.getName());
				System.out.println("--------------------------------");
				JSONObject jo = new JSONObject();
				jo.put("fName", "admin/_js/ckeditor/file/" + file.getName());
				response.setCharacterEncoding("UTF-8");
				response.setContentType("html/text ");
				response.getWriter().write(jo.toJSONString());

			}

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

} // end class















