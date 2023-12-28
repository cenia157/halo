package com.halo.user.qa.question;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.halo.main.DBManagerhalo;
import com.halo.test.DBManagerhalo_YJ;

public class QuestionDAO {
	
	public static void questionSubmit(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into question_tbl values (question_tbl_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?)";
		
		try {

			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			
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
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManagerhalo_YJ.close(con, pstmt, rs);
		}
		
		
	}

	public static void getQuestion(HttpServletRequest request) {
		
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "select * from question_tbl where q_seq=?";

	    String q_seq = request.getParameter("q_seq"); // 수정된 부분

	    try {
	        con = DBManagerhalo_YJ.connect();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, q_seq);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            Question q = new Question();
	            q.setQ_seq(rs.getInt("q_seq"));
	            q.setQ_title(rs.getString("q_title"));
	            q.setQ_content(rs.getString("q_content"));
	            q.setQ_reg_date(rs.getDate("q_reg_date"));
	            q.setQ_contact_number(rs.getString("q_contact_number"));
	            q.setQ_email(rs.getString("q_email"));
	            q.setQ_name(rs.getString("q_name"));
	            q.setQ_password(rs.getString("q_password"));
	            q.setQ_category(rs.getString("q_category"));

	            request.setAttribute("question", q);
	            System.out.println("question: " + request.getAttribute("question"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBManagerhalo_YJ.close(con, pstmt, rs);
	    }
	}

	public static String questionList(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Question> questionList = new ArrayList<>();
		String jsonResult = null;
		
		int q_seq = 0;
		String q_title = null;
		String q_content = null;
		Date q_reg_date = null;
		String q_contact_number = null;
		String q_email = null;
		String q_name = null;
		String q_password = null;
		String q_category = null;
		
		String sql = "select * from question_tbl where q_seq=?";
		response.setContentType("application/json");

		try {
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("q_seq"));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				q_seq = rs.getInt(1);
				q_title = rs.getString(2);
				q_content = rs.getString(3);
				q_reg_date = rs.getDate(4);
				q_contact_number = rs.getString(5);
				q_email = rs.getString(6);
				q_name = rs.getString(7);
				q_password = rs.getString(8);
				q_category = rs.getString(9);
				
				Question question = new Question(q_seq, q_title, q_content, q_reg_date, q_contact_number, q_email, q_name, q_password, q_category);
                questionList.add(question);
                
                System.out.println("question: " + question);
				
	            try {
	            	ObjectMapper objectMapper = new ObjectMapper();
					jsonResult = objectMapper.writeValueAsString(questionList);
					System.out.println("JSON: "+jsonResult);
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManagerhalo_YJ.close(con, pstmt, rs);
		}
		return jsonResult;
	}
	
	
	public ArrayList<Question> questions() {
		String sql = "select from question_tbl";
		ArrayList<Question> questionsArray = new ArrayList<Question>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			con = DBManagerhalo_YJ.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Question question = new Question();
	            question.setQ_seq(rs.getInt(1));
	            question.setQ_title(rs.getString(2));
	            question.setQ_content(rs.getString(3));
	            question.setQ_reg_date(rs.getDate(4));
	            question.setQ_contact_number(rs.getString(5));
	            question.setQ_email(rs.getString(6));
	            question.setQ_name(rs.getString(7));
	            question.setQ_password(rs.getString(8));
	            question.setQ_category(rs.getString(9));
	            
	            questionsArray.add(question);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManagerhalo_YJ.close(con, pstmt, rs);
		}
		return questionsArray;
		
	}
	




	public static void deleteQuestionNComment(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmtQ = null;
		PreparedStatement pstmtC = null;
		
		try {
			con = DBManagerhalo_YJ.connect();

			// 먼저 comment_tbl에서 해당 q_seq 값을 가진 레코드 삭제
			String sqlC = "DELETE FROM comment_tbl WHERE q_seq=?";
			pstmtC = con.prepareStatement(sqlC);
			pstmtC.setInt(1, Integer.parseInt(request.getParameter("q_seq")));
			pstmtC.executeUpdate(); // comment_tbl에서 레코드 삭제

			// 이후 question_tbl에서 q_seq 값을 가진 레코드 삭제
			String sqlQ = "DELETE FROM question_tbl WHERE q_seq=?";
			pstmtQ = con.prepareStatement(sqlQ);
			pstmtQ.setInt(1, Integer.parseInt(request.getParameter("q_seq")));
			pstmtQ.executeUpdate(); // question_tbl에서 레코드 삭제

			
			if (pstmtQ.executeUpdate()==1) {
				System.out.println("Q삭제성공");
			} if (pstmtC.executeUpdate()==1) {
				System.out.println("C삭제성공");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("삭제실패");
		} finally {
			DBManagerhalo_YJ.close(con, pstmtC, null);
		}
		
	}
	

	
    
}


