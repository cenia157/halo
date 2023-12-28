package com.halo.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

public class HaloUtils {

	public static String setParam(HttpServletRequest request) {
		String param="";
		try {
			 param = request.getAttribute("paramName") +"="+ URLEncoder.encode( (String) request.getAttribute("param"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return param;
	}

}
