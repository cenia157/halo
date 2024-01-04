package com.halo.admin.boardmanagement.frequenthyask;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.halo.main.DBManagerhalo;
import com.halo.test.DBManagerhalo_YJ;

public class FAQDAO {

	public static void getAllFAQ(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "select * from QA_tbl order by qa_seq DESC";
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("DB connected");
			
			ArrayList<FAQ> FAQs = new ArrayList<>();
			FAQ faq;
			
			System.out.println(rs.next());
			while (rs.next()) {
				int qa_seq = rs.getInt("qa_seq");
				String qa_title = rs.getString("qa_title");
				String qa_content = rs.getString("qa_content");
				Date qa_reg_date = rs.getDate("qa_reg_date");
			
			faq = new FAQ(qa_seq, qa_title, qa_content, qa_reg_date); 
			FAQs.add(faq);
			}
			
			request.setAttribute("FAQs", FAQs);
			System.out.println("faqList: "+FAQs);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManagerhalo_YJ.close(con, pstmt, rs);
		}
		
		
	}
	
}
