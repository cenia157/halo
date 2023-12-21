package com.halo.admin.boardmanagement.frequenthyask;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.halo.main.DBManagerhalo;

public class FAQDAO {

	public static void getAllFAQ(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "select * from QA_tbl";
		
		try {
			con = DBManagerhalo.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			FAQ faq = new FAQ();
			faq.setQa_seq(rs.getInt("qa_seq"));
			faq.setQa_title(rs.getString("qa_title"));
			faq.setQa_content(rs.getString("qa_content"));
			faq.setQa_reg_date(rs.getDate("qa_reg_date"));
			
			HttpSession hs = request.getSession();
			hs.setAttribute("faq", faq);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
