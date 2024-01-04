package com.halo.admin.boardmanagement.frequenthyask;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.halo.admin.boardmanagement.ask.QuestionNComment;
import com.halo.main.DBManagerhalo;
import com.halo.test.DBManagerhalo_YJ;

public class FAQDAO {

	private static ArrayList<FAQ> FAQs;
	
	public static void getAllFAQ(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "select * from QA_tbl order by qa_seq DESC";
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			FAQs = new ArrayList<>();
			FAQ faq;
			
			while (rs.next()) {
				int qa_seq = rs.getInt("qa_seq");
				String qa_title = rs.getString("qa_title");
				String qa_content = rs.getString("qa_content");
				Date qa_reg_date = rs.getDate("qa_reg_date");
			
			faq = new FAQ(qa_seq, qa_title, qa_content, qa_reg_date); 
			FAQs.add(faq);
			}
			
			request.setAttribute("FAQs", FAQs);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManagerhalo_YJ.close(con, pstmt, rs);
		}
		
		
	}
	
	public static void FAQpagingAdmin(int page, HttpServletRequest request) {
		
		request.setAttribute("curPageNo", page);
		System.out.println("page: " + page);
		
		int cnt = 8; 
		int total = FAQs.size(); 
		System.out.println("total ::: " + total );
		int pageCount = (int)Math.ceil((double)total / cnt);
		request.setAttribute("pageCount", pageCount);
		System.out.println("pageCount: "+pageCount);
		
		int start = total - (cnt * (page -1));
		System.out.println("start ::: " + start );
		
		int end = (page == pageCount) ? -1 : start - (cnt + 1);
		
		ArrayList<FAQ> items = new ArrayList<FAQ>();
		
		
		for (int i = start-1; i > end; i--) {
			items.add(FAQs.get(i));
		}
		
		request.setAttribute("FAQs", items);
		
	}
	
	public static void getFAQDetail(HttpServletRequest request, HttpServletResponse response) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM QA_tbl WHERE qa_seq = ?";
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("qa_seq"));
			rs = pstmt.executeQuery();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
