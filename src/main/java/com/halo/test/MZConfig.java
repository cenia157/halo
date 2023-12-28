package com.halo.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MZConfig {

	public static void uploadFile(HttpServletRequest request, HttpServletResponse response) {
		try {

			
		String path = request.getServletContext().getRealPath("admin/_js/ckeditor/file");
		System.out.println(path);
		MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());
		
		String fName = mr.getFilesystemName("");
		
		JSONObject jo = new JSONObject();
		jo.put("fName", path + "/" + fName);
		response.setContentType("html/text");
		response.getWriter().write(jo.toJSONString());
		
		
		System.out.println(123123);
		
		
		
		
		
		
		
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
