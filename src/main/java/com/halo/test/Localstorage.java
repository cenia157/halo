package com.halo.test;





import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Localstorage")
public class Localstorage extends HttpServlet {
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws IOException {
	        // 현재 시간을 가져옴
	        String currentTime = new Date().toString();

	        // 사용자의 IP 주소를 가져옴
	        String userIpAddress = request.getHeader("X-Forwarded-For");
	        
	        // 가져온 시간과 사용자의 IP 주소를 콘솔에 출력
	        System.out.println("Page loaded at: " + currentTime);
	        System.out.println("User IP Address: " + userIpAddress);

	        
	        
	        
	        
	        
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO visitors (ip, user_agent) VALUES (?, ?)";

			try {
				con = DBManagerJW.connect();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, userIpAddress);
				pstmt.setString(2, currentTime);
				if (pstmt.executeUpdate() == 1) {
					System.out.println("등록성공");
					
				}
				

			} catch (Exception e) {
				e.printStackTrace();
			}
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        // 클라이언트에 응답
	        response.setContentType("text/plain");
	        PrintWriter out = response.getWriter();
	        out.println("Page loaded at: " + currentTime);
	        out.println("User IP Address: " + userIpAddress);;
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
