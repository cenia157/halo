package com.halo.user.qa.question;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.halo.main.DBManagerhalo;
import com.halo.test.DBManagerhalo_YJ;

public class QuestionDAO {
	
	public static void questionSubmit(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into question_tbl values (question_tbl_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?)";
		
		try {

			try {
				con = DBManagerhalo_YJ.connect();
				pstmt = con.prepareStatement(sql);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			pstmt.setString(1, request.getParameter("q_title"));
			pstmt.setString(2, request.getParameter("q_content"));
			pstmt.setString(3, request.getParameter("q_contact_number"));
			pstmt.setString(4, request.getParameter("q_email"));
			pstmt.setString(5, request.getParameter("q_name"));
			pstmt.setString(6, request.getParameter("q_password"));
			pstmt.setString(7, request.getParameter("q_category"));
			
			System.out.println(request.getParameter("q_title"));
			
			
			if (pstmt.executeUpdate() ==1) {
				System.out.println("제출성공");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("제출실패");
		}finally {	
			DBManagerhalo.close(con, pstmt, null);
		}
		
	}
	
	public static void getAllQuestions(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from question_tbl order by q_seq desc";
		
		
		try {
				con = DBManagerhalo_YJ.connect();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				List<Question> questions = new ArrayList<>();

				while (rs.next()) {
					Question question = new Question();
					question.setQ_seq(Integer.parseInt(rs.getString("q_seq")));
					question.setQ_title(rs.getString("q_title"));
					question.setQ_content(rs.getString("q_content"));
					question.setQ_reg_date(rs.getDate("q_reg_date"));
					question.setQ_contact_number(rs.getString("q_contact_number"));
					question.setQ_email(rs.getString("q_email"));
					question.setQ_name(rs.getString("q_name"));
					question.setQ_password(rs.getString("q_password"));
					question.setQ_category(rs.getString("q_category"));
					
					questions.add(question);
				}
				
				request.setAttribute("questions", questions);
				System.out.println(questions);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}

	public static void getQuestion(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from question_tbl where q_seq=?";
		
		String q_seq = request.getParameter("q_seq");
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, q_seq);
			rs = pstmt.executeQuery();
			

			if(rs.next()) {
					Question q = new Question();
					q.setQ_seq(rs.getInt("q_seq"));
					q.setQ_title(rs.getString("q_title"));
					q.setQ_content(rs.getString("q_content"));
					q.setQ_reg_date(rs.getDate("q_reg_date"));
					q.setQ_contact_number(rs.getString("q_contact_number"));
					q.setQ_email(rs.getString("q_email"));
					q.setQ_name(rs.getString("q_name"));
					q.setQ_password(rs.getString("q_password"));
					q.setQ_category("q_category");
					
					request.setAttribute("question", q);
				}
				
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	public static String getQuestionJson(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from question_tbl where q_seq=?";
		
		String q_seq = request.getParameter("q_seq");
		
		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, q_seq);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				JSONObject questionJson = new JSONObject();
				questionJson.put("q_seq", rs.getInt("q_seq"));
				questionJson.put("q_title", rs.getString("q_title"));
				questionJson.put("q_content", rs.getString("q_content"));
				questionJson.put("q_reg_date", rs.getDate("q_reg_date"));
				questionJson.put("q_contact_number", rs.getString("q_contact_number"));
				questionJson.put("q_email", rs.getString("q_email"));
				questionJson.put("q_name", rs.getString("q_name"));
				questionJson.put("q_password", rs.getString("q_password"));
				questionJson.put("q_category", rs.getString("q_category"));
				
				JSONArray jsonArray = new JSONArray();
				jsonArray.add(questionJson);
				System.out.println(jsonArray);
				return jsonArray.toString();
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return "failed";
		
	}

	public static void deleteQuestion(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from question_tbl where q_seq=?";
		
		try {
			try {
				con = DBManagerhalo_YJ.connect();
				pstmt = con.prepareStatement(sql);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			pstmt.setString(1, request.getParameter("q_seq"));
			
			if (pstmt.executeUpdate()==1) {
				System.out.println("삭제성공");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("삭제실패");
		}
		
	}
	
	public class QuestionComparator implements Comparator<Question> {
	    @Override
	    public int compare(Question q1, Question q2) {
	        // 시퀀스를 기준으로 오름차순 정렬
	        return Integer.compare(q1.getQ_seq(), q2.getQ_seq());
	    }
	}

	
    
}


