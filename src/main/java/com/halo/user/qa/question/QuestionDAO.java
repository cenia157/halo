package com.halo.user.qa.question;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class QuestionDAO {
	
	public static void questionSubmit(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into question_tbl values (question_tbl_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?)";
		
		try {
			System.out.println("DAO");
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			String q_title = request.getParameter("q_title");
			String q_content = request.getParameter("q_content");
			String q_contact_number = request.getParameter("q_contact_number");
			String q_email = request.getParameter("q_email");
			String q_name = request.getParameter("q_name");
			String q_password = request.getParameter("q_password");
			String q_category = request.getParameter("q_category");
			
//			개발자 확인용
			System.out.println(q_title);
			System.out.println(q_content);
			System.out.println(q_contact_number);
			System.out.println(q_email);
			System.out.println(q_name);
			System.out.println(q_password);
			System.out.println(q_category);
//			개발자 확인용 끝
			
			pstmt.setString(1, q_title);
			pstmt.setString(2, q_content);
			pstmt.setString(3, q_contact_number);
			pstmt.setString(4, q_email);
			pstmt.setString(5, q_name);
			pstmt.setString(6, q_password);
			pstmt.setString(7, q_category);
			
			if (pstmt.executeUpdate() ==1) {
				System.out.println("Submit Success");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Submit Failed");
		}finally {	try {
		            if (pstmt != null) {
		                pstmt.close();
		            }
		            if (con != null) {
		                con.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		}
		
	}
	
	
	public static void getAllQuestions(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from question_tbl";
		
		ArrayList<Question> questions = new ArrayList<Question>();
		Question q = null;
		
		try {
				con = DBManager.connect();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int q_seq = rs.getInt("q_seq");
				String q_title = rs.getString("q_title");
				String q_content = rs.getString("q_content");
				Date q_reg_date = rs.getDate("q_reg_date");
				int q_contact_number = rs.getInt("q_contact_number");
				String q_email = rs.getString("q_email");
				String q_name = rs.getString("q_name");
				String q_password = rs.getString("q_password");
				String q_category = rs.getString("q_category");
				
				q = new Question(q_seq, q_title, q_content, q_reg_date, q_contact_number, q_email, q_name, q_password, q_category);
				questions.add(q);
			}
			
			request.setAttribute("questions", questions);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	public static void getQuestion(HttpServletRequest request) {
		
	}
	
}

