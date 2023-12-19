package com.halo.test;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class Ck_DAO {

	public static void regNotice(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String txt = request.getParameter("txt");
		System.out.println(title);
		System.out.println(txt);

		// title 
		// txt
		// date

	}

}
